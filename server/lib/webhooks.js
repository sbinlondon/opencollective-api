import { pick } from 'lodash';
import { activities } from '../constants';

/**
 * Filter collective public information, returning a minimal subset for incognito users
 */
const getCollectiveInfo = collective => {
  if (!collective) {
    return null;
  } else if (collective.isIncognito) {
    return pick(collective, ['type', 'name', 'image', 'previewImage']);
  } else {
    return pick(collective, [
      'id',
      'type',
      'slug',
      'name',
      'company',
      'website',
      'twitterHandle',
      'githubHandle',
      'description',
      'previewImage',
      'image',
    ]);
  }
};

/**
 * Sanitize an activity to make it suitable for posting on external webhooks
 */
export const sanitizeActivity = activity => {
  // Fields commons to all activity types
  const cleanActivity = pick(activity, ['createdAt', 'id', 'type', 'CollectiveId']);
  const type = cleanActivity.type;

  // Alway have an empty data object for activity
  cleanActivity.data = {};

  // Filter data based on activity type
  if (type === activities.COLLECTIVE_TRANSACTION_CREATED) {
    cleanActivity.data = pick(activity.data, ['transaction.amount', 'transaction.currency']);
    cleanActivity.data.fromCollective = getCollectiveInfo(activity.data.fromCollective);
  } else if (type === activities.COLLECTIVE_UPDATE_PUBLISHED) {
    cleanActivity.data = pick(activity.data, [
      'update.html',
      'update.title',
      'update.slug',
      'update.tags',
      'update.isPrivate',
    ]);
  } else if (type === activities.COLLECTIVE_EXPENSE_CREATED) {
    cleanActivity.data = pick(activity.data, [
      'expense.id',
      'expense.description',
      'expense.amount',
      'expense.currency',
    ]);
    cleanActivity.data.fromCollective = getCollectiveInfo(activity.data.fromCollective);
  } else if (type === activities.COLLECTIVE_MEMBER_CREATED) {
    cleanActivity.data = pick(activity.data, [
      'member.role',
      'member.description',
      'member.since',
      'order.id',
      'order.totalAmount',
      'order.currency',
      'order.description',
    ]);
    cleanActivity.data.member.memberCollective = getCollectiveInfo(activity.data.member.memberCollective);
  }

  return cleanActivity;
};
