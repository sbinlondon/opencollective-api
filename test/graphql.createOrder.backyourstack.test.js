import sinon from 'sinon';
import nock from 'nock';
import { expect } from 'chai';
import { cloneDeep } from 'lodash';

import models from '../server/models';

import * as utils from './utils';
import * as store from './stores';

import initNock from './nocks/graphql.createOrder.backyourstack.nock';

const baseOrder = Object.freeze({
  quantity: 1,
  interval: null,
  totalAmount: 20000,
  paymentMethod: {
    name: '4242',
    token: 'tok_1B5j8xDjPFcHOcTm3ogdnq0K',
    data: {
      expMonth: 10,
      expYear: 2023,
      brand: 'Visa',
      country: 'US',
      funding: 'credit',
    },
  },
  collective: {
    id: null,
  },
});

const createOrderQuery = `
  mutation createOrder($order: OrderInputType!) {
    createOrder(order: $order) {
      id
      status
      description
      createdByUser {
        id
      }
      paymentMethod {
        id
      }
      totalAmount
      fromCollective {
        id
        slug
        name
        website
      }
      collective {
        id
        slug
        currency
      }
      subscription {
        id
        amount
        interval
        isActive
        stripeSubscriptionId
      }
    }
  }
  `;

const backyourstackDispatchOrder = `
  mutation backyourstackDispatchOrder($id: Int!) {
    backyourstackDispatchOrder(id: $id) {
      dispatching
    }
  }
  `;

const constants = Object.freeze({
  paymentMethod: {
    name: 'payment method',
    service: 'stripe',
    type: 'creditcard',
    data: {
      expMonth: 11,
      expYear: 2025,
    },
  },
});

describe('createOrder', () => {
  let sandbox, backyourstackCollective, xdamman, orderCreated;

  before(async () => {
    await utils.resetTestDB();
    sandbox = sinon.createSandbox();

    initNock();

    // Given a user
    xdamman = (await store.newUser('xdamman')).user;
    // Given a collective (with a host)
    const newCollectiveWithHost = await store.newCollectiveWithHost('backyourstack', 'USD', 'USD', 5);
    backyourstackCollective = newCollectiveWithHost.backyourstack;
    // And the above collective's host has a stripe account
    await store.stripeConnectedAccount(backyourstackCollective.HostCollectiveId);
    // And given that the above collective is active
    await backyourstackCollective.update({ isActive: true });

    // This add a new tier and removes the "sponsors" tier
    backyourstackCollective.editTiers([
      {
        id: 1,
        slug: 'monthly-plan',
        name: 'BackYourStack Monthly Plan',
        amount: 20000,
      },
    ]);

    // And given that the endpoint for creating customers on Stripe
    // is patched
    utils.stubStripeCreate(sandbox, {
      charge: {
        currency: 'usd',
        status: 'succeeded',
      },
      paymentIntent: {
        charges: { data: [{ id: 'ch_1AzPXHD8MNtzsDcgXpUhv4pm', currency: 'usd', status: 'succeeded' }] },
        status: 'succeeded',
      },
    });
    // And given the stripe stuff that depends on values in the
    // order struct is patch. It's here and not on each test because
    // the `totalAmount' field doesn't change throught the tests.
    utils.stubStripeBalance(sandbox, baseOrder.totalAmount, 'usd', Math.round(baseOrder.totalAmount * 0.05), 610); // This is the payment processor fee.
  });

  // alance(sandbox, amount, currency, applicationFee = 0, stripeFee = 0)

  after(() => {
    sandbox.restore();

    nock.cleanAll();
  });

  // describe('monthly plan', () => {
  it('creates a recurring donation as logged in user', async () => {
    const order = cloneDeep(baseOrder);
    // And the parameters for the query
    order.fromCollective = { id: xdamman.CollectiveId };
    order.paymentMethod = {
      ...constants.paymentMethod,
      token: 'tok_1B5j8xDjPFcHOcTm3ogdnq0K',
    };
    order.interval = 'month';
    // order.totalAmount = 1000;
    order.collective = { id: backyourstackCollective.id };
    order.customData = { jsonUrl: 'https://backyourstack.com/578a0a70-cef3-11e9-82be-21fd8ed699cb/file/backing.json' };
    order.tier = { id: 1 };

    // When the order is created
    const res = await utils.graphqlQuery(createOrderQuery, { order }, xdamman);

    // There should be no errors
    res.errors && console.error(res.errors);
    expect(res.errors).to.not.exist;

    // Then the created transaction should match the requested data
    orderCreated = res.data.createOrder;
    const { collective, subscription } = orderCreated;

    expect(subscription.interval).to.equal('month');
    expect(subscription.isActive).to.be.true;
    expect(subscription.amount).to.equal(order.totalAmount);

    const transaction = await models.Transaction.findOne({
      where: {
        CollectiveId: collective.id,
        FromCollectiveId: xdamman.CollectiveId,
        amount: order.totalAmount,
      },
    });

    // make sure the transaction has been recorded
    expect(transaction.FromCollectiveId).to.equal(xdamman.CollectiveId);
    expect(transaction.CollectiveId).to.equal(collective.id);
    expect(transaction.currency).to.equal(collective.currency);
    const createdOrder = await models.Order.findByPk(res.data.createOrder.id);
    expect(createdOrder.status).to.equal('ACTIVE');
  });

  it('it dispatch the donation accross dependencies', async () => {
    // When the order is created
    const res = await utils.graphqlQuery(backyourstackDispatchOrder, { id: orderCreated.id }, xdamman);
    // There should be no errors
    res.errors && console.error(res.errors);
    expect(res.errors).to.not.exist;
  });
});
