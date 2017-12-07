toc.dat                                                                                             0000600 0004000 0002000 00000176160 13212311737 0014452 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       2                    u            wwcode_test    9.6.6    10.1 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false         �           1262    26919905    wwcode_test    DATABASE     }   CREATE DATABASE wwcode_test WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE wwcode_test;
             opencollective    false                     2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false         �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    4                     3079    12655    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false         �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1                     3079    26864548    postgis 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
    DROP EXTENSION postgis;
                  false    4         �           0    0    EXTENSION postgis    COMMENT     g   COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';
                       false    2         '           1247    26891632    enum_Groups_membership_type    TYPE     i   CREATE TYPE "enum_Groups_membership_type" AS ENUM (
    'donation',
    'monthlyfee',
    'yearlyfee'
);
 0   DROP TYPE public."enum_Groups_membership_type";
       public       xdamman    false    4         *           1247    26891640    enum_UserGroups_role    TYPE     X   CREATE TYPE "enum_UserGroups_role" AS ENUM (
    'admin',
    'writer',
    'viewer'
);
 )   DROP TYPE public."enum_UserGroups_role";
       public       xdamman    false    4         �            1259    26891647 
   Activities    TABLE     �   CREATE TABLE "Activities" (
    id integer NOT NULL,
    type character varying(255),
    data json,
    "createdAt" timestamp with time zone,
    "CollectiveId" integer,
    "UserId" integer,
    "TransactionId" integer
);
     DROP TABLE public."Activities";
       public         opencollective    false    4         �            1259    26891653    Activities_id_seq    SEQUENCE     u   CREATE SEQUENCE "Activities_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Activities_id_seq";
       public       opencollective    false    4    201         �           0    0    Activities_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE "Activities_id_seq" OWNED BY "Activities".id;
            public       opencollective    false    202         �            1259    26891655    PaymentMethods    TABLE     �  CREATE TABLE "PaymentMethods" (
    id integer NOT NULL,
    name character varying(255),
    token character varying(255),
    "customerId" character varying(255),
    service character varying(255) DEFAULT 'stripe'::character varying,
    data json,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "confirmedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "CreatedByUserId" integer,
    "expiryDate" timestamp with time zone,
    uuid uuid,
    "CollectiveId" integer,
    "archivedAt" timestamp with time zone,
    "monthlyLimitPerMember" integer,
    "primary" boolean DEFAULT false,
    currency character varying(3)
);
 $   DROP TABLE public."PaymentMethods";
       public         opencollective    false    4         �            1259    26891663    Cards_id_seq    SEQUENCE     p   CREATE SEQUENCE "Cards_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Cards_id_seq";
       public       opencollective    false    203    4         �           0    0    Cards_id_seq    SEQUENCE OWNED BY     <   ALTER SEQUENCE "Cards_id_seq" OWNED BY "PaymentMethods".id;
            public       opencollective    false    204         �            1259    26891665    CollectiveHistories    TABLE     (  CREATE TABLE "CollectiveHistories" (
    id integer,
    name character varying(255),
    description character varying(255),
    currency character varying(255),
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "isActive" boolean,
    "longDescription" text,
    image character varying(255),
    slug character varying(255),
    website character varying(255),
    "twitterHandle" character varying(255),
    mission character varying(255),
    "backgroundImage" character varying(255),
    "hostFeePercent" double precision,
    settings json,
    data json,
    tags character varying(255)[],
    "isSupercollective" boolean,
    "LastEditedByUserId" integer,
    hid bigint NOT NULL,
    "archivedAt" timestamp with time zone NOT NULL,
    "CreatedByUserId" integer,
    "HostCollectiveId" integer,
    "ParentCollectiveId" integer,
    type character varying(255) DEFAULT 'COLLECTIVE'::character varying,
    "startsAt" timestamp with time zone,
    "endsAt" timestamp with time zone,
    "locationName" character varying(255),
    address character varying(255),
    timezone character varying(255),
    "maxAmount" integer,
    "maxQuantity" integer,
    "geoLocationLatLong" geometry(Point),
    company character varying(255)
);
 )   DROP TABLE public."CollectiveHistories";
       public         opencollective    false    2    4    2    4    2    4    2    4    2    4    2    4    2    4    2    4    4         �            1259    26891672    Collectives    TABLE     "  CREATE TABLE "Collectives" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    currency character varying(255) DEFAULT 'USD'::character varying,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "isActive" boolean DEFAULT false,
    "longDescription" text,
    image character varying(255),
    slug character varying(255),
    website character varying(255),
    "twitterHandle" character varying(255),
    mission character varying(128),
    "backgroundImage" character varying(255),
    "hostFeePercent" double precision,
    settings json,
    data json,
    tags character varying(255)[],
    "isSupercollective" boolean DEFAULT false,
    "LastEditedByUserId" integer,
    "CreatedByUserId" integer,
    "HostCollectiveId" integer,
    "ParentCollectiveId" integer,
    type character varying(255) DEFAULT 'COLLECTIVE'::character varying,
    "startsAt" timestamp with time zone,
    "endsAt" timestamp with time zone,
    "locationName" character varying(255),
    address character varying(255),
    timezone character varying(255),
    "maxAmount" integer,
    "maxQuantity" integer,
    "geoLocationLatLong" geometry(Point),
    company character varying(255)
);
 !   DROP TABLE public."Collectives";
       public         opencollective    false    4    2    4    2    4    2    4    2    4    2    4    2    4    2    4    2    4         �            1259    26891682    ConnectedAccounts    TABLE     �  CREATE TABLE "ConnectedAccounts" (
    id integer NOT NULL,
    service character varying(255),
    username character varying(255),
    "clientId" character varying(255),
    token character varying(255),
    data json,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "CreatedByUserId" integer,
    "CollectiveId" integer,
    "refreshToken" character varying(255)
);
 '   DROP TABLE public."ConnectedAccounts";
       public         opencollective    false    4         �            1259    26891688    ConnectedAccounts_id_seq    SEQUENCE     |   CREATE SEQUENCE "ConnectedAccounts_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."ConnectedAccounts_id_seq";
       public       opencollective    false    4    207         �           0    0    ConnectedAccounts_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE "ConnectedAccounts_id_seq" OWNED BY "ConnectedAccounts".id;
            public       opencollective    false    208         �            1259    26891690    Orders    TABLE     q  CREATE TABLE "Orders" (
    id integer NOT NULL,
    "CreatedByUserId" integer,
    "CollectiveId" integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "totalAmount" integer,
    description character varying(255),
    "SubscriptionId" integer,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "PaymentMethodId" integer,
    "processedAt" timestamp with time zone,
    "privateMessage" text,
    "TierId" integer,
    "FromCollectiveId" integer,
    "publicMessage" character varying(255),
    quantity integer
);
    DROP TABLE public."Orders";
       public         opencollective    false    4         �            1259    26891697    Donations_id_seq    SEQUENCE     t   CREATE SEQUENCE "Donations_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Donations_id_seq";
       public       opencollective    false    4    209         �           0    0    Donations_id_seq    SEQUENCE OWNED BY     8   ALTER SEQUENCE "Donations_id_seq" OWNED BY "Orders".id;
            public       opencollective    false    210         �            1259    26891699    ExpenseHistories    TABLE     �  CREATE TABLE "ExpenseHistories" (
    id integer,
    "UserId" integer,
    "CollectiveId" integer,
    currency character varying(255),
    amount integer,
    description character varying(255),
    "payoutMethod" character varying(255),
    "privateMessage" text,
    attachment character varying(255),
    category character varying(255),
    vat integer,
    "lastEditedById" integer,
    status character varying(255),
    "incurredAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    hid bigint NOT NULL,
    "archivedAt" timestamp with time zone NOT NULL
);
 &   DROP TABLE public."ExpenseHistories";
       public         opencollective    false    4         �            1259    26891705    ExpenseHistories_hid_seq    SEQUENCE     |   CREATE SEQUENCE "ExpenseHistories_hid_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."ExpenseHistories_hid_seq";
       public       opencollective    false    4    211         �           0    0    ExpenseHistories_hid_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE "ExpenseHistories_hid_seq" OWNED BY "ExpenseHistories".hid;
            public       opencollective    false    212         �            1259    26891707    Expenses    TABLE     �  CREATE TABLE "Expenses" (
    id integer NOT NULL,
    "UserId" integer,
    "CollectiveId" integer,
    currency character varying(255) NOT NULL,
    amount integer NOT NULL,
    description character varying(255) NOT NULL,
    "privateMessage" text,
    attachment character varying(255),
    category character varying(255),
    vat integer,
    "lastEditedById" integer,
    status character varying(255) DEFAULT 'PENDING'::character varying NOT NULL,
    "incurredAt" timestamp with time zone NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deletedAt" timestamp with time zone,
    "payoutMethod" character varying(255) NOT NULL
);
    DROP TABLE public."Expenses";
       public         opencollective    false    4         �            1259    26891714    Expenses_id_seq    SEQUENCE     s   CREATE SEQUENCE "Expenses_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Expenses_id_seq";
       public       opencollective    false    213    4         �           0    0    Expenses_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE "Expenses_id_seq" OWNED BY "Expenses".id;
            public       opencollective    false    214         �            1259    26891716    GroupHistories_hid_seq    SEQUENCE     z   CREATE SEQUENCE "GroupHistories_hid_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."GroupHistories_hid_seq";
       public       opencollective    false    205    4         �           0    0    GroupHistories_hid_seq    SEQUENCE OWNED BY     L   ALTER SEQUENCE "GroupHistories_hid_seq" OWNED BY "CollectiveHistories".hid;
            public       opencollective    false    215         �            1259    26891718    Groups_id_seq    SEQUENCE     q   CREATE SEQUENCE "Groups_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Groups_id_seq";
       public       opencollective    false    206    4         �           0    0    Groups_id_seq    SEQUENCE OWNED BY     :   ALTER SEQUENCE "Groups_id_seq" OWNED BY "Collectives".id;
            public       opencollective    false    216         �            1259    26891720    Members    TABLE     �  CREATE TABLE "Members" (
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "CreatedByUserId" integer NOT NULL,
    "CollectiveId" integer NOT NULL,
    role character varying(255) DEFAULT 'MEMBER'::character varying NOT NULL,
    id integer NOT NULL,
    description character varying(255),
    "MemberCollectiveId" integer,
    "TierId" integer
);
    DROP TABLE public."Members";
       public         opencollective    false    4         �            1259    26891727    Notifications    TABLE     r  CREATE TABLE "Notifications" (
    id integer NOT NULL,
    channel character varying(255) DEFAULT 'email'::character varying,
    type character varying(255),
    active boolean DEFAULT true,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "UserId" integer,
    "CollectiveId" integer,
    "webhookUrl" character varying(255)
);
 #   DROP TABLE public."Notifications";
       public         opencollective    false    4         �            1259    26891735    SequelizeMeta    TABLE     K   CREATE TABLE "SequelizeMeta" (
    name character varying(255) NOT NULL
);
 #   DROP TABLE public."SequelizeMeta";
       public         opencollective    false    4         �            1259    26891738    Sessions    TABLE     �   CREATE TABLE "Sessions" (
    sid character varying(32) NOT NULL,
    expires timestamp with time zone,
    data text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Sessions";
       public         opencollective    false    4         �            1259    26891744    Subscriptions    TABLE       CREATE TABLE "Subscriptions" (
    id integer NOT NULL,
    amount integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "interval" character varying(8) DEFAULT NULL::character varying,
    "isActive" boolean DEFAULT false,
    data json,
    "stripeSubscriptionId" character varying(255),
    "activatedAt" timestamp with time zone,
    "deactivatedAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone
);
 #   DROP TABLE public."Subscriptions";
       public         opencollective    false    4         �            1259    26891753    Subscriptions_id_seq    SEQUENCE     x   CREATE SEQUENCE "Subscriptions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Subscriptions_id_seq";
       public       opencollective    false    4    218         �           0    0    Subscriptions_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE "Subscriptions_id_seq" OWNED BY "Notifications".id;
            public       opencollective    false    222         �            1259    26891755    Subscriptions_id_seq1    SEQUENCE     y   CREATE SEQUENCE "Subscriptions_id_seq1"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Subscriptions_id_seq1";
       public       opencollective    false    4    221         �           0    0    Subscriptions_id_seq1    SEQUENCE OWNED BY     D   ALTER SEQUENCE "Subscriptions_id_seq1" OWNED BY "Subscriptions".id;
            public       opencollective    false    223         �            1259    26891757    Tiers    TABLE       CREATE TABLE "Tiers" (
    id integer NOT NULL,
    name character varying(255),
    description character varying(510),
    amount integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "maxQuantity" integer,
    password character varying(255),
    "startsAt" timestamp with time zone,
    "endsAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    slug character varying(255),
    "maxQuantityPerUser" integer,
    goal integer,
    type character varying(255) DEFAULT 'TICKET'::character varying,
    "CollectiveId" integer,
    "interval" character varying(8) DEFAULT NULL::character varying,
    button character varying(255),
    presets json
);
    DROP TABLE public."Tiers";
       public         opencollective    false    4         �            1259    26891766    Tiers_id_seq    SEQUENCE     p   CREATE SEQUENCE "Tiers_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Tiers_id_seq";
       public       opencollective    false    4    224         �           0    0    Tiers_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE "Tiers_id_seq" OWNED BY "Tiers".id;
            public       opencollective    false    225         �            1259    26891768    Transactions    TABLE     �  CREATE TABLE "Transactions" (
    id integer NOT NULL,
    type character varying(255),
    description character varying(255),
    amount integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone NOT NULL,
    "CollectiveId" integer,
    "CreatedByUserId" integer,
    "PaymentMethodId" integer,
    "deletedAt" timestamp with time zone,
    data json,
    "OrderId" integer,
    "platformFeeInHostCurrency" integer,
    "hostFeeInHostCurrency" integer,
    "paymentProcessorFeeInHostCurrency" integer,
    "hostCurrency" character varying(255),
    "hostCurrencyFxRate" double precision,
    "amountInHostCurrency" integer,
    "netAmountInCollectiveCurrency" integer,
    "ExpenseId" integer,
    uuid uuid,
    "FromCollectiveId" integer,
    "HostCollectiveId" integer,
    "TransactionGroup" uuid
);
 "   DROP TABLE public."Transactions";
       public         opencollective    false    4         �            1259    26891775    Transactions_id_seq    SEQUENCE     w   CREATE SEQUENCE "Transactions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Transactions_id_seq";
       public       opencollective    false    4    226         �           0    0    Transactions_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE "Transactions_id_seq" OWNED BY "Transactions".id;
            public       opencollective    false    227         �            1259    26891777    UserGroups_id_seq    SEQUENCE     u   CREATE SEQUENCE "UserGroups_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."UserGroups_id_seq";
       public       opencollective    false    4    217         �           0    0    UserGroups_id_seq    SEQUENCE OWNED BY     :   ALTER SEQUENCE "UserGroups_id_seq" OWNED BY "Members".id;
            public       opencollective    false    228         �            1259    26891779    Users    TABLE       CREATE TABLE "Users" (
    id integer NOT NULL,
    email character varying(255),
    _salt character varying(255) DEFAULT '$2a$10$JqAcT6sBbBs5pO9FkwqLEu'::character varying,
    refresh_token character varying(255) DEFAULT '$2a$10$IHs8e8FdK1.bqjvZxr4Zvu'::character varying,
    password_hash character varying(255),
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "seenAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "paypalEmail" character varying(255),
    "resetPasswordTokenHash" character varying(255),
    "resetPasswordSentAt" timestamp with time zone,
    "firstName" character varying(128),
    "lastName" character varying(128),
    "billingAddress" character varying(255),
    "CollectiveId" integer
);
    DROP TABLE public."Users";
       public         opencollective    false    4         �            1259    26891787    Users_id_seq    SEQUENCE     p   CREATE SEQUENCE "Users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Users_id_seq";
       public       opencollective    false    229    4         �           0    0    Users_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE "Users_id_seq" OWNED BY "Users".id;
            public       opencollective    false    230         �           0    0    geography_columns    ACL     8   GRANT ALL ON TABLE geography_columns TO opencollective;
            public       xdamman    false    189         �           0    0    geometry_columns    ACL     7   GRANT ALL ON TABLE geometry_columns TO opencollective;
            public       xdamman    false    190         �           0    0    raster_columns    ACL     5   GRANT ALL ON TABLE raster_columns TO opencollective;
            public       xdamman    false    199         �           0    0    raster_overviews    ACL     7   GRANT ALL ON TABLE raster_overviews TO opencollective;
            public       xdamman    false    200         �           0    0    spatial_ref_sys    ACL     �   REVOKE ALL ON TABLE spatial_ref_sys FROM xdamman;
REVOKE SELECT ON TABLE spatial_ref_sys FROM PUBLIC;
GRANT ALL ON TABLE spatial_ref_sys TO opencollective;
GRANT SELECT ON TABLE spatial_ref_sys TO PUBLIC;
            public       opencollective    false    187         �           2604    26891789    Activities id    DEFAULT     d   ALTER TABLE ONLY "Activities" ALTER COLUMN id SET DEFAULT nextval('"Activities_id_seq"'::regclass);
 >   ALTER TABLE public."Activities" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    202    201         �           2604    26891790    CollectiveHistories hid    DEFAULT     s   ALTER TABLE ONLY "CollectiveHistories" ALTER COLUMN hid SET DEFAULT nextval('"GroupHistories_hid_seq"'::regclass);
 H   ALTER TABLE public."CollectiveHistories" ALTER COLUMN hid DROP DEFAULT;
       public       opencollective    false    215    205         �           2604    26891791    Collectives id    DEFAULT     a   ALTER TABLE ONLY "Collectives" ALTER COLUMN id SET DEFAULT nextval('"Groups_id_seq"'::regclass);
 ?   ALTER TABLE public."Collectives" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    216    206         �           2604    26891792    ConnectedAccounts id    DEFAULT     r   ALTER TABLE ONLY "ConnectedAccounts" ALTER COLUMN id SET DEFAULT nextval('"ConnectedAccounts_id_seq"'::regclass);
 E   ALTER TABLE public."ConnectedAccounts" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    208    207         �           2604    26891793    ExpenseHistories hid    DEFAULT     r   ALTER TABLE ONLY "ExpenseHistories" ALTER COLUMN hid SET DEFAULT nextval('"ExpenseHistories_hid_seq"'::regclass);
 E   ALTER TABLE public."ExpenseHistories" ALTER COLUMN hid DROP DEFAULT;
       public       opencollective    false    212    211         �           2604    26891794    Expenses id    DEFAULT     `   ALTER TABLE ONLY "Expenses" ALTER COLUMN id SET DEFAULT nextval('"Expenses_id_seq"'::regclass);
 <   ALTER TABLE public."Expenses" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    214    213         �           2604    26891795 
   Members id    DEFAULT     a   ALTER TABLE ONLY "Members" ALTER COLUMN id SET DEFAULT nextval('"UserGroups_id_seq"'::regclass);
 ;   ALTER TABLE public."Members" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    228    217         �           2604    26891796    Notifications id    DEFAULT     j   ALTER TABLE ONLY "Notifications" ALTER COLUMN id SET DEFAULT nextval('"Subscriptions_id_seq"'::regclass);
 A   ALTER TABLE public."Notifications" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    222    218         �           2604    26891797 	   Orders id    DEFAULT     _   ALTER TABLE ONLY "Orders" ALTER COLUMN id SET DEFAULT nextval('"Donations_id_seq"'::regclass);
 :   ALTER TABLE public."Orders" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    210    209         �           2604    26891798    PaymentMethods id    DEFAULT     c   ALTER TABLE ONLY "PaymentMethods" ALTER COLUMN id SET DEFAULT nextval('"Cards_id_seq"'::regclass);
 B   ALTER TABLE public."PaymentMethods" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    204    203         �           2604    26891799    Subscriptions id    DEFAULT     k   ALTER TABLE ONLY "Subscriptions" ALTER COLUMN id SET DEFAULT nextval('"Subscriptions_id_seq1"'::regclass);
 A   ALTER TABLE public."Subscriptions" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    223    221         �           2604    26891800    Tiers id    DEFAULT     Z   ALTER TABLE ONLY "Tiers" ALTER COLUMN id SET DEFAULT nextval('"Tiers_id_seq"'::regclass);
 9   ALTER TABLE public."Tiers" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    225    224         �           2604    26891801    Transactions id    DEFAULT     h   ALTER TABLE ONLY "Transactions" ALTER COLUMN id SET DEFAULT nextval('"Transactions_id_seq"'::regclass);
 @   ALTER TABLE public."Transactions" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    227    226         �           2604    26891802    Users id    DEFAULT     Z   ALTER TABLE ONLY "Users" ALTER COLUMN id SET DEFAULT nextval('"Users_id_seq"'::regclass);
 9   ALTER TABLE public."Users" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    230    229         �          0    26891647 
   Activities 
   TABLE DATA               g   COPY "Activities" (id, type, data, "createdAt", "CollectiveId", "UserId", "TransactionId") FROM stdin;
    public       opencollective    false    201       4001.dat �          0    26891665    CollectiveHistories 
   TABLE DATA               �  COPY "CollectiveHistories" (id, name, description, currency, "createdAt", "updatedAt", "deletedAt", "isActive", "longDescription", image, slug, website, "twitterHandle", mission, "backgroundImage", "hostFeePercent", settings, data, tags, "isSupercollective", "LastEditedByUserId", hid, "archivedAt", "CreatedByUserId", "HostCollectiveId", "ParentCollectiveId", type, "startsAt", "endsAt", "locationName", address, timezone, "maxAmount", "maxQuantity", "geoLocationLatLong", company) FROM stdin;
    public       opencollective    false    205       4005.dat �          0    26891672    Collectives 
   TABLE DATA               �  COPY "Collectives" (id, name, description, currency, "createdAt", "updatedAt", "deletedAt", "isActive", "longDescription", image, slug, website, "twitterHandle", mission, "backgroundImage", "hostFeePercent", settings, data, tags, "isSupercollective", "LastEditedByUserId", "CreatedByUserId", "HostCollectiveId", "ParentCollectiveId", type, "startsAt", "endsAt", "locationName", address, timezone, "maxAmount", "maxQuantity", "geoLocationLatLong", company) FROM stdin;
    public       opencollective    false    206       4006.dat �          0    26891682    ConnectedAccounts 
   TABLE DATA               �   COPY "ConnectedAccounts" (id, service, username, "clientId", token, data, "createdAt", "updatedAt", "deletedAt", "CreatedByUserId", "CollectiveId", "refreshToken") FROM stdin;
    public       opencollective    false    207       4007.dat �          0    26891699    ExpenseHistories 
   TABLE DATA                 COPY "ExpenseHistories" (id, "UserId", "CollectiveId", currency, amount, description, "payoutMethod", "privateMessage", attachment, category, vat, "lastEditedById", status, "incurredAt", "createdAt", "updatedAt", "deletedAt", hid, "archivedAt") FROM stdin;
    public       opencollective    false    211       4011.dat �          0    26891707    Expenses 
   TABLE DATA               �   COPY "Expenses" (id, "UserId", "CollectiveId", currency, amount, description, "privateMessage", attachment, category, vat, "lastEditedById", status, "incurredAt", "createdAt", "updatedAt", "deletedAt", "payoutMethod") FROM stdin;
    public       opencollective    false    213       4013.dat �          0    26891720    Members 
   TABLE DATA               �   COPY "Members" ("createdAt", "updatedAt", "deletedAt", "CreatedByUserId", "CollectiveId", role, id, description, "MemberCollectiveId", "TierId") FROM stdin;
    public       opencollective    false    217       4017.dat �          0    26891727    Notifications 
   TABLE DATA                  COPY "Notifications" (id, channel, type, active, "createdAt", "updatedAt", "UserId", "CollectiveId", "webhookUrl") FROM stdin;
    public       opencollective    false    218       4018.dat �          0    26891690    Orders 
   TABLE DATA                 COPY "Orders" (id, "CreatedByUserId", "CollectiveId", currency, "totalAmount", description, "SubscriptionId", "createdAt", "updatedAt", "deletedAt", "PaymentMethodId", "processedAt", "privateMessage", "TierId", "FromCollectiveId", "publicMessage", quantity) FROM stdin;
    public       opencollective    false    209       4009.dat �          0    26891655    PaymentMethods 
   TABLE DATA               �   COPY "PaymentMethods" (id, name, token, "customerId", service, data, "createdAt", "updatedAt", "confirmedAt", "deletedAt", "CreatedByUserId", "expiryDate", uuid, "CollectiveId", "archivedAt", "monthlyLimitPerMember", "primary", currency) FROM stdin;
    public       opencollective    false    203       4003.dat �          0    26891735    SequelizeMeta 
   TABLE DATA               (   COPY "SequelizeMeta" (name) FROM stdin;
    public       opencollective    false    219       4019.dat �          0    26891738    Sessions 
   TABLE DATA               K   COPY "Sessions" (sid, expires, data, "createdAt", "updatedAt") FROM stdin;
    public       opencollective    false    220       4020.dat �          0    26891744    Subscriptions 
   TABLE DATA               �   COPY "Subscriptions" (id, amount, currency, "interval", "isActive", data, "stripeSubscriptionId", "activatedAt", "deactivatedAt", "createdAt", "updatedAt", "deletedAt") FROM stdin;
    public       opencollective    false    221       4021.dat �          0    26891757    Tiers 
   TABLE DATA               �   COPY "Tiers" (id, name, description, amount, currency, "maxQuantity", password, "startsAt", "endsAt", "createdAt", "updatedAt", "deletedAt", slug, "maxQuantityPerUser", goal, type, "CollectiveId", "interval", button, presets) FROM stdin;
    public       opencollective    false    224       4024.dat �          0    26891768    Transactions 
   TABLE DATA               �  COPY "Transactions" (id, type, description, amount, currency, "createdAt", "updatedAt", "CollectiveId", "CreatedByUserId", "PaymentMethodId", "deletedAt", data, "OrderId", "platformFeeInHostCurrency", "hostFeeInHostCurrency", "paymentProcessorFeeInHostCurrency", "hostCurrency", "hostCurrencyFxRate", "amountInHostCurrency", "netAmountInCollectiveCurrency", "ExpenseId", uuid, "FromCollectiveId", "HostCollectiveId", "TransactionGroup") FROM stdin;
    public       opencollective    false    226       4026.dat �          0    26891779    Users 
   TABLE DATA               �   COPY "Users" (id, email, _salt, refresh_token, password_hash, "createdAt", "updatedAt", "seenAt", "deletedAt", "paypalEmail", "resetPasswordTokenHash", "resetPasswordSentAt", "firstName", "lastName", "billingAddress", "CollectiveId") FROM stdin;
    public       opencollective    false    229       4029.dat �          0    26864845    spatial_ref_sys 
   TABLE DATA               Q   COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
    public       opencollective    false    187       3752.dat �           0    0    Activities_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('"Activities_id_seq"', 69776, true);
            public       opencollective    false    202         �           0    0    Cards_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('"Cards_id_seq"', 8766, true);
            public       opencollective    false    204         �           0    0    ConnectedAccounts_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('"ConnectedAccounts_id_seq"', 1911, true);
            public       opencollective    false    208         �           0    0    Donations_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('"Donations_id_seq"', 6334, true);
            public       opencollective    false    210         �           0    0    ExpenseHistories_hid_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('"ExpenseHistories_hid_seq"', 4239, true);
            public       opencollective    false    212         �           0    0    Expenses_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('"Expenses_id_seq"', 2376, true);
            public       opencollective    false    214         �           0    0    GroupHistories_hid_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('"GroupHistories_hid_seq"', 89123, true);
            public       opencollective    false    215         �           0    0    Groups_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('"Groups_id_seq"', 10879, true);
            public       opencollective    false    216         �           0    0    Subscriptions_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('"Subscriptions_id_seq"', 33900, true);
            public       opencollective    false    222         �           0    0    Subscriptions_id_seq1    SEQUENCE SET     A   SELECT pg_catalog.setval('"Subscriptions_id_seq1"', 4191, true);
            public       opencollective    false    223         �           0    0    Tiers_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('"Tiers_id_seq"', 2802, true);
            public       opencollective    false    225         �           0    0    Transactions_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('"Transactions_id_seq"', 50890, true);
            public       opencollective    false    227         �           0    0    UserGroups_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('"UserGroups_id_seq"', 10408, true);
            public       opencollective    false    228         �           0    0    Users_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('"Users_id_seq"', 9473, true);
            public       opencollective    false    230         �           2606    26916994    Activities Activities_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_pkey";
       public         opencollective    false    201         �           2606    26916996    PaymentMethods Cards_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY "PaymentMethods"
    ADD CONSTRAINT "Cards_pkey" PRIMARY KEY (id);
 G   ALTER TABLE ONLY public."PaymentMethods" DROP CONSTRAINT "Cards_pkey";
       public         opencollective    false    203         �           2606    26916998 (   ConnectedAccounts ConnectedAccounts_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY "ConnectedAccounts"
    ADD CONSTRAINT "ConnectedAccounts_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY public."ConnectedAccounts" DROP CONSTRAINT "ConnectedAccounts_pkey";
       public         opencollective    false    207         �           2606    26917000    Orders Donations_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_pkey" PRIMARY KEY (id);
 C   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_pkey";
       public         opencollective    false    209         �           2606    26917002 &   ExpenseHistories ExpenseHistories_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY "ExpenseHistories"
    ADD CONSTRAINT "ExpenseHistories_pkey" PRIMARY KEY (hid);
 T   ALTER TABLE ONLY public."ExpenseHistories" DROP CONSTRAINT "ExpenseHistories_pkey";
       public         opencollective    false    211         �           2606    26917004    Expenses Expenses_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_pkey";
       public         opencollective    false    213         �           2606    26917006 '   CollectiveHistories GroupHistories_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY "CollectiveHistories"
    ADD CONSTRAINT "GroupHistories_pkey" PRIMARY KEY (hid);
 U   ALTER TABLE ONLY public."CollectiveHistories" DROP CONSTRAINT "GroupHistories_pkey";
       public         opencollective    false    205         �           2606    26917008    Collectives Groups_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Groups_pkey" PRIMARY KEY (id);
 E   ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Groups_pkey";
       public         opencollective    false    206         �           2606    26917010     SequelizeMeta SequelizeMeta_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY "SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);
 N   ALTER TABLE ONLY public."SequelizeMeta" DROP CONSTRAINT "SequelizeMeta_pkey";
       public         opencollective    false    219         �           2606    26917012    Sessions Sessions_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY "Sessions"
    ADD CONSTRAINT "Sessions_pkey" PRIMARY KEY (sid);
 D   ALTER TABLE ONLY public."Sessions" DROP CONSTRAINT "Sessions_pkey";
       public         opencollective    false    220         �           2606    26917014     Notifications Subscriptions_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY "Notifications"
    ADD CONSTRAINT "Subscriptions_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."Notifications" DROP CONSTRAINT "Subscriptions_pkey";
       public         opencollective    false    218         �           2606    26917016 !   Subscriptions Subscriptions_pkey1 
   CONSTRAINT     \   ALTER TABLE ONLY "Subscriptions"
    ADD CONSTRAINT "Subscriptions_pkey1" PRIMARY KEY (id);
 O   ALTER TABLE ONLY public."Subscriptions" DROP CONSTRAINT "Subscriptions_pkey1";
       public         opencollective    false    221         �           2606    26917018    Tiers Tiers_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY "Tiers"
    ADD CONSTRAINT "Tiers_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Tiers" DROP CONSTRAINT "Tiers_pkey";
       public         opencollective    false    224         �           2606    26917020    Transactions Transactions_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_pkey";
       public         opencollective    false    226         �           2606    26917022    Members UserGroups_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "UserGroups_pkey" PRIMARY KEY (id);
 E   ALTER TABLE ONLY public."Members" DROP CONSTRAINT "UserGroups_pkey";
       public         opencollective    false    217         �           2606    26917024    Users Users_email_key 
   CONSTRAINT     N   ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_email_key" UNIQUE (email);
 C   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key";
       public         opencollective    false    229         �           2606    26917026    Users Users_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_pkey";
       public         opencollective    false    229         �           2606    26917028    Users email_unique_idx 
   CONSTRAINT     M   ALTER TABLE ONLY "Users"
    ADD CONSTRAINT email_unique_idx UNIQUE (email);
 B   ALTER TABLE ONLY public."Users" DROP CONSTRAINT email_unique_idx;
       public         opencollective    false    229         �           1259    26917029    CollectiveId    INDEX     E   CREATE INDEX "CollectiveId" ON "Users" USING btree ("CollectiveId");
 "   DROP INDEX public."CollectiveId";
       public         opencollective    false    229         �           1259    26917030 "   CollectiveId-FromCollectiveId-type    INDEX     �   CREATE INDEX "CollectiveId-FromCollectiveId-type" ON "Transactions" USING btree ("CollectiveId", "FromCollectiveId", "deletedAt");
 8   DROP INDEX public."CollectiveId-FromCollectiveId-type";
       public         opencollective    false    226    226    226         �           1259    26917031    CollectiveId-deletedAt    INDEX     \   CREATE INDEX "CollectiveId-deletedAt" ON "Tiers" USING btree ("CollectiveId", "deletedAt");
 ,   DROP INDEX public."CollectiveId-deletedAt";
       public         opencollective    false    224    224         �           1259    26917032    CollectiveId-role    INDEX     R   CREATE INDEX "CollectiveId-role" ON "Members" USING btree ("CollectiveId", role);
 '   DROP INDEX public."CollectiveId-role";
       public         opencollective    false    217    217         �           1259    26917033    CollectiveId-type    INDEX     W   CREATE INDEX "CollectiveId-type" ON "Transactions" USING btree ("CollectiveId", type);
 '   DROP INDEX public."CollectiveId-type";
       public         opencollective    false    226    226         �           1259    26917034 
   DonationId    INDEX     E   CREATE INDEX "DonationId" ON "Transactions" USING btree ("OrderId");
     DROP INDEX public."DonationId";
       public         opencollective    false    226         �           1259    26917035 $   MemberCollectiveId-CollectiveId-role    INDEX     {   CREATE INDEX "MemberCollectiveId-CollectiveId-role" ON "Members" USING btree ("MemberCollectiveId", "CollectiveId", role);
 :   DROP INDEX public."MemberCollectiveId-CollectiveId-role";
       public         opencollective    false    217    217    217         �           1259    26917036    ParentCollectiveId    INDEX     W   CREATE INDEX "ParentCollectiveId" ON "Collectives" USING btree ("ParentCollectiveId");
 (   DROP INDEX public."ParentCollectiveId";
       public         opencollective    false    206         �           1259    26917037    PaymentMethodId    INDEX     L   CREATE INDEX "PaymentMethodId" ON "Orders" USING btree ("PaymentMethodId");
 %   DROP INDEX public."PaymentMethodId";
       public         opencollective    false    209         �           1259    26917038    Transactions_GroupId    INDEX     a   CREATE INDEX "Transactions_GroupId" ON "Transactions" USING btree ("CollectiveId", "deletedAt");
 *   DROP INDEX public."Transactions_GroupId";
       public         opencollective    false    226    226         �           1259    26917039    UniqueSlugIndex    INDEX     K   CREATE UNIQUE INDEX "UniqueSlugIndex" ON "Collectives" USING btree (slug);
 %   DROP INDEX public."UniqueSlugIndex";
       public         opencollective    false    206         �           1259    26917040 %   subscriptions_type__group_id__user_id    INDEX     {   CREATE UNIQUE INDEX subscriptions_type__group_id__user_id ON "Notifications" USING btree (type, "CollectiveId", "UserId");
 9   DROP INDEX public.subscriptions_type__group_id__user_id;
       public         opencollective    false    218    218    218         �           1259    26917041    transactions_uuid    INDEX     L   CREATE UNIQUE INDEX transactions_uuid ON "Transactions" USING btree (uuid);
 %   DROP INDEX public.transactions_uuid;
       public         opencollective    false    226         �           1259    26917042 	   type-tags    INDEX     D   CREATE INDEX "type-tags" ON "Collectives" USING btree (type, tags);
    DROP INDEX public."type-tags";
       public         opencollective    false    206    206         �           2606    26917043 "   Activities Activities_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 P   ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_GroupId_fkey";
       public       opencollective    false    201    206    3796                     2606    26917048 (   Activities Activities_TransactionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_TransactionId_fkey" FOREIGN KEY ("TransactionId") REFERENCES "Transactions"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 V   ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_TransactionId_fkey";
       public       opencollective    false    226    3830    201                    2606    26917053 !   Activities Activities_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 O   ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_UserId_fkey";
       public       opencollective    false    229    201    3836                    2606    26917059     PaymentMethods Cards_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "PaymentMethods"
    ADD CONSTRAINT "Cards_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 N   ALTER TABLE ONLY public."PaymentMethods" DROP CONSTRAINT "Cards_UserId_fkey";
       public       opencollective    false    203    229    3836                    2606    26917064 <   CollectiveHistories CollectiveHistories_CreatedByUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "CollectiveHistories"
    ADD CONSTRAINT "CollectiveHistories_CreatedByUserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 j   ALTER TABLE ONLY public."CollectiveHistories" DROP CONSTRAINT "CollectiveHistories_CreatedByUserId_fkey";
       public       opencollective    false    205    229    3836                    2606    26917085 =   CollectiveHistories CollectiveHistories_HostCollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "CollectiveHistories"
    ADD CONSTRAINT "CollectiveHistories_HostCollectiveId_fkey" FOREIGN KEY ("HostCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 k   ALTER TABLE ONLY public."CollectiveHistories" DROP CONSTRAINT "CollectiveHistories_HostCollectiveId_fkey";
       public       opencollective    false    205    206    3796                    2606    26917090 ?   CollectiveHistories CollectiveHistories_ParentCollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "CollectiveHistories"
    ADD CONSTRAINT "CollectiveHistories_ParentCollectiveId_fkey" FOREIGN KEY ("ParentCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 m   ALTER TABLE ONLY public."CollectiveHistories" DROP CONSTRAINT "CollectiveHistories_ParentCollectiveId_fkey";
       public       opencollective    false    205    206    3796                    2606    26917099 ,   Collectives Collectives_CreatedByUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Collectives_CreatedByUserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 Z   ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Collectives_CreatedByUserId_fkey";
       public       opencollective    false    206    229    3836                    2606    26917104 -   Collectives Collectives_HostCollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Collectives_HostCollectiveId_fkey" FOREIGN KEY ("HostCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 [   ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Collectives_HostCollectiveId_fkey";
       public       opencollective    false    206    206    3796         	           2606    26917109 /   Collectives Collectives_ParentCollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Collectives_ParentCollectiveId_fkey" FOREIGN KEY ("ParentCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 ]   ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Collectives_ParentCollectiveId_fkey";
       public       opencollective    false    206    206    3796                    2606    26917114 0   ConnectedAccounts ConnectedAccounts_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "ConnectedAccounts"
    ADD CONSTRAINT "ConnectedAccounts_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public."ConnectedAccounts" DROP CONSTRAINT "ConnectedAccounts_GroupId_fkey";
       public       opencollective    false    206    207    3796                    2606    26917119 /   ConnectedAccounts ConnectedAccounts_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "ConnectedAccounts"
    ADD CONSTRAINT "ConnectedAccounts_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 ]   ALTER TABLE ONLY public."ConnectedAccounts" DROP CONSTRAINT "ConnectedAccounts_UserId_fkey";
       public       opencollective    false    229    3836    207                    2606    26917124    Orders Donations_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_GroupId_fkey";
       public       opencollective    false    209    206    3796                    2606    26917129 %   Orders Donations_PaymentMethodId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_PaymentMethodId_fkey" FOREIGN KEY ("PaymentMethodId") REFERENCES "PaymentMethods"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 S   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_PaymentMethodId_fkey";
       public       opencollective    false    209    203    3792                    2606    26917134 $   Orders Donations_SubscriptionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_SubscriptionId_fkey" FOREIGN KEY ("SubscriptionId") REFERENCES "Subscriptions"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 R   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_SubscriptionId_fkey";
       public       opencollective    false    209    221    3821                    2606    26917139    Orders Donations_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 J   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_UserId_fkey";
       public       opencollective    false    229    209    3836                    2606    26917144    Expenses Expenses_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 L   ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_GroupId_fkey";
       public       opencollective    false    206    213    3796                    2606    26917149    Expenses Expenses_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_UserId_fkey";
       public       opencollective    false    229    213    3836                    2606    26917154 %   Expenses Expenses_lastEditedById_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_lastEditedById_fkey" FOREIGN KEY ("lastEditedById") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 S   ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_lastEditedById_fkey";
       public       opencollective    false    229    3836    213         
           2606    26917159 *   Collectives Groups_lastEditedByUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Groups_lastEditedByUserId_fkey" FOREIGN KEY ("LastEditedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 X   ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Groups_lastEditedByUserId_fkey";
       public       opencollective    false    229    206    3836                    2606    26917164 '   Members Members_MemberCollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "Members_MemberCollectiveId_fkey" FOREIGN KEY ("MemberCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 U   ALTER TABLE ONLY public."Members" DROP CONSTRAINT "Members_MemberCollectiveId_fkey";
       public       opencollective    false    217    206    3796                    2606    26917169    Members Members_TierId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "Members_TierId_fkey" FOREIGN KEY ("TierId") REFERENCES "Tiers"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 I   ALTER TABLE ONLY public."Members" DROP CONSTRAINT "Members_TierId_fkey";
       public       opencollective    false    224    3824    217                    2606    26917177 #   Orders Orders_FromCollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Orders_FromCollectiveId_fkey" FOREIGN KEY ("FromCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 Q   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Orders_FromCollectiveId_fkey";
       public       opencollective    false    209    3796    206                    2606    26917182    Orders Orders_TierId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Orders_TierId_fkey" FOREIGN KEY ("TierId") REFERENCES "Tiers"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 G   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Orders_TierId_fkey";
       public       opencollective    false    209    3824    224                    2606    26917187 /   PaymentMethods PaymentMethods_CollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "PaymentMethods"
    ADD CONSTRAINT "PaymentMethods_CollectiveId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 ]   ALTER TABLE ONLY public."PaymentMethods" DROP CONSTRAINT "PaymentMethods_CollectiveId_fkey";
       public       opencollective    false    203    3796    206                    2606    26917192 (   Notifications Subscriptions_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Notifications"
    ADD CONSTRAINT "Subscriptions_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 V   ALTER TABLE ONLY public."Notifications" DROP CONSTRAINT "Subscriptions_GroupId_fkey";
       public       opencollective    false    218    3796    206                    2606    26917197 '   Notifications Subscriptions_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Notifications"
    ADD CONSTRAINT "Subscriptions_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 U   ALTER TABLE ONLY public."Notifications" DROP CONSTRAINT "Subscriptions_UserId_fkey";
       public       opencollective    false    218    3836    229                    2606    26917202    Tiers Tiers_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Tiers"
    ADD CONSTRAINT "Tiers_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 F   ALTER TABLE ONLY public."Tiers" DROP CONSTRAINT "Tiers_GroupId_fkey";
       public       opencollective    false    224    3796    206                    2606    26917207 %   Transactions Transactions_CardId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_CardId_fkey" FOREIGN KEY ("PaymentMethodId") REFERENCES "PaymentMethods"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 S   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_CardId_fkey";
       public       opencollective    false    203    226    3792                     2606    26917212 )   Transactions Transactions_DonationId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_DonationId_fkey" FOREIGN KEY ("OrderId") REFERENCES "Orders"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 W   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_DonationId_fkey";
       public       opencollective    false    226    209    3803         !           2606    26917217 (   Transactions Transactions_ExpenseId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_ExpenseId_fkey" FOREIGN KEY ("ExpenseId") REFERENCES "Expenses"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 V   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_ExpenseId_fkey";
       public       opencollective    false    213    3808    226         "           2606    26917222 /   Transactions Transactions_FromCollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_FromCollectiveId_fkey" FOREIGN KEY ("FromCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 ]   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_FromCollectiveId_fkey";
       public       opencollective    false    226    3796    206         #           2606    26917228 &   Transactions Transactions_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 T   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_GroupId_fkey";
       public       opencollective    false    226    3796    206                    2606    26917233 /   Transactions Transactions_HostCollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_HostCollectiveId_fkey" FOREIGN KEY ("HostCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 ]   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_HostCollectiveId_fkey";
       public       opencollective    false    226    3796    206                    2606    26917238 %   Transactions Transactions_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 S   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_UserId_fkey";
       public       opencollective    false    226    3836    229                    2606    26917243    Members UserGroups_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "UserGroups_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id);
 M   ALTER TABLE ONLY public."Members" DROP CONSTRAINT "UserGroups_GroupId_fkey";
       public       opencollective    false    217    3796    206                    2606    26917248    Members UserGroups_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "UserGroups_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public."Members" DROP CONSTRAINT "UserGroups_UserId_fkey";
       public       opencollective    false    217    3836    229         $           2606    26917253    Users Users_CollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_CollectiveId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_CollectiveId_fkey";
       public       opencollective    false    229    3796    206                                                                                                                                                                                                                                                                                                                                                                                                                        4001.dat                                                                                            0000600 0004000 0002000 00000000005 13212311737 0014231 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4005.dat                                                                                            0000600 0004000 0002000 00000000005 13212311737 0014235 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4006.dat                                                                                            0000600 0004000 0002000 00000475713 13212311737 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        9333	Nathan Selvidge	\N	USD	2017-10-20 07:35:50.335-07	2017-10-20 07:35:50.335-07	\N	t	\N	\N	nathan-selvidge	\N	\N	\N	\N	5	\N	{"UserId":8430}	\N	f	\N	8430	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
9814	Women Who Code User	\N	USD	2017-10-29 17:00:00-07	2017-10-29 17:00:00-07	\N	t	\N	\N	wwcodeuser	\N	\N	\N	\N	\N	\N	\N	\N	f	30	30	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
9335	Semyon Feldman	\N	USD	2017-10-20 08:17:09.242-07	2017-10-20 08:17:09.242-07	\N	t	\N	\N	semyon-feldman	\N	\N	\N	\N	5	\N	{"UserId":8432}	\N	f	\N	8432	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
299	WWCode Colima	WWCode is a global non-profit organization that inspires women to excel in technology careers.	MXN	2016-09-29 11:38:52.23-07	2016-12-27 08:09:39.74-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Colima**](https://www.womenwhocode.com/colima). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScHuzUYo7CGFNBBEWJEBEimY4ARGF4rpmyTtJ2K00dy8f-XiQ/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScHuzUYo7CGFNBBEWJEBEimY4ARGF4rpmyTtJ2K00dy8f-XiQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScHuzUYo7CGFNBBEWJEBEimY4ARGF4rpmyTtJ2K00dy8f-XiQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodecolima#support) to support WWCode Colima \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/a02c3dc0-9ba2-11e6-84fe-5d5e57220970.png	wwcodecolima	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
1729	Xavier Damman	Entrepreneur sharing ideas in copyleft	USD	2015-11-05 05:44:30.93-08	2017-10-24 22:19:34.997-07	\N	t	Here to support great civic initiatives, the future of cities and helping refugees feel welcome wherever they land.	https://opencollective-production.s3-us-west-1.amazonaws.com/5c825534ad62223ae6a539f6a5076d3cjpeg_1699f6e0-917c-11e6-a567-3f53b7b5f95c.jpeg	xdamman	http://xdamman.com	xdamman	\N	\N	\N	\N	{"UserId":2}	{user}	f	2	2	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
272	WWCode East Bay	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:05:19.056-07	2016-12-27 08:38:30.14-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Oakland/East Bay**](https://www.womenwhocode.com/east-bay). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeId0Km3sYr0AEQHjzzKsxoiDfn-HhIFPXBzg0V-t8F440Olg/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeId0Km3sYr0AEQHjzzKsxoiDfn-HhIFPXBzg0V-t8F440Olg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeId0Km3sYr0AEQHjzzKsxoiDfn-HhIFPXBzg0V-t8F440Olg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeeastbay#support) to support WWCode Oakland/East Bay \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/d9a7fc70-9c5f-11e6-84fe-5d5e57220970.png	wwcodeeastbay	\N	wwcode_eastbay	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech",501c3}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
48	WWCode Twin Cities	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2016-03-06 16:00:00-08	2016-12-28 08:23:57.622-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in the Twin Cities**](https://www.womenwhocode.com/twin-cities). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSf9BXBmwX87irE9Xmvf9EntZG8Wb-VbY0xm2EOosPiMMSFP5g/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSf9BXBmwX87irE9Xmvf9EntZG8Wb-VbY0xm2EOosPiMMSFP5g/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSf9BXBmwX87irE9Xmvf9EntZG8Wb-VbY0xm2EOosPiMMSFP5g/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodetwincities#support) to support WWCode Twin Cities \n\nQuestions? Email us at global@womenwhocode.com.  \n\n[**Sponsors**](https://drive.google.com/file/d/0ByjnHHy83oCsS3hjMjRNZktkYmM/view?usp=sharing)\n      	https://opencollective-production.s3-us-west-1.amazonaws.com/079974c0-cd1a-11e6-a033-c553d2fe46df.png	wwcodetwincities	https://www.womenwhocode.com/twin-cities	wwcodetc	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech",501c3}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
279	WWCode Los Angeles	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:12:58.808-07	2016-12-27 09:24:20.031-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Los Angeles**](https://www.womenwhocode.com/la). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdc86zv5cSb-LuQlyA4qgmhZXjmN81qn-NAnbwNKidSrEST6g/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdc86zv5cSb-LuQlyA4qgmhZXjmN81qn-NAnbwNKidSrEST6g/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdc86zv5cSb-LuQlyA4qgmhZXjmN81qn-NAnbwNKidSrEST6g/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodelosangeles#support) WWCode Los Angeles \n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/f55b4680-9097-11e6-a134-f381d4cd2713.png	wwcodelosangeles	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech",501c3}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
516	Women Who Code Huntsville	\N	USD	2017-02-21 11:02:21.542-08	2017-02-21 11:05:00.852-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScu1IeDDh0ZqcKEMxfMGPgrdr1bnDKsiC94diR7AfR7LQIU6g/viewform)\n\n[**Attend**](https://www.womenwhocode.com/philadelphia) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScu1IeDDh0ZqcKEMxfMGPgrdr1bnDKsiC94diR7AfR7LQIU6g/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScu1IeDDh0ZqcKEMxfMGPgrdr1bnDKsiC94diR7AfR7LQIU6g/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodephiladelphia#support) to support WWCode Philadelphia\n\nQuestions? Email us at global@womenwhocode.com.\n\n	\N	wwcodehuntsville	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech",501c3}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
290	WWCode Tampa	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:28:08.446-07	2016-11-07 10:27:01.762-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Tampa**](https://www.womenwhocode.com/tampa). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeSfKMAT2KWgG0kArwZhSAAYMwtAVyUGGK4l2Yfq3soxxLJnA/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeSfKMAT2KWgG0kArwZhSAAYMwtAVyUGGK4l2Yfq3soxxLJnA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeSfKMAT2KWgG0kArwZhSAAYMwtAVyUGGK4l2Yfq3soxxLJnA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Support**](https://opencollective.com/wwcodetampa#support) WWCode Tampa financially by making a donation below\n\n\nYour donations are critical in supporting this catalytic movement. Donations received here directly support our programs. A small amount also supports global development so that we can bring innovative program to cities around the world, ensuring that more women everywhere have the opportunity to excel in technology careers.\n\n\nQuestions? Email us at contact@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/638dcdc0-a516-11e6-b4fe-6966ef500b6b.png	wwcodetampa	\N	wwcodetampa	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech",501c3}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
522	Women Who Code Vancouver	\N	CAD	2017-02-21 11:45:19.101-08	2017-02-21 11:48:46.905-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSd1osMiiyVCoIUO3ZK8qcap7tFhhzGLvJAKO37CuLN0-eGTjg/viewform)\n\n[**Attend**](https://www.womenwhocode.com/vancouver) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSd1osMiiyVCoIUO3ZK8qcap7tFhhzGLvJAKO37CuLN0-eGTjg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSd1osMiiyVCoIUO3ZK8qcap7tFhhzGLvJAKO37CuLN0-eGTjg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodevancouver#support) to support WWCode Vancouver \n\nQuestions? Email us at global@womenwhocode.com.\n\n	\N	wwcodevancouver	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
6616	pkmass	\N	USD	2016-07-01 15:31:42.541-07	\N	\N	t	\N	\N	pkmass	\N	\N	\N	\N	\N	\N	{"UserId":686}	{user}	f	\N	686	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
293	WWCode Waterloo	WWCode is a global non-profit organization that inspires women to excel in technology careers.	CAD	2016-09-29 11:30:54.225-07	2016-12-28 08:29:14.91-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Waterloo**](https://www.womenwhocode.com/waterloo). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfIMqJl5wn5hDsoRQBrehopXdebDkIZBYLjrrOMNIH9M8O47A/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfIMqJl5wn5hDsoRQBrehopXdebDkIZBYLjrrOMNIH9M8O47A/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfIMqJl5wn5hDsoRQBrehopXdebDkIZBYLjrrOMNIH9M8O47A/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodewaterloo#support) to support WWCode Waterloo\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/485e6710-a6d5-11e6-bdef-45bfa9f9c1b0.png	wwcodewaterloo	\N	womenwhocodekw	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
584	WWCode Edinburgh	\N	GBP	2017-04-03 09:22:45.923-07	2017-04-03 09:22:46-07	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n\n# Contribute\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSczqJwa2qByhFFHXavunDYPzXRh1p0lOVa8nfyMSvCCySkd0Q/viewform)\n[**Attend**](https://www.womenwhocode.com/edinburgh) 	\N	wwcodeedinburgh	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n\n\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3206	3206	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
241	WWCode Taipei	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-07 15:13:23.305-07	2016-12-28 07:57:33.798-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Taipei**](https://www.womenwhocode.com/taipei). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSc9XHX8FbeC1w6cKAZ_XjnVzC4cBb0hbvASXJ05soQA0SOlTA/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSc9XHX8FbeC1w6cKAZ_XjnVzC4cBb0hbvASXJ05soQA0SOlTA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSc9XHX8FbeC1w6cKAZ_XjnVzC4cBb0hbvASXJ05soQA0SOlTA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodetaipei#support) to support WWCode Taipei \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/lGiwq5JAPy.png	wwcodetaipei	\N	wwcodetaipei	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
259	WWCode Birmingham	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 10:43:14.021-07	2016-12-23 09:19:36.878-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Birmingham**](https://www.womenwhocode.com/birmingham). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeOLUr8i4gqKg09Wt9ExEh_m4rnhZHR0BZFDodXc953DZ_NjQ/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeOLUr8i4gqKg09Wt9ExEh_m4rnhZHR0BZFDodXc953DZ_NjQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeOLUr8i4gqKg09Wt9ExEh_m4rnhZHR0BZFDodXc953DZ_NjQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebirmingham#support) to WWCode Birmingham financially by making a donation below\n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/f9d834f0-c933-11e6-9af0-47fca5e686db.png	wwcodebirmingham	\N	wwcbirmingham	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
284	WWCode Phoenix	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:16:52.055-07	2016-12-27 10:33:28.693-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Phoenix**](https://www.womenwhocode.com/phoenix). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScqaw9PNkcI8jaxCbAlvRF-xUQ75PBpHeRoOwI9zz87DRJHsg/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScqaw9PNkcI8jaxCbAlvRF-xUQ75PBpHeRoOwI9zz87DRJHsg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScqaw9PNkcI8jaxCbAlvRF-xUQ75PBpHeRoOwI9zz87DRJHsg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodephoenix#support) to support WWCode Phoenix \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/dd27b4d0-9d45-11e6-9116-db595ff259df.png	wwcodephoenix	\N	wwcodephoenix	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech",501c3}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
289	WWCode Shanghai	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:26:35.114-07	2016-12-28 07:51:25.097-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Shanghai**](https://www.womenwhocode.com/shanghai). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeshanghai#support) to support WWCode Shanghai\n\nQuestions? Email us at global@womenwhocode.com.	https://opencollective-production.s3-us-west-1.amazonaws.com/7be08da0-cd15-11e6-a033-c553d2fe46df.png	wwcodeshanghai	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
288	WWCode Santiago	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:25:21.912-07	2016-12-27 11:48:06.766-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Santiago**](https://www.womenwhocode.com/santiago). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdu79lAU0f0kKoLdUHsazwlPaiVRDO9SP5v9swDGHv00Nwqaw/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdu79lAU0f0kKoLdUHsazwlPaiVRDO9SP5v9swDGHv00Nwqaw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdu79lAU0f0kKoLdUHsazwlPaiVRDO9SP5v9swDGHv00Nwqaw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesantiago#support) to support WWCode Santiago \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/595593e0-a2c0-11e6-b669-1f602f2f2eec.png	wwcodesantiago	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
300	WWCode Silicon Valley	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:41:11.03-07	2017-11-28 07:38:02.26-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Silicon Valley**](https://www.womenwhocode.com/sv). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfGn_wwztPhhOYJ4LqYvswg0y0ZpagWZkXA-a81y3WKLOW0nQ/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfGn_wwztPhhOYJ4LqYvswg0y0ZpagWZkXA-a81y3WKLOW0nQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfGn_wwztPhhOYJ4LqYvswg0y0ZpagWZkXA-a81y3WKLOW0nQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesv#support) to support WWCode Silicon Valley \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/cc80e4c0-90ad-11e6-a134-f381d4cd2713.png	wwcodesv	https://twitter.com/wwcodesv	wwcodesv	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech",501c3}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
10660	Dionne  Toussaint	Giver and Community Organizer 	USD	2017-11-28 09:54:46.364-08	2017-11-29 05:34:28.31-08	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/bcf84a60-d509-11e7-89dc-cd36c6b3fe8c.JPG	dionnetoussaint	https://twitter.com/DionneToussaint	DionneToussaint	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/035b16e0-d50a-11e7-89dc-cd36c6b3fe8c.JPG	5	\N	{"UserId":9296}	\N	f	9296	9296	\N	\N	USER	\N	\N	New York City	\N	\N	\N	\N	\N	\N
1210	Ksenia Barshchyk	\N	USD	2016-09-29 11:30:08.971-07	\N	\N	t	\N	\N	kseniabarshchyk	\N	\N	\N	\N	\N	\N	{"UserId":1354}	{user}	f	\N	1354	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
9308	Claire Burn	\N	USD	2017-10-19 08:22:05.409-07	2017-10-19 08:22:05.409-07	\N	t	\N	\N	claire-burn	\N	\N	\N	\N	5	\N	{"UserId":8410}	\N	f	\N	8410	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
51	Women Who Code	WWCode is a global non-profit organization dedicated 	USD	2015-10-31 17:00:00-07	2017-11-23 11:31:15.593-08	\N	t	Women Who Code (WWCode) is a global 501(c)(3) non-profit dedicated to inspiring women to excel in technology careers. We connect amazing women with other like-minded women around the globe who unite under one simple notion – the world of technology is better with women in it. \n\nWe work hard every day to inspire engineers to advance their careers. We strongly believe in the value of diversity, and envision a world where women are representative as technical executives, founders, venture capitalists, board members, and software engineers. \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events**](https://www.womenwhocode.com/events). \n\n[**Get Involved:**](https://docs.google.com/forms/d/e/1FAIpQLSfIho8JwdkT05STQ6q_1c_cv3kVBsO1I1udKVgf2XaAU5Tnfw/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfIho8JwdkT05STQ6q_1c_cv3kVBsO1I1udKVgf2XaAU5Tnfw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfIho8JwdkT05STQ6q_1c_cv3kVBsO1I1udKVgf2XaAU5Tnfw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Support**](https://opencollective.com/wwcode#support) WWCode financially by making a donation below\n\nYour donations are critical in supporting this catalytic movement. Donations received here directly support our programs. A small amount also supports global development so that we can bring innovative program to cities around the world, ensuring that more women everywhere have the opportunity to excel in technology careers.\n\nQuestions? Email us at contact@womenwhocode.com. 	https://opencollective-production.s3-us-west-1.amazonaws.com/50bd4ad0-769b-11e6-90e1-0dd449fe12b2.png	wwcode-collective	http://womenwhocode.com	wwcode	We are on a mission to inspire women to excel in tech careers.	\N	10	{"HostId": 3, "lang":"wwcode","superCollectiveTag":"wwcode","githubOrg":"wwcode","style":{"hero": {"cover":{"background":"black"}}}}	{"UserId":3,"githubContributors":{},"repos":{}}	{wwcode,meetup,"diversity in tech",501c3}	t	3	3	9804	\N	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
1037	Dana Dalling	\N	USD	2016-09-29 11:09:42.785-07	\N	\N	t	\N	\N	danadalling	\N	\N	\N	\N	\N	\N	{"UserId":1329}	{user}	f	\N	1329	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
1115	beth laing	\N	USD	2016-01-29 15:18:53.83-08	\N	\N	t	\N	\N	beth	\N	\N	\N	\N	\N	\N	{"UserId":70}	{user}	f	\N	70	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
1060	Guiti Nabavi	\N	USD	2016-09-29 11:41:11.052-07	\N	\N	t	\N	\N	guitinabavi	\N	\N	\N	\N	\N	\N	{"UserId":1371}	{user}	f	\N	1371	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
1204	Jigyasa Grover	\N	USD	2016-03-07 01:50:58.721-08	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/ext_a8caehjpg_988323b0-6bc5-11e7-b808-c12ae105ad03.jpeg	jigyasagrover	https://www.linkedin.com/in/jigyasagrover	\N	\N	\N	\N	\N	{"UserId":141}	{user}	f	\N	141	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
1190	Qianyi Zheng	\N	USD	2016-09-29 11:26:35.133-07	\N	\N	t	\N	\N	qianyizheng	\N	\N	\N	\N	\N	\N	{"UserId":1349}	{user}	f	\N	1349	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
1368	Princy James	\N	USD	2016-09-29 11:14:46.606-07	\N	\N	t	\N	\N	princyjames	\N	\N	\N	\N	\N	\N	{"UserId":1338}	{user}	f	\N	1338	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
1442	Allison Canestaro	\N	USD	2016-06-06 12:04:33.418-07	\N	\N	t	\N	\N	allisoncanestaro	\N	\N	\N	\N	\N	\N	{"UserId":551}	{user}	f	\N	551	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
1477	Mami Enomoto	\N	USD	2016-09-29 11:33:37.095-07	\N	\N	t	\N	\N	mamienomoto	\N	\N	\N	\N	\N	\N	{"UserId":1361}	{user}	f	\N	1361	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
1504	Fanya	\N	USD	2016-01-29 15:20:00.061-08	\N	\N	t	\N	\N	fanya	\N	\N	\N	\N	\N	\N	{"UserId":78}	{user}	f	\N	78	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
1460	FJ Genus	\N	USD	2016-09-29 11:09:42.794-07	\N	\N	t	\N	\N	fjgenus	\N	\N	\N	\N	\N	\N	{"UserId":1330}	{user}	f	\N	1330	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
1568	Travis Swicegood	\N	USD	2016-05-19 12:24:40.738-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/03134eb6a2764594808716e5c3f0dc6c_690fce70-1df7-11e6-b09a-bd4f4a904ffe.jpeg	tswicegood	http://www.travisswicegood.com	tswicegood	\N	\N	\N	\N	{"UserId":392}	{user}	f	\N	392	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
1586	Nicole Giannone	\N	USD	2017-05-09 11:14:19.572-07	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/5bd8eb7d-65e2-482e-b9dd-ff7f33bf804b	nicole1	\N	\N	\N	\N	\N	\N	{"UserId":4720}	{user}	f	\N	4720	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
1650	Laura Scholl	\N	USD	2016-09-29 11:32:00.983-07	\N	\N	t	\N	\N	laurascholl	\N	\N	\N	\N	\N	\N	{"UserId":1358}	{user}	f	\N	1358	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
1734	Casey Gruppioni	\N	USD	2016-08-02 17:00:00-07	\N	\N	t	\N	\N	casey	\N	\N	\N	\N	\N	\N	{"UserId":898}	{user}	f	\N	898	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
1831	Cameron 🐳✨	\N	USD	2016-12-18 17:41:26.473-08	\N	\N	t	\N	\N	cameron1	\N	\N	\N	\N	\N	\N	{"UserId":2220}	{user}	f	\N	2220	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
1848	Shahnaz Kamberi	\N	USD	2016-06-06 17:53:44.829-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/dcacmorg_5f260cb0-2c4a-11e6-80e4-310475aa5f5c.png	dcacm	http://dcacm.org	dcacm	\N	\N	\N	\N	{"UserId":555}	{user}	f	\N	555	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
1811	Afia Owusu-Forfie	\N	USD	2016-09-29 10:44:40.419-07	\N	\N	t	\N	\N	afiaowusu-forfie	\N	\N	\N	\N	\N	\N	{"UserId":1304}	{user}	f	\N	1304	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
1781	Kelly	\N	USD	2016-01-11 10:58:47.796-08	\N	\N	t	\N	https://pbs.twimg.com/profile_images/523157919999602688/00l1ZQIf.jpeg	kshuster	\N	\N	\N	\N	\N	\N	{"UserId":34}	{user}	f	\N	34	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
1900	Erika Aguayo	\N	USD	2016-09-29 11:38:54.935-07	\N	\N	t	\N	\N	erikaaguayo	\N	\N	\N	\N	\N	\N	{"UserId":1369}	{user}	f	\N	1369	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
1804	Silvia Pina	\N	USD	2016-09-29 11:43:49.189-07	\N	\N	t	\N	\N	silviapina	\N	\N	\N	\N	\N	\N	{"UserId":1377}	{user}	f	\N	1377	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
1788	Lacey Reinoehl	\N	USD	2017-05-01 10:13:32.139-07	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/8207c9a5-55ed-41a7-a238-4ef4d22a6059	laceyreinoehl	\N	\N	\N	\N	\N	\N	{"UserId":4550}	{user}	f	\N	4550	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
2028	Judith Agbotse	\N	USD	2016-09-29 10:44:40.429-07	\N	\N	t	\N	\N	judithagbotse	\N	\N	\N	\N	\N	\N	{"UserId":1305}	{user}	f	\N	1305	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
2014	Isabella Oliveira	\N	USD	2016-09-29 10:58:16.63-07	\N	\N	t	\N	\N	isabellaoliveira	\N	\N	\N	\N	\N	\N	{"UserId":1315}	{user}	f	\N	1315	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
2023	Vinita Khandelwal Rathi	\N	USD	2016-09-29 11:11:53.843-07	\N	\N	t	\N	\N	vinitakhandelwalrathi	\N	\N	\N	\N	\N	\N	{"UserId":1334}	{user}	f	\N	1334	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
2086	Nina Wilson	\N	USD	2017-08-15 17:24:32.881-07	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/e240ad00-0ba0-408d-ae8a-a3e78e977307	ninawilsonmlis	Http://ninawilsonmlis.wordpress.com	\N	\N	\N	\N	\N	{"UserId":6653}	{user}	f	\N	6653	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
2136	Tiffany Andrews	\N	USD	2016-09-29 11:12:58.852-07	\N	\N	t	\N	\N	tiffanyandrews	\N	\N	\N	\N	\N	\N	{"UserId":1336}	{user}	f	\N	1336	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
2170	Tzmanics	\N	USD	2017-09-19 16:54:14.846-07	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/79716824-93cb-43b2-bc99-9f94fc820f48	tzmanics	http://tzmanics.com	\N	\N	\N	\N	\N	{"UserId":7537}	{user}	f	\N	7537	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
2232	ericalucaterochapman	\N	USD	2017-02-01 07:16:17.461-08	\N	\N	t	\N	\N	ericalucaterochapman	\N	\N	\N	\N	\N	\N	{"UserId":2898}	{user}	f	\N	2898	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
2245	Rose THERESA	\N	USD	2016-01-29 15:19:47.116-08	\N	\N	t	\N	\N	rosetheresa	\N	\N	\N	\N	\N	\N	{"UserId":76}	{user}	f	\N	76	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
2319	Karen Farzam	\N	USD	2016-09-29 11:08:19.487-07	\N	\N	t	\N	\N	karenfarzam	\N	\N	\N	\N	\N	\N	{"UserId":1327}	{user}	f	\N	1327	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
2385	pia mancini	\N	USD	2016-01-09 13:31:01.954-08	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/9EflVQqM_400x400jpg_2aee92e0-858d-11e6-9fd7-73dd31eb7c0c.jpeg	piamancini	\N	piamancini	\N	\N	\N	\N	{"UserId":30}	{user}	f	\N	30	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
2255	Maira Bejamin	\N	USD	2016-09-29 11:05:19.073-07	\N	\N	t	\N	\N	mairabejamin	\N	\N	\N	\N	\N	\N	{"UserId":1323}	{user}	f	\N	1323	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
2269	Ria Riaz	\N	USD	2016-09-29 11:28:54.276-07	\N	\N	t	\N	\N	riariaz	\N	\N	\N	\N	\N	\N	{"UserId":1353}	{user}	f	\N	1353	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
2300	Rachel C	\N	USD	2017-06-07 09:24:53.498-07	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/c9103ee3-20f6-48cb-8da0-60e889c743b5	rachelcheuk	https://twitter.com/rachel_cheuk	rachel_cheuk	\N	\N	\N	\N	{"UserId":5267}	{user}	f	\N	5267	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
2349	Smitha Radhakrishnan	\N	USD	2016-09-29 10:51:29.334-07	\N	\N	t	\N	\N	smitharadhakrishnan	\N	\N	\N	\N	\N	\N	{"UserId":1310}	{user}	f	\N	1310	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
2383	Xinhui Li	\N	USD	2016-09-29 10:53:00.503-07	\N	\N	t	\N	\N	xinhuili	\N	\N	\N	\N	\N	\N	{"UserId":1312}	{user}	f	\N	1312	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
2405	Jennifer  Carlson	\N	USD	2016-09-29 11:16:52.099-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/d0d048c9a2e240d783dd2f67e92e57a9_49726890-8e97-11e7-909d-33d8484c2808.png	jenniferhoover	\N	\N	\N	\N	\N	\N	{"UserId":1341}	{user}	f	\N	1341	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
2776	Betty Li	\N	USD	2017-04-17 17:52:23.452-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/b7bee870-8f35-11e7-96b9-479e46ecccbf.jpg	betty	\N	\N	\N	\N	\N	\N	{"UserId":4283}	{user}	f	\N	4283	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
2685	Vicky Twomey-Lee	\N	USD	2016-09-29 11:37:07.344-07	\N	\N	t	\N	\N	vickytwomey-lee	\N	\N	\N	\N	\N	\N	{"UserId":1366}	{user}	f	\N	1366	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
2745	Kaylyn	\N	USD	2016-01-11 10:57:18.467-08	\N	\N	t	\N	https://res.cloudinary.com/opencollective/image/upload/v1483039249/i8n9dw-4_vxdyyi.jpg	kgibilterra	\N	\N	\N	\N	\N	\N	{"UserId":33}	{user}	f	\N	33	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
2804	Elijah Van Der Giessen	\N	USD	2017-05-10 16:45:43.307-07	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/d7d17c0e-20b0-40ae-a128-eaf85a311f0c	eli	\N	\N	\N	\N	\N	\N	{"UserId":4749}	{user}	f	\N	4749	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
2824	Roxane Castelein	\N	USD	2016-09-29 11:25:21.969-07	\N	\N	t	\N	\N	roxanecastelein	\N	\N	\N	\N	\N	\N	{"UserId":1348}	{user}	f	\N	1348	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
2929	KeSha Shah	\N	USD	2016-09-29 11:06:44.745-07	\N	\N	t	\N	\N	keshashah	\N	\N	\N	\N	\N	\N	{"UserId":1326}	{user}	f	\N	1326	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
3031	Laura Uzcátegui	\N	USD	2016-09-29 11:37:07.337-07	\N	\N	t	\N	\N	laurauzcátegui	\N	\N	\N	\N	\N	\N	{"UserId":1365}	{user}	f	\N	1365	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
3353	Ana Castro	\N	USD	2016-09-29 11:38:54.934-07	\N	\N	t	\N	\N	anacastro	\N	\N	\N	\N	\N	\N	{"UserId":1368}	{user}	f	\N	1368	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
2977	Allie Winkelman	\N	USD	2017-04-04 12:51:02.718-07	\N	\N	t	\N	\N	lwinkelman	\N	\N	\N	\N	\N	\N	{"UserId":3999}	{user}	f	\N	3999	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
2984	Brian Vinci	\N	USD	2017-05-15 05:07:56.682-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/4fc0a750-3967-11e7-955e-43d656f05f49.jpg	brian1	http://expeditionhacks.com/seattle	expeditionhacks	\N	\N	\N	\N	{"UserId":4834}	{user}	f	\N	4834	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
3056	Tanika Spates	\N	USD	2017-09-19 18:51:02.726-07	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/d754b688-cb57-4f8d-8b65-0b185558d8d0	tanikaspates	\N	\N	\N	\N	\N	\N	{"UserId":7543}	{user}	f	\N	7543	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
3042	Sarrah Vesselov	\N	USD	2016-09-29 11:28:08.475-07	\N	\N	t	\N	\N	sarrahvesselov	\N	\N	\N	\N	\N	\N	{"UserId":1352}	{user}	f	\N	1352	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
3116	Tamouse Temple	\N	USD	2017-01-18 05:49:53.082-08	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/8e79f1498f3e4a4ab53bec89d5dfc1e5_43f16060-dd85-11e6-bf52-5b99c6274a65.jpeg	tamouse1	http://www.tamouse.org	tamouse	\N	\N	\N	\N	{"UserId":2594}	{user}	f	\N	2594	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
3151	Neha Kaura	\N	USD	2016-09-29 11:01:49.703-07	\N	\N	t	\N	\N	nehakaura	\N	\N	\N	\N	\N	\N	{"UserId":1319}	{user}	f	\N	1319	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
3178	Kristine Paas	\N	USD	2017-05-08 22:59:11.628-07	\N	\N	t	\N	\N	kjcpaas	\N	\N	\N	\N	\N	\N	{"UserId":4711}	{user}	f	\N	4711	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
3210	Pamela Wood Browne	\N	USD	2016-09-29 11:06:00.962-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/2064f2a0-7674-11e7-b53b-2531e63eb442.jpg	pamelawoodbrowne	\N	fancybike	\N	\N	\N	\N	{"UserId":1325}	{user}	f	\N	1325	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
3229	Daphne Chong	\N	USD	2016-09-29 11:34:59.499-07	\N	\N	t	\N	\N	daphnechong	\N	\N	\N	\N	\N	\N	{"UserId":1362}	{user}	f	\N	1362	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
3271	Carola Nitz	\N	USD	2016-09-29 11:43:49.157-07	\N	\N	t	\N	\N	carolanitz	\N	\N	\N	\N	\N	\N	{"UserId":1376}	{user}	f	\N	1376	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
3418	Andreza Leite de Alencar	\N	USD	2016-09-29 11:19:11.446-07	\N	\N	t	\N	\N	andrezaleite	\N	\N	\N	\N	\N	\N	{"UserId":1343}	{user}	f	\N	1343	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
3440	Jennifer Bland	\N	USD	2017-06-26 05:59:53.458-07	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/d5ccc7c6-3a57-4ad2-80e3-902dafea62c5	ratracegrad	https://twitter.com/ratracegrad	ratracegrad	\N	\N	\N	\N	{"UserId":5616}	{user}	f	\N	5616	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
3413	Paige Hubbell	\N	USD	2016-03-19 15:11:44.881-07	\N	\N	t	\N	\N	phubbell	\N	\N	\N	\N	\N	\N	{"UserId":170}	{user}	f	\N	170	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
3441	Fernanda	\N	USD	2016-01-11 11:02:41.058-08	\N	\N	t	\N	https://media.licdn.com/media/AAEAAQAAAAAAAAJzAAAAJGZiYzM3MzEyLTVkYzgtNDg2Mi04Yzg3LWI1NDM0NDhhZjRhNQ.jpg	fsantander	\N	\N	\N	\N	\N	\N	{"UserId":37}	{user}	f	\N	37	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
3492	Emily Reese	\N	USD	2016-09-29 11:16:17.115-07	\N	\N	t	\N	\N	emilyreese	\N	\N	\N	\N	\N	\N	{"UserId":1340}	{user}	f	\N	1340	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
3529	Himi Sato	\N	USD	2016-09-29 11:33:37.087-07	\N	\N	t	\N	\N	himisato	\N	\N	\N	\N	\N	\N	{"UserId":1359}	{user}	f	\N	1359	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
3533	Joey Rosenberg	\N	USD	2016-06-21 09:02:52.874-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/IndianVisa_RosenbergJPG_17d93090-37ca-11e6-90ee-0555971b7ddd.JPG	joeycrose	\N	joeycrose	\N	\N	\N	\N	{"UserId":642}	{user}	f	\N	642	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
3538	Kelly Erickson	\N	USD	2017-01-03 12:59:33.995-08	\N	\N	t	\N	\N	kellyerickson	\N	\N	\N	\N	\N	\N	{"UserId":2416}	{user}	f	\N	2416	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
3483	Britten Kuckelman	\N	USD	2016-09-29 11:32:00.979-07	\N	\N	t	\N	\N	brittenkuckelman	\N	\N	\N	\N	\N	\N	{"UserId":1357}	{user}	f	\N	1357	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
3495	Candice Haddad	\N	USD	2016-09-29 11:02:54.555-07	\N	\N	t	\N	\N	candicehaddad	\N	\N	\N	\N	\N	\N	{"UserId":1321}	{user}	f	\N	1321	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
3845	Georgia Andrews	\N	USD	\N	\N	\N	t	\N	\N	georgia	\N	\N	\N	\N	\N	\N	{"UserId":577}	{user}	f	\N	577	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
3917	Jane Shih	\N	USD	2016-09-07 15:13:23.624-07	\N	\N	t	\N	\N	janeshih	\N	\N	\N	\N	\N	\N	{"UserId":1145}	{user}	f	\N	1145	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
3851	Kathy Trammell	\N	USD	2016-09-29 11:28:08.47-07	\N	\N	t	\N	\N	kathytrammell	\N	\N	\N	\N	\N	\N	{"UserId":1351}	{user}	f	\N	1351	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
3869	Aleksandra Gavriloska	\N	USD	2016-09-29 11:43:49.211-07	\N	\N	t	\N	\N	aleksandragavriloska	\N	\N	\N	\N	\N	\N	{"UserId":1379}	{user}	f	\N	1379	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
3898	Erin Spiceland	\N	USD	2017-03-07 11:01:52.704-08	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/4dedad77-5def-4d84-8e72-47bf0051649c	erin	\N	\N	\N	\N	\N	\N	{"UserId":3419}	{user}	f	\N	3419	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
3919	Christina Williams	\N	USD	2017-08-15 18:57:30.922-07	\N	\N	t	\N	\N	christinaispr	\N	\N	\N	\N	\N	\N	{"UserId":6656}	{user}	f	\N	6656	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
3980	Nataliia Ilchenko	WWCode Kyiv Director	USD	2017-01-03 16:00:00-08	\N	\N	t	\N	/public/images/users/avatar-04.svg	nataliia	\N	\N	\N	\N	\N	\N	{"UserId":2431}	{user}	f	\N	2431	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
3994	Gabriela Adamova	\N	USD	2016-01-29 15:19:43.713-08	\N	\N	t	\N	\N	gabrielaadamova	\N	\N	\N	\N	\N	\N	{"UserId":75}	{user}	f	\N	75	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
4128	Chantal	\N	USD	2016-01-29 15:19:36.407-08	\N	\N	t	\N	\N	chantal	\N	\N	\N	\N	\N	\N	{"UserId":74}	{user}	f	\N	74	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
4268	Grisel Ancona	Software engineer	USD	2016-09-29 11:15:23.931-07	\N	\N	t	\N	/public/images/users/avatar-04.svg	griselancona	\N	GrizAncona	\N	\N	\N	\N	{"UserId":1339}	{user}	f	\N	1339	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
4228	Alaina Percival	\N	USD	2016-03-01 20:41:59.905-08	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/fb1f0fd9-4da7-4c66-847b-0eaaf5fe88e9	alaina	http://womenwhocode.com	alaina	\N	\N	\N	\N	{"UserId":126}	{user}	f	\N	126	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
4301	Grain	\N	USD	2016-09-20 13:58:49.633-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/grainappio_20c2d740-7f75-11e6-998a-b5046561186d.png	grain_app	https://grainapp.io	grain_app	\N	\N	\N	\N	{"UserId":1244}	{user}	f	\N	1244	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
4356	Maru Lango	\N	USD	2016-02-02 08:52:02.222-08	\N	\N	t	\N	https://res.cloudinary.com/opencollective/image/upload/v1483038929/8vJ-Prbe_imotym.png	marulango	http://maruma.ru	Marulango	\N	\N	\N	\N	{"UserId":80}	{user}	f	\N	80	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
4527	Vanessa Sampang	\N	USD	2017-03-29 18:47:22.813-07	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/c97b5da8-c999-462b-aacd-9791efefb9f7	sampangvanessa	\N	\N	\N	\N	\N	\N	{"UserId":3825}	{user}	f	\N	3825	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
4923	Mia Zhu	\N	USD	2016-09-29 10:59:15.428-07	\N	\N	t	\N	\N	miazhu	\N	\N	\N	\N	\N	\N	{"UserId":1316}	{user}	f	\N	1316	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
4521	Radhika Rayadu	\N	USD	2016-09-29 11:41:11.058-07	\N	\N	t	\N	\N	radhikarayadu	\N	\N	\N	\N	\N	\N	{"UserId":1372}	{user}	f	\N	1372	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
4475	Anne Brown	\N	USD	2017-04-11 19:05:32.736-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/92dd7480-1f24-11e7-9a73-15e29bd9381e.png	abrown1411	\N	\N	\N	\N	\N	\N	{"UserId":4173}	{user}	f	\N	4173	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
4542	Shruti Sethi	\N	USD	2016-09-29 11:24:17.81-07	\N	\N	t	\N	\N	shrutisethi	\N	\N	\N	\N	\N	\N	{"UserId":1346}	{user}	f	\N	1346	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
4703	Amber Houle	\N	USD	2016-09-29 11:02:54.546-07	\N	\N	t	\N	\N	amberhoule	\N	\N	\N	\N	\N	\N	{"UserId":1320}	{user}	f	\N	1320	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
4595	Ashma Sethi	\N	USD	2016-09-29 11:24:17.802-07	\N	\N	t	\N	\N	ashmasethi	\N	\N	\N	\N	\N	\N	{"UserId":1345}	{user}	f	\N	1345	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
4707	Jordan McBride	\N	USD	2017-07-08 12:45:50.65-07	\N	\N	t	\N	/public/images/users/icon-avatar-placeholder.svg	jmcbr027	\N	\N	\N	\N	\N	\N	{"UserId":5939}	{user}	f	\N	5939	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
4726	Sue Sinclair	\N	USD	2017-02-27 16:25:15.503-08	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/c50d2350-ae0b-4347-9e9b-3b51d55fd22d	sue	\N	\N	\N	\N	\N	\N	{"UserId":3301}	{user}	f	\N	3301	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
4788	Sheree Atcheson	\N	USD	2016-09-29 10:54:53.462-07	\N	\N	t	\N	\N	shereeatcheson	\N	\N	\N	\N	\N	\N	{"UserId":1314}	{user}	f	\N	1314	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
4847	Yoka Liu	\N	USD	2016-09-29 11:26:35.139-07	\N	\N	t	\N	\N	yokaliu	\N	\N	\N	\N	\N	\N	{"UserId":1350}	{user}	f	\N	1350	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
4881	androidchick88	\N	USD	2017-02-01 09:30:43.176-08	\N	\N	t	\N	\N	androidchick88	\N	\N	\N	\N	\N	\N	{"UserId":2906}	{user}	f	\N	2906	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
4898	Stephanie Nguyen	\N	USD	2017-04-17 20:31:05.906-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/99b4ccf0-23e7-11e7-82a6-7b8ec7944781.png	stephanienguyen	\N	\N	\N	\N	\N	\N	{"UserId":4285}	{user}	f	\N	4285	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
4802	Eric Keathley	\N	USD	2017-07-16 20:18:20.74-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/bluecompassllccom_ba061fb0-6a9e-11e7-a92d-85a8d8a0100f.png	eric3	http://www.bluecompass-llc.com	https://twitter.com/bluecompass_llc	\N	\N	\N	\N	{"UserId":6100}	{user}	f	\N	6100	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
4932	Sally Kingston	\N	USD	2016-09-29 11:01:04.636-07	\N	\N	t	\N	\N	sallykingston	\N	\N	\N	\N	\N	\N	{"UserId":1318}	{user}	f	\N	1318	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
4989	Stella Kim	\N	USD	2017-05-15 09:21:27.312-07	\N	\N	t	\N	/public/images/users/avatar-03.svg	stella	\N	\N	\N	\N	\N	\N	{"UserId":4843}	{user}	f	\N	4843	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
4960	Maddy Lau	\N	USD	2016-11-30 08:11:38.749-08	\N	\N	t	\N	https://logo.clearbit.com/nycda.com	maddylau	http://nycda.com	nycodedesign	\N	\N	\N	\N	{"UserId":1957}	{user}	f	\N	1957	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
5147	alicia	\N	USD	2016-01-29 15:18:47.287-08	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/3d2736819a1347649241d5fc013c78bb_b2eeb330-5744-11e7-9949-3d27887721e6.jpeg	alicia	\N	\N	\N	\N	\N	\N	{"UserId":69}	{user}	f	\N	69	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
5180	Wei-Juin Lin	\N	USD	2016-10-07 09:49:14.297-07	\N	\N	t	\N	\N	wei-juinlin	\N	\N	\N	\N	\N	\N	{"UserId":1446}	{user}	f	\N	1446	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
5251	Shirley Hicks	Network director, Women Who Code Birmingham	USD	2016-09-29 10:43:14.052-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/7d7b2ba6c0a24e269f7853f4eb9fdced_72776110-b138-11e6-afe2-6129fbf4c498.png	shirleyhicks	\N	\N	\N	\N	\N	\N	{"UserId":1303}	{user}	f	\N	1303	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
5334	Oksana Denesiuk	\N	USD	2016-09-29 11:30:08.978-07	\N	\N	t	\N	\N	oksanadenesiuk	\N	\N	\N	\N	\N	\N	{"UserId":1355}	{user}	f	\N	1355	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
5439	Radhika Malik	\N	USD	2016-08-02 17:00:00-07	\N	\N	t	\N	\N	radhikam	\N	\N	\N	\N	\N	\N	{"UserId":897}	{user}	f	\N	897	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
5394	Glenna Buford	\N	USD	2016-09-29 11:43:49.205-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/8a3d40b0-8fed-11e6-b320-5125b901f984.jpg	glennabuford	\N	\N	\N	\N	\N	\N	{"UserId":1378}	{user}	f	\N	1378	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
5513	Barbara	\N	USD	2016-01-29 15:19:28.648-08	\N	\N	t	\N	\N	barbara	\N	\N	\N	\N	\N	\N	{"UserId":73}	{user}	f	\N	73	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
5560	Elizabeth Ferrao	\N	USD	2016-01-29 15:19:22.243-08	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/0addaf63-25c3-4f61-85bd-9ddec639dbaa	musingmurmurs	\N	MusingMurmurs	\N	\N	\N	\N	{"UserId":72}	{user}	f	\N	72	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
5606	Isabel Yepes	\N	USD	2016-09-29 11:13:48.772-07	\N	\N	t	\N	\N	isabelyepes	\N	\N	\N	\N	\N	\N	{"UserId":1337}	{user}	f	\N	1337	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
5622	Anouk Ruhaak	\N	USD	2016-09-29 11:43:49.04-07	\N	\N	t	\N	\N	anoukruhaak	\N	\N	\N	\N	\N	\N	{"UserId":1375}	{user}	f	\N	1375	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
5599	Claire Moss	\N	USD	2017-09-19 18:48:29.74-07	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/1d654409-1267-464f-98d2-61c302c1cdbd	aclairefication	https://twitter.com/aclairefication	aclairefication	\N	\N	\N	\N	{"UserId":7542}	{user}	f	\N	7542	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
5783	Abi Aryan	\N	USD	2017-05-20 04:50:16.138-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/41c2ba50-7d17-11e7-8aef-bf3ca7220b3a.JPG	abi	a	goabiaryan	\N	\N	\N	\N	{"UserId":4921}	{user}	f	\N	4921	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
5791	Chee Yim Goh	 I am generalist who are curious about a lot of things and often find myself dabble in both technical and management.	USD	2016-09-29 11:10:43.391-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/b06d105a90d849daae3cee823078ffbc_4c27ac00-0dcb-11e7-92a0-730911003b33.jpeg	cheeyimgoh	\N	\N	\N	\N	\N	\N	{"UserId":1331}	{user}	f	\N	1331	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
5788	Marcela Lango	\N	USD	2015-11-19 02:09:51.192-08	\N	\N	t	\N	https://pbs.twimg.com/profile_images/445400536569749504/8vJ-Prbe.png	maru	\N	\N	\N	\N	\N	\N	{"UserId":7}	{user}	f	\N	7	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
5849	Erica	\N	USD	2016-01-11 10:59:41.948-08	\N	\N	t	\N	https://pbs.twimg.com/profile_images/672467424273395712/m0VtgmYQ.jpg	estanley	\N	\N	\N	\N	\N	\N	{"UserId":35}	{user}	f	\N	35	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
5903	WWCode	\N	USD	2017-02-21 08:55:29.631-08	\N	\N	t	\N	\N	global	\N	\N	\N	\N	\N	\N	{"UserId":3206}	{user}	f	\N	3206	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
5922	Fatma Djoudjou	\N	USD	2016-09-29 10:49:43.051-07	\N	\N	t	\N	\N	fatmadjoudjou	\N	\N	\N	\N	\N	\N	{"UserId":1307}	{user}	f	\N	1307	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
6014	Jamie Lu	\N	USD	2016-11-28 07:33:11.726-08	\N	\N	t	\N	https://logo.clearbit.com/narrativescience.com	jamielu	http://www.narrativescience.com	\N	\N	\N	\N	\N	{"UserId":1890}	{user}	f	\N	1890	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
6017	Dayra	\N	USD	2016-01-11 11:01:43.411-08	\N	\N	t	\N	https://media.licdn.com/media/p/6/005/04f/283/2b9ae46.jpg	dchiu	\N	\N	\N	\N	\N	\N	{"UserId":36}	{user}	f	\N	36	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
6108	Shwetha Lakshman Rao	\N	USD	2016-09-29 10:51:29.333-07	\N	\N	t	\N	\N	shwethalakshmanrao	\N	\N	\N	\N	\N	\N	{"UserId":1309}	{user}	f	\N	1309	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
5975	Dinah Shi	\N	USD	2016-09-29 11:30:54.244-07	\N	\N	t	\N	\N	dinahshi	\N	\N	\N	\N	\N	\N	{"UserId":1356}	{user}	f	\N	1356	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
6020	Lucy Shang	\N	USD	2016-09-29 10:53:00.502-07	\N	\N	t	\N	\N	lucyshang	\N	\N	\N	\N	\N	\N	{"UserId":1311}	{user}	f	\N	1311	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
6067	Pieceofr	\N	USD	2016-09-09 20:42:48.933-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/2c8df290-7709-11e6-a96a-b97f0af14723.jpg	pieceofr	\N	\N	\N	\N	\N	\N	{"UserId":1158}	{user}	f	\N	1158	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
6283	Veronica Cannon	\N	USD	2016-09-29 11:17:47.289-07	\N	\N	t	\N	\N	veronicacannon	\N	\N	\N	\N	\N	\N	{"UserId":1342}	{user}	f	\N	1342	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
6280	Holly	\N	USD	2015-12-21 08:34:26.053-08	\N	\N	t	\N	https://media.licdn.com/media/AAEAAQAAAAAAAAUUAAAAJDVjMTAxNGYxLWZhZmUtNDQ4Yi1hMzFjLWIzYmU3MTZjNGYxNA.jpg	ogibson	\N	\N	\N	\N	\N	\N	{"UserId":28}	{user}	f	\N	28	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
6285	Karina	I am web developer, Director WWcode Recife - Brazil	USD	2016-09-29 11:19:11.45-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/a6711e2eef3c42dbaa7b9e658670e44e_65470050-13c0-11e7-8edd-59205a885cb5.jpeg	karinamachado	\N	\N	\N	\N	\N	\N	{"UserId":1344}	{user}	f	\N	1344	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
6353	Saranya Karuppusamy	\N	USD	2016-01-11 10:54:33.296-08	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/35f74ebjpg_d2d1c140-35a4-11e7-8caa-3b6f8e012814.jpeg	saranyawwc	\N	\N	\N	\N	\N	\N	{"UserId":32}	{user}	f	\N	32	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
6567	Amber Joyner	\N	USD	2016-09-29 11:01:04.636-07	\N	\N	t	\N	\N	amberjoyner	\N	\N	\N	\N	\N	\N	{"UserId":1317}	{user}	f	\N	1317	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
6674	Irina Muchnik	\N	USD	2016-09-29 11:12:58.838-07	\N	\N	t	\N	\N	irinamuchnik	\N	\N	\N	\N	\N	\N	{"UserId":1335}	{user}	f	\N	1335	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
6808	Candace Lazarou	\N	USD	2016-09-29 11:05:19.079-07	\N	\N	t	\N	\N	candacelazarou	\N	\N	\N	\N	\N	\N	{"UserId":1324}	{user}	f	\N	1324	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
6930	Lucy Bain	\N	USD	2016-09-29 11:34:59.504-07	\N	\N	t	\N	\N	lucybain	\N	\N	\N	\N	\N	\N	{"UserId":1363}	{user}	f	\N	1363	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
7099	Nupur Kapoor	\N	USD	2016-01-29 15:16:09.038-08	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/572a82f0-a28a-4e61-ba19-a0f09f1e812b	kapoornupur	\N	kapoornupur	\N	\N	\N	\N	{"UserId":67}	{user}	f	\N	67	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
7243	Jecelyn	\N	USD	2016-09-29 11:10:43.392-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/8146ec1d435a48c9a5f9d45600963c05_98566490-0ab0-11e7-85e3-cf8c26b6ca26.jpeg	jecelynyeen	\N	\N	\N	\N	\N	\N	{"UserId":1332}	{user}	f	\N	1332	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
7262	Eileen C	\N	USD	2017-01-14 09:11:39.224-08	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/7be57fdf74ce40868c36ec561b515b9d_8a6a4900-da7c-11e6-af11-676b2b71a93b.jpeg	eileenc	\N	\N	\N	\N	\N	\N	{"UserId":2549}	{user}	f	\N	2549	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
7288	Michelle Sun	\N	USD	2016-09-29 11:08:19.492-07	\N	\N	t	\N	\N	michellesun	\N	\N	\N	\N	\N	\N	{"UserId":1328}	{user}	f	\N	1328	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
7229	Rachel Minto	\N	USD	2017-09-06 18:04:11.287-07	\N	\N	t	\N	\N	rachelminto	\N	\N	\N	\N	\N	\N	{"UserId":7079}	{user}	f	\N	7079	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
7263	Lindsey Barrett	\N	USD	2016-06-22 13:09:43.896-07	\N	\N	t	\N	\N	lindseybarrett	\N	\N	\N	\N	\N	\N	{"UserId":646}	{user}	f	\N	646	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
7312	Viv Del Rio	\N	USD	2016-09-29 11:38:54.951-07	\N	\N	t	\N	\N	vivdelrio	\N	\N	\N	\N	\N	\N	{"UserId":1370}	{user}	f	\N	1370	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
7368	Nikko Patten	\N	USD	2017-04-10 18:09:47.41-07	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/2e150bf7-d054-400f-8f23-35dab9acf9c9	nikko	https://twitter.com/NikkoPatten	NikkoPatten	\N	\N	\N	\N	{"UserId":4153}	{user}	f	\N	4153	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
7538	Sandra	\N	USD	2016-01-11 10:53:43.73-08	\N	\N	t	\N	https://media.licdn.com/media/p/1/000/056/1e1/1c4c4e1.jpg	sandrawwc	\N	\N	\N	\N	\N	\N	{"UserId":31}	{user}	f	\N	31	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
7531	Racha Bella	\N	USD	2016-09-29 10:49:43.061-07	\N	\N	t	\N	\N	rachabella	\N	\N	\N	\N	\N	\N	{"UserId":1308}	{user}	f	\N	1308	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
7479	Sonia Prabhu	\N	USD	2016-09-29 11:41:11.058-07	\N	\N	t	\N	\N	soniaprabhu	\N	\N	\N	\N	\N	\N	{"UserId":1373}	{user}	f	\N	1373	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
7701	Nah	\N	USD	2017-08-14 14:46:20.881-07	\N	\N	t	\N	\N	daofzwci	\N	\N	\N	\N	\N	\N	{"UserId":6604}	{user}	f	\N	6604	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
7809	Polson & Polson, P.C.	\N	USD	2017-03-09 10:29:51.939-08	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/9R0XXM9_normalpng_75889240-04f6-11e7-8ab4-9b0a3890c09e.png	nalini	http://www.polsonlawfirm.com/	\N	\N	\N	\N	\N	{"UserId":3442}	{user}	f	\N	3442	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
7760	Aya Nakagawa	\N	USD	2016-09-29 11:33:37.088-07	\N	\N	t	\N	\N	ayanakagawa	\N	\N	\N	\N	\N	\N	{"UserId":1360}	{user}	f	\N	1360	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
8030	Gillian Colan-O'Leary	\N	USD	2016-09-29 10:54:53.45-07	\N	\N	t	\N	\N	gilliancolan-o'leary	\N	\N	\N	\N	\N	\N	{"UserId":1313}	{user}	f	\N	1313	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
7955	Marisol Acuna	\N	USD	2016-09-29 11:25:21.95-07	\N	\N	t	\N	\N	marisolacuna	\N	\N	\N	\N	\N	\N	{"UserId":1347}	{user}	f	\N	1347	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
8042	Christina Lynch	\N	USD	2016-09-29 11:37:07.344-07	\N	\N	t	\N	\N	christinalynch	\N	\N	\N	\N	\N	\N	{"UserId":1367}	{user}	f	\N	1367	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
8146	Amanda Folson	\N	USD	2017-01-16 10:03:53.479-08	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/2150894e-87e2-4dab-8ffa-894342f0336b	ambassadorawsum	http://amandafolson.net/about/#twitter	AmbassadorAwsum	\N	\N	\N	\N	{"UserId":2561}	{user}	f	\N	2561	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
8045	Hector Torres	\N	USD	2016-10-06 11:36:34.986-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/7aOKGnA1_normaljpg_f6ea41c0-8bf3-11e6-8916-b3b1b8ac2e00.jpeg	hectortorres	http://summit.ulahealth.me	ulahealth	\N	\N	\N	\N	{"UserId":1438}	{user}	f	\N	1438	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
8136	Carole Bennett	\N	USD	2016-09-29 11:03:46.798-07	\N	\N	t	\N	\N	carolebennett	\N	\N	\N	\N	\N	\N	{"UserId":1322}	{user}	f	\N	1322	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
8290	Geoff Domoracki	\N	USD	2016-08-03 10:47:13.173-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/devnetworkcom_68afcc20-6cc8-11e7-97a9-77db10ed5720.png	geoffdomoracki	http://apiworld.co/	\N	\N	\N	\N	\N	{"UserId":896}	{user}	f	\N	896	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
8253	Emily Heist Moss	\N	USD	2016-02-18 11:54:08.5-08	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/18b8dbe9-bc4b-4e82-b6db-b41eff9ca2e5	emilyheistmoss	\N	EmilyHeistMoss	\N	\N	\N	\N	{"UserId":108}	{user}	f	\N	108	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
8203	Rylee	\N	USD	2016-01-29 15:18:13.688-08	\N	\N	t	\N	\N	rylee	\N	\N	\N	\N	\N	\N	{"UserId":68}	{user}	f	\N	68	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
8319	юлія навка	\N	USD	2017-06-07 03:44:36.582-07	\N	\N	t	\N	\N	forestnavka	\N	\N	\N	\N	\N	\N	{"UserId":5256}	{user}	f	\N	5256	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
8375	Zoe Madden-Wood	\N	USD	2016-01-29 15:19:53.922-08	\N	\N	t	\N	\N	zoemadden-wood	\N	\N	\N	\N	\N	\N	{"UserId":77}	{user}	f	\N	77	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
8405	Snehal Patil	\N	USD	2016-09-29 11:41:11.059-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/eea1cd90-adc6-11e6-97ba-67ed1cda3697.png	snehalpatil	\N	\N	\N	\N	\N	\N	{"UserId":1374}	{user}	f	\N	1374	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
8492	Sarah Olson	Director of Women Who Code Twin Cities	USD	2016-03-07 01:51:08.328-08	\N	\N	t	I'm a Senior Software Engineer, currently working on the iOS app at Trello. I'm the Director of Women Who Code Twin Cities.	https://opencollective-production.s3-us-west-1.amazonaws.com/306b9860-dd87-11e6-aabd-af731cff2f24.jpeg	saraholson	https://www.linkedin.com/in/saraheolson	\N	\N	\N	\N	\N	{"UserId":142}	{user}	f	\N	142	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
8429	Brenda	\N	USD	2016-01-29 15:19:12.899-08	\N	\N	t	\N	\N	brenda	\N	\N	\N	\N	\N	\N	{"UserId":71}	{user}	f	\N	71	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
8451	Peggy Kuo	\N	USD	2016-09-29 11:34:59.505-07	\N	\N	t	\N	\N	peggykuo	\N	\N	\N	\N	\N	\N	{"UserId":1364}	{user}	f	\N	1364	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
8487	Gen Ashley	Director, Women Who Code London	USD	2016-09-29 11:11:53.842-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/f739ff80-86fd-11e6-9561-f9be8e5da60b.jpeg	genashley	\N	\N	\N	\N	\N	\N	{"UserId":1333}	{user}	f	\N	1333	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
15	WWCode Boulder/Denver	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2016-01-10 16:00:00-08	2016-12-27 08:29:26.21-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Boulder/Denver**](https://www.womenwhocode.com/boulder). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSf8Ot4bmuje76glYnrfKKepl2EphH2Feojg9_CfbwhgmG5NAw/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSf8Ot4bmuje76glYnrfKKepl2EphH2Feojg9_CfbwhgmG5NAw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSf8Ot4bmuje76glYnrfKKepl2EphH2Feojg9_CfbwhgmG5NAw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebd#support) to support WWCode Boulder/Denver \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/OSosQI7_aV.png	wwcodebd	\N	wwcodebd	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech",501c3}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
291	WWCode Toronto	WWCode is a global non-profit organization that inspires women to excel in technology careers.	CAD	2016-09-29 11:28:54.255-07	2016-12-28 08:20:52.347-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Toronto**](https://www.womenwhocode.com/toronto). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeEolspLAcmEXAfO8zKWGeTV1AIUXpI5KVKpTEGVwBol8J0bA/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeEolspLAcmEXAfO8zKWGeTV1AIUXpI5KVKpTEGVwBol8J0bA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeEolspLAcmEXAfO8zKWGeTV1AIUXpI5KVKpTEGVwBol8J0bA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Global**](https://opencollective.com/wwcodetoronto#support) to support WWCode Toronto \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/6dbdcea0-a519-11e6-b4fe-6966ef500b6b.png	wwcodetoronto	\N	womenwhocodeto	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
523	Women Who Code Sofia	\N	EUR	2017-02-21 12:04:48.889-08	2017-02-21 12:06:29.574-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeqyQYDNUIJRIt8q9SuZdzqOu2c2PV1oxPdtmG0D5r0fEbcwA/viewform)\n\n[**Attend**](https://www.womenwhocode.com/sofia) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeqyQYDNUIJRIt8q9SuZdzqOu2c2PV1oxPdtmG0D5r0fEbcwA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeqyQYDNUIJRIt8q9SuZdzqOu2c2PV1oxPdtmG0D5r0fEbcwA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesofia#support) to support WWCode Sofia \n\nQuestions? Email us at global@womenwhocode.com	\N	wwcodesofia	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
261	WWCode Al-Jazair	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 10:49:43.012-07	2016-12-23 08:44:45.61-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Al-Jaza'ir**](https://www.womenwhocode.com/al-jaza-ir-algeria). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfOOP_9i3fvCk5qLWvXgQFbCRUSdTaWKt020uhR4XKrVDO8kQ/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfOOP_9i3fvCk5qLWvXgQFbCRUSdTaWKt020uhR4XKrVDO8kQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfOOP_9i3fvCk5qLWvXgQFbCRUSdTaWKt020uhR4XKrVDO8kQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodealjazair#support) to support WWCode Al-Jaza'ir\n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/5cc6b9c0-9562-11e6-add0-93faa9a7296f.png	wwcodealjazair	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
269	WWCode Chennai	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:01:49.683-07	2016-12-23 11:40:22.493-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Chennai**](https://www.womenwhocode.com/chennai). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScl5ZvmRS9Owt5CfCPbGa6Y8WnJvau5v77p-jgsto_UaeAc_A/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScl5ZvmRS9Owt5CfCPbGa6Y8WnJvau5v77p-jgsto_UaeAc_A/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScl5ZvmRS9Owt5CfCPbGa6Y8WnJvau5v77p-jgsto_UaeAc_A/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodechennai#support) to WWCode Chennai \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/f50c62b0-9b99-11e6-b592-e7f426067276.png	wwcodechennai	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
265	WWCode Belo Horizonte	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 10:58:16.617-07	2016-12-23 09:07:51.328-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Belo Horizonte**](https://www.womenwhocode.com/belo-horizonte). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScQkF3yoa0K-EGz_ALcWXlGbWACzliOUG2k19B-kjDnAc9E-A/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScQkF3yoa0K-EGz_ALcWXlGbWACzliOUG2k19B-kjDnAc9E-A/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScQkF3yoa0K-EGz_ALcWXlGbWACzliOUG2k19B-kjDnAc9E-A/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebelohorizonte#support) to support WWCode Belo Horizonte \n\nQuestions? Email us at global@womenwhocode.com.  \n\n	\N	wwcodebelohorizonte	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
9804	Women Who Code org	WWCode is a global non-profit organization dedicated to inspiring women to excel in technology careers. 	USD	2015-10-31 17:00:00-07	2017-11-09 11:30:20.536-08	\N	t	Women Who Code (WWCode) is a global 501(c)(3) non-profit dedicated to inspiring women to excel in technology careers. We connect amazing women with other like-minded women around the globe who unite under one simple notion – the world of technology is better with women in it. \n\nWe work hard every day to inspire engineers to advance their careers. We strongly believe in the value of diversity, and envision a world where women are representative as technical executives, founders, venture capitalists, board members, and software engineers. \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events**](https://www.womenwhocode.com/events). \n\n[**Get Involved:**](https://docs.google.com/forms/d/e/1FAIpQLSfIho8JwdkT05STQ6q_1c_cv3kVBsO1I1udKVgf2XaAU5Tnfw/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfIho8JwdkT05STQ6q_1c_cv3kVBsO1I1udKVgf2XaAU5Tnfw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfIho8JwdkT05STQ6q_1c_cv3kVBsO1I1udKVgf2XaAU5Tnfw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Support**](https://opencollective.com/wwcode#support) WWCode financially by making a donation below\n\nYour donations are critical in supporting this catalytic movement. Donations received here directly support our programs. A small amount also supports global development so that we can bring innovative program to cities around the world, ensuring that more women everywhere have the opportunity to excel in technology careers.\n\nQuestions? Email us at contact@womenwhocode.com. 	https://opencollective-production.s3-us-west-1.amazonaws.com/50bd4ad0-769b-11e6-90e1-0dd449fe12b2.png	wwcode	http://womenwhocode.com	womenwhocode	We are on a mission to inspire women to excel in tech careers.	\N	10	{"apply": true}	{"UserId":3,"githubContributors":{},"repos":{}}	{wwcode,meetup,"diversity in tech",501c3}	f	3	3	\N	\N	ORGANIZATION	\N	\N	\N	\N	\N	\N	\N	\N	\N
430	WWCode Kyiv	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2017-01-03 16:00:00-08	2017-01-04 11:36:29.052-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Kyiv**](https://www.womenwhocode.com/kyiv). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdSGUMDGoRoh5mNYBxjxgH8Y4zBpu_BmtIr7fBiaSSGP1l-DA/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdSGUMDGoRoh5mNYBxjxgH8Y4zBpu_BmtIr7fBiaSSGP1l-DA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdSGUMDGoRoh5mNYBxjxgH8Y4zBpu_BmtIr7fBiaSSGP1l-DA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodekyiv#support) to support WWCode Kyiv \n\nQuestions? Email us at global@womenwhocode.com.  \n	\N	wwcodekyiv	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
515	Women Who Code Philadelphia	\N	USD	2017-02-21 10:49:14.309-08	2017-02-21 10:55:30.087-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScOnXC5YWNaq0a4WzrYDTAhTFNmWyFGgpMJaoanAVxIQHoEIQ/viewform)\n\n[**Attend**](https://www.womenwhocode.com/philadelphia) an event \n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScOnXC5YWNaq0a4WzrYDTAhTFNmWyFGgpMJaoanAVxIQHoEIQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScOnXC5YWNaq0a4WzrYDTAhTFNmWyFGgpMJaoanAVxIQHoEIQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodephiladelphia#support) to support WWCode Philadelphia \n\nQuestions? Email us at global@womenwhocode.com.\n\n	\N	wwcodephiladelphia	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech",501c3}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
294	WWCode Wichita	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:32:00.962-07	2016-12-28 08:31:16.784-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Wichita**](https://www.womenwhocode.com/wichita). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSduY4sClbMfcDUnUl1_ZYK_HwA-ui81pWBcXF40sEuGL8bdTw/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSduY4sClbMfcDUnUl1_ZYK_HwA-ui81pWBcXF40sEuGL8bdTw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSduY4sClbMfcDUnUl1_ZYK_HwA-ui81pWBcXF40sEuGL8bdTw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodewichita#support) to support WWCode Wichita \n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/6cae1920-a6d6-11e6-bdef-45bfa9f9c1b0.png	wwcodewichita	\N	wwcodewichita	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech",501c3}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
512	Women Who Code Cincinnati	\N	USD	2017-02-21 10:11:30.741-08	2017-02-21 10:14:42.695-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Attend**](https://www.womenwhocode.com/cincinnati) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScMYZSUklxgo7irAfTbcOrz06jjuibholjPNS-rBoSvWLHGow/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScMYZSUklxgo7irAfTbcOrz06jjuibholjPNS-rBoSvWLHGow/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodecincinnati#support) to support WWCode Cincinnati \n\nQuestions? Email us at global@womenwhocode.com.\n\n\n	\N	wwcodecincinnati	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech",501c3}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
511	Women Who Code Monterrey	\N	MXN	2017-02-21 08:55:29.596-08	2017-02-21 09:26:29.52-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeKBYnRkINdl2_FjUOTp0hd11bK3RQnOdaEJzFDI6tlv5ntkA/viewform)\n\n[**Attend**](https://www.womenwhocode.com/monterrey) an event \n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeKBYnRkINdl2_FjUOTp0hd11bK3RQnOdaEJzFDI6tlv5ntkA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeKBYnRkINdl2_FjUOTp0hd11bK3RQnOdaEJzFDI6tlv5ntkA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodemonterrey#support) to support WWCode Boston \n\n\n\n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/d32e97d0-f85a-11e6-aebb-a9d659d01ec2.png	wwcodemonterrey	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3206	3206	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
519	Women Who Code Cleveland	\N	USD	2017-02-21 11:25:28.662-08	2017-02-21 11:28:23.116-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdReC87KXP-eOhEI_mk0iPL0ovyADL1gnIGbzUvjt90NGCupw/viewform)\n\n[**Attend**](https://www.womenwhocode.com/cleveland) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdReC87KXP-eOhEI_mk0iPL0ovyADL1gnIGbzUvjt90NGCupw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdReC87KXP-eOhEI_mk0iPL0ovyADL1gnIGbzUvjt90NGCupw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodecleveland#support) to support WWCode Cleveland \n\nQuestions? Email us at global@womenwhocode.com.\n	\N	wwcodecleveland	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech",501c3}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
510	Women Who Code Richmond	\N	USD	2017-02-21 08:25:28.328-08	2017-02-21 08:25:28.5-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!	\N	wwcoderichmond	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech",501c3}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
268	WWCode Charleston	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:01:04.477-07	2016-12-23 11:37:13.42-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Charleston**](https://www.womenwhocode.com/charleston). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfJBAX-EQdRtOiWJWxVJhKNKTiA2Hc09jduycgYjfSLH2U7Ig/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfJBAX-EQdRtOiWJWxVJhKNKTiA2Hc09jduycgYjfSLH2U7Ig/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfJBAX-EQdRtOiWJWxVJhKNKTiA2Hc09jduycgYjfSLH2U7Ig/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodecharleston#support) to support WWCode Charleston\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/a185ed40-9b95-11e6-b592-e7f426067276.png	wwcodecharleston	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech",501c3}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
262	WWCode Bangalore	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 10:51:29.29-07	2016-12-23 08:55:34.516-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Bangalore**](https://www.womenwhocode.com/bangalore). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeKojMYDN0UYJdAZSfFteESv9WL0i2Jen4zYQpsXYJOorAjIw/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeKojMYDN0UYJdAZSfFteESv9WL0i2Jen4zYQpsXYJOorAjIw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeKojMYDN0UYJdAZSfFteESv9WL0i2Jen4zYQpsXYJOorAjIw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebangalore#support) to support WWCode Bangalore\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/fe02eee0-961a-11e6-a6e9-23ce753be86b.png	wwcodebangalore	\N	wwcodebangalore	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
3022	Fair Inso	\N	USD	2017-09-08 04:51:35.448-07	2017-11-01 18:28:55.377-07	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/6db00532-c104-4a19-a8e1-c597409b995e	fairlaneinso	\N	\N	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/f2da3790-bf6c-11e7-93c4-43ceea83b1b6.JPG	\N	\N	{"UserId":7136}	{user}	f	7136	7136	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
9451	emilypmendez	\N	USD	2017-10-24 11:04:44.229-07	2017-10-24 11:04:44.229-07	\N	t	\N	\N	emilypmendez	\N	\N	\N	\N	5	\N	{"UserId":8512}	\N	f	\N	8512	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
264	WWCode Belfast	WWCode is a global non-profit organization that inspires women to excel in technology careers.	GBP	2016-09-29 10:54:53.422-07	2017-10-19 08:22:05.263-07	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Belfast**](https://www.womenwhocode.com/belfast). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfRGOc9xuV0n4ltXd1p3xvb_TU_VaxEXxOYex6SVZQpJmH6Aw/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfRGOc9xuV0n4ltXd1p3xvb_TU_VaxEXxOYex6SVZQpJmH6Aw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfRGOc9xuV0n4ltXd1p3xvb_TU_VaxEXxOYex6SVZQpJmH6Aw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebelfast#support) to support WWCode Belfast\n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/e1bb8200-96e8-11e6-baa3-69f47ab52eed.png	wwcodebelfast	https://twitter.com/WWCBelfast	WWCBelfast	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
8638	Aseem Sood	Cofounder, Open Collective.	USD	2015-11-30 12:20:11.257-08	\N	\N	t	Tell us more about you, why you are on OpenCollective, what types of collectives you would love to contribute to, etc.\n\nProtip: you can use [markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)	https://opencollective-production.s3-us-west-1.amazonaws.com/jMoeGBOJjpg_d83f6890-a13d-11e6-a8af-411ab4a2c609.jpeg	aseem	\N	AseemSood_	\N	\N	\N	\N	{"UserId":8}	{user}	f	\N	8	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
525	Women Who Code Pune	\N	USD	2017-02-21 12:16:59.055-08	2017-02-21 12:18:19.484-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScJkMSAeQ1r0L6uAFd-QO4-sHwEJ8BuD3tTdHSYzOkRkZGIhQ/viewform)\n\n[**Attend**](https://www.womenwhocode.com/pune) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScJkMSAeQ1r0L6uAFd-QO4-sHwEJ8BuD3tTdHSYzOkRkZGIhQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScJkMSAeQ1r0L6uAFd-QO4-sHwEJ8BuD3tTdHSYzOkRkZGIhQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodepune#support) to support WWCode Pune \n\nQuestions? Email us at global@womenwhocode.com.\n\n	\N	wwcodepune	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech",501c3}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
518	Women Who Code Singapore	\N	USD	2017-02-21 11:13:03.341-08	2017-02-21 11:19:36.571-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScjlltFEdGKQPEmz-VgLXm-yYaT1K8RqGqbAt-I7ozlLH4D-Q/viewform)\n\n[**Attend**](https://www.womenwhocode.com/singapore) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScjlltFEdGKQPEmz-VgLXm-yYaT1K8RqGqbAt-I7ozlLH4D-Q/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScjlltFEdGKQPEmz-VgLXm-yYaT1K8RqGqbAt-I7ozlLH4D-Q/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesingapore#support) to support WWCode Singapore\n\nQuestions? Email us at global@womenwhocode.com.\n	\N	wwcodesingapore	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
47	WWCode Delhi	WWCode inspires women to excel in technology careers.	USD	2016-03-06 16:00:00-08	2016-12-27 08:24:21.89-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Delhi**](https://www.womenwhocode.com/delhi). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeIWjjfybWImspAgeEVa_K6bnuV-3jqSt951M2x5VTrp1ymZw/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeIWjjfybWImspAgeEVa_K6bnuV-3jqSt951M2x5VTrp1ymZw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeIWjjfybWImspAgeEVa_K6bnuV-3jqSt951M2x5VTrp1ymZw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodedelhi#support) to support WWCode Delhi \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/MFUk1nU_IQ.png	wwcodedelhi	https://www.womenwhocode.com/dc	wwcode_delhi	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
282	WWCode Merida	WWCode is a global non-profit organization that inspires women to excel in technology careers.	MXN	2016-09-29 11:15:23.91-07	2016-12-27 09:55:44.4-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Merida**](https://www.womenwhocode.com/merida). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodemerida#support) to support WWCode Merida \n\nQuestions? Email us at global@womenwhocode.com.	https://opencollective-production.s3-us-west-1.amazonaws.com/af808880-cc5d-11e6-be07-3dfc36c6d12c.png	wwcodemerida	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
275	WWCode Hong Kong 	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:08:19.455-07	2016-12-27 08:53:38.119-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Hong Kong**](https://www.womenwhocode.com/hk). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdg4XdtRKCzgpTopZtXsshtrXO1XRrUSlWo3ga29vxAAh_AtA/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdg4XdtRKCzgpTopZtXsshtrXO1XRrUSlWo3ga29vxAAh_AtA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdg4XdtRKCzgpTopZtXsshtrXO1XRrUSlWo3ga29vxAAh_AtA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodehongkong#support) to support WWCode Hong Kong \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/adea85b0-9c7a-11e6-a3da-b7d8fa4b13cd.png	wwcodehongkong	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	WWCode New York	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2015-12-12 16:14:54.028-08	2016-12-27 10:05:42.126-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in New York City**](https://www.womenwhocode.com/nyc). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSc7votVvy_Q06MsZNEjAbjI0c9WmQugN-YxRKOlLW4nu9DKtg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSc7votVvy_Q06MsZNEjAbjI0c9WmQugN-YxRKOlLW4nu9DKtg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSc7votVvy_Q06MsZNEjAbjI0c9WmQugN-YxRKOlLW4nu9DKtg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodenyc#support) to support WWCode New York City \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/sjus3sm9uv.png	wwcodenyc	http://www.meetup.com/WomenWhoCodeNYC/	wwcodenyc	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech",501c3}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	WWCode San Francisco	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2015-12-12 16:14:54.028-08	2016-12-27 11:54:09.597-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in San Francisco**](https://www.womenwhocode.com/sf). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSebpozJA-r33FvptTT2XFNoV66gxMm0NZn1oVDV64A1VeW0GQ/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSebpozJA-r33FvptTT2XFNoV66gxMm0NZn1oVDV64A1VeW0GQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSebpozJA-r33FvptTT2XFNoV66gxMm0NZn1oVDV64A1VeW0GQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesf#support) to support WWCode San Francisco\n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/6kFcX-6H5l.png	wwcodesf	http://www.meetup.com/Women-Who-Code-SF	wwcodesf	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech",501c3}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
14	WWCode Seattle	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2016-01-10 16:00:00-08	2016-12-27 11:51:31.023-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Seattle**](https://www.womenwhocode.com/seattle). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfRpz1uqBWm1MVnVTTSK1EvAAwBzLFreVS5qyDV1y6Wrxi9HQ/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfRpz1uqBWm1MVnVTTSK1EvAAwBzLFreVS5qyDV1y6Wrxi9HQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfRpz1uqBWm1MVnVTTSK1EvAAwBzLFreVS5qyDV1y6Wrxi9HQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcode-seattle#support) to support WWCode Seattle \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/48297200-90a8-11e6-a134-f381d4cd2713.png	wwcodeseattle	https://www.womenwhocode.com/seattle	wwcode-seattle	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech",501c3}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	WWCode Austin	WWCode is a global non-profit organization that inspires women to excel in technology careers. 	USD	2015-12-12 16:14:54.028-08	2016-12-23 07:30:21.805-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Austin**](https://www.womenwhocode.com/austin). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeAl3dRRR312S1CcQonYE72JDumGhpuh6G9INhyrJxOM1w16g/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeAl3dRRR312S1CcQonYE72JDumGhpuh6G9INhyrJxOM1w16g/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeAl3dRRR312S1CcQonYE72JDumGhpuh6G9INhyrJxOM1w16g/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeaustin#support) to support WWCode Austin \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/mX6wUEonFH.png	wwcodeaustin	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech",501c3}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
520	Women Who Code San Diego	\N	USD	2017-02-21 11:34:46.927-08	2017-02-21 11:36:23.416-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdBi2chRGnaQrBG5-f1g2_aLxwpviZDmqgGluf0rJ3t_Uyi1Q/viewform)\n\n[**Attend**](https://www.womenwhocode.com/sandiego) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdBi2chRGnaQrBG5-f1g2_aLxwpviZDmqgGluf0rJ3t_Uyi1Q/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdBi2chRGnaQrBG5-f1g2_aLxwpviZDmqgGluf0rJ3t_Uyi1Q/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesandiego#support) to support WWCode San Diego\n\nQuestions? Email us at global@womenwhocode.com.\n\n\n\n	\N	wwcodesandiego	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech",501c3}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
270	WWCode Chicago	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:02:54.513-07	2016-12-23 11:48:12.132-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Chicago**](https://www.womenwhocode.com/chicago). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSe4Vang3taPJd47st_fHZyaQLG7jst0g9fjS7h8FbBpitGUNA/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSe4Vang3taPJd47st_fHZyaQLG7jst0g9fjS7h8FbBpitGUNA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSe4Vang3taPJd47st_fHZyaQLG7jst0g9fjS7h8FbBpitGUNA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodechicago#support) to support WWCode Chicago \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/aef68840-9b9a-11e6-b592-e7f426067276.png	wwcodechicago	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech",501c3}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
292	WWCode Vinnytsia	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:30:08.953-07	2016-12-28 08:27:20.161-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Vinnytsia**](https://www.womenwhocode.com/vinnytsia). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSd0I08q3ZAM8fRBchvB1oG9-8I5J3PlUwGcZreDWvtu2uSulg/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSd0I08q3ZAM8fRBchvB1oG9-8I5J3PlUwGcZreDWvtu2uSulg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSd0I08q3ZAM8fRBchvB1oG9-8I5J3PlUwGcZreDWvtu2uSulg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodevinnytsia#support) to support WWCode Vinnytsia \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/fcac9e50-a51b-11e6-b4fe-6966ef500b6b.png	wwcodevinnytsia	\N	WWCodeVinnytsia	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
283	WWCode Paris	WWCode is a global non-profit organization that inspires women to excel in technology careers.	EUR	2016-09-29 11:16:17.095-07	2016-12-27 10:09:21.598-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Paris**](https://www.womenwhocode.com/paris). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScDi0VhEDuM3nMheBFIV7F-b0tjG6SIFTXAg7FtkeVJK_P1fw/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScDi0VhEDuM3nMheBFIV7F-b0tjG6SIFTXAg7FtkeVJK_P1fw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScDi0VhEDuM3nMheBFIV7F-b0tjG6SIFTXAg7FtkeVJK_P1fw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeparis#support) to support WWCode Paris \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/17525ef0-9d44-11e6-9116-db595ff259df.png	wwcodeparis	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
276	WWCode Kingston	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:09:42.765-07	2016-12-27 08:58:14.247-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Kingston**](https://www.womenwhocode.com/kingston). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeboston#support) to support WWCode Kingston \n\nQuestions? Email us at global@womenwhocode.com.	https://opencollective-production.s3-us-west-1.amazonaws.com/a7236520-cc55-11e6-be07-3dfc36c6d12c.png	wwcodekingston	\N	wwcodekingston	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
266	WWCode Brisbane	WWCode is a global non-profit organization that inspires women to excel in technology careers.	AUD	2016-09-29 10:59:15.405-07	2016-12-23 09:39:30.07-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Brisbane**](https://www.womenwhocode.com/brisbane). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeGniU6iD6vig-CTBWj9EVRLPCxz5ZrdLGoprkDZlGSVHZgOg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeGniU6iD6vig-CTBWj9EVRLPCxz5ZrdLGoprkDZlGSVHZgOg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeGniU6iD6vig-CTBWj9EVRLPCxz5ZrdLGoprkDZlGSVHZgOg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebrisbane#support) to support WWCode Brisbane\n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/abcc78e0-c936-11e6-9af0-47fca5e686db.png	wwcodebrisbane	\N	wwcodebrisbane	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
267	WWCode Bristol 	WWCode is a global non-profit organization that inspires women to excel in technology careers.	GBP	2016-09-29 11:00:01.773-07	2016-12-23 09:54:17.915-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Bristol**](https://www.womenwhocode.com/bristol). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeUCObM0_rq9q-EVLkiiYGCkSXaRVQyiM5bVNGBUHBvQhCeig/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeUCObM0_rq9q-EVLkiiYGCkSXaRVQyiM5bVNGBUHBvQhCeig/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeUCObM0_rq9q-EVLkiiYGCkSXaRVQyiM5bVNGBUHBvQhCeig/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebristol#support) to support WWCode Bristol \n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/bea58950-c938-11e6-9af0-47fca5e686db.png	wwcodebristol	\N	wwcbristol	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	WWCode Mexico City	Nos dedicamos a inspirar inspirar a más mujeres a ser parte y destacar en carreras del mundo tecnológico.	MXN	2016-01-08 16:22:34.216-08	2016-12-27 09:59:26.298-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Mexico City**](https://www.womenwhocode.com/df). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfM35OQcwHB2moghLk3ZC1Vs-chWz_NkDdbEo984Sx1sa3Trg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfM35OQcwHB2moghLk3ZC1Vs-chWz_NkDdbEo984Sx1sa3Trg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfM35OQcwHB2moghLk3ZC1Vs-chWz_NkDdbEo984Sx1sa3Trg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodedf#support) to support WWCode Mexico City \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/XMv1EFIxek.png	wwcodedf	http://www.meetup.com/Women-Who-Code-Mexico-City/	wwcodedf	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
301	WWCode Berlin	WWCode is a global non-profit organization that inspires women to excel in technology careers.	EUR	2016-09-29 11:43:48.834-07	2016-12-23 09:11:29.559-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Berlin**](https://www.womenwhocode.com/berlin). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdJ94P4XoVzynK8rqZ4O5UaoenMUEtDlgJidbGvq5ed4yHBNg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdJ94P4XoVzynK8rqZ4O5UaoenMUEtDlgJidbGvq5ed4yHBNg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdJ94P4XoVzynK8rqZ4O5UaoenMUEtDlgJidbGvq5ed4yHBNg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeberlin#support) to support WWCode Berlin \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/81940c10-8fd8-11e6-b320-5125b901f984.png	wwcodeberlin	\N	wwcodeberlin	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
524	Women Who Code Barcelona	\N	EUR	2017-02-21 12:11:44.714-08	2017-02-21 12:13:31.987-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfyIV5MJgha1rYTlKdJ9frxSrFW55jGltiYpumAdsqCE8heKQ/viewform)\n\n[**Attend**](https://www.womenwhocode.com/barcelona) an event \n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfyIV5MJgha1rYTlKdJ9frxSrFW55jGltiYpumAdsqCE8heKQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfyIV5MJgha1rYTlKdJ9frxSrFW55jGltiYpumAdsqCE8heKQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebarcelona#support) to support WWCode Barcelona\n\nQuestions? Email us at global@womenwhocode.com.\n\n	\N	wwcodebarcelona	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech",501c3}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
277	WWCode Kuala Lumpur	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:10:43.356-07	2016-12-27 09:02:13.485-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Kuala Lumpur**](https://www.womenwhocode.com/kl). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodekualalumpur#support) to support WWCode Kuala Lumpur\n\nQuestions? Email us at global@womenwhocode.com.	https://opencollective-production.s3-us-west-1.amazonaws.com/35b70760-cc56-11e6-be07-3dfc36c6d12c.png	wwcodekualalumpur	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
517	Women Who Code Manila	\N	USD	2017-02-21 11:07:25.163-08	2017-08-08 11:19:47.307-07	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reWWCode is a non-profit organization that inspires women to excel in technology careers.\nach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a member\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdFBYTGWumG1PbY65unD1atkWRgBhG2bArurTMwpE6xpnHNYQ/viewform)\n\n[**Attend**](https://www.womenwhocode.com/manila) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdFBYTGWumG1PbY65unD1atkWRgBhG2bArurTMwpE6xpnHNYQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdFBYTGWumG1PbY65unD1atkWRgBhG2bArurTMwpE6xpnHNYQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodemanila#support) to support WWCode Manila \n\nQuestions? Email us at global@womenwhocode.com.\n	https://opencollective-production.s3-us-west-1.amazonaws.com/26a6e630-7c66-11e7-b7e9-69e47fd32944.png	wwcodemanila	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
13	WWCode Washington DC	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2016-01-10 16:00:00-08	2016-12-27 08:21:52.463-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Washington D.C.**](https://www.womenwhocode.com/dc). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfQTzXxQVzlXSGnqhaMVNhxtfPid3fMiQt5rSISqGy8FbNtIg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfQTzXxQVzlXSGnqhaMVNhxtfPid3fMiQt5rSISqGy8FbNtIg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfQTzXxQVzlXSGnqhaMVNhxtfPid3fMiQt5rSISqGy8FbNtIg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodedc#support) to support WWCode Washington D.C. \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/rhyrbLvkli.png	wwcodedc	https://www.womenwhocode.com/dc	wwcodedc	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech",501c3}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	Women Who Code Atlanta	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2016-01-10 16:00:00-08	2016-12-23 08:56:56.09-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Atlanta**](https://www.womenwhocode.com/atl). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdkKQPrNlXYI2XDQcYK8rpW9PwXHzEZPrcyLq074-GmTJtxJg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdkKQPrNlXYI2XDQcYK8rpW9PwXHzEZPrcyLq074-GmTJtxJg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdkKQPrNlXYI2XDQcYK8rpW9PwXHzEZPrcyLq074-GmTJtxJg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeatl#support) to support WWCode Atlanta\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/NzLkW4RcED.png	wwcodeatl	\N	wwcodeatl	We are on a mission to inspire women to excel in tech careers.	\N	25	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech",501c3}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
195	WWCode Boston	WWCode is a global non-profit organization that inspires women to excel in technology careers. 	USD	2015-12-12 16:14:54.028-08	2016-12-23 09:29:46.034-08	\N	t	Women Who Code (WWCode) is a global 501(c)(3) non-profit dedicated to inspiring women to excel in technology careers. We connect amazing women with other like-minded women around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 50,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Boston**](https://www.womenwhocode.com/boston). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an upcoming event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeboston#support) to support WWCode Boston \n\nQuestions?  Email global@womenwhocode.com	https://cldup.com/E6Hx_qyE9A.png	wwcodeboston	https://www.womenwhocode.com/boston	wwcboston	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech",501c3}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
278	WWCode London	WWCode is a global non-profit organization that inspires women to excel in technology careers.	GBP	2016-09-29 11:11:53.804-07	2016-12-27 09:29:43.796-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in London**](https://www.womenwhocode.com/london). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfksXAlw11lW_lHn5JMK3pLFTWY3f_LQn9zTBajKH4JHGmUEw/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfksXAlw11lW_lHn5JMK3pLFTWY3f_LQn9zTBajKH4JHGmUEw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfksXAlw11lW_lHn5JMK3pLFTWY3f_LQn9zTBajKH4JHGmUEw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodelondon#support) WWCode London \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/8df462c0-9091-11e6-a134-f381d4cd2713.png	wwcodelondon	\N	wwclondon	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
281	WWCode Melbourne	WWCode is a global non-profit organization that inspires women to excel in technology careers.	AUD	2016-09-29 11:14:46.59-07	2016-12-27 09:51:32.497-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Melbourne**](https://www.womenwhocode.com/melbourne). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodemelbourne#support) to support WWCode Melbourne\n\nQuestions? Email us at global@womenwhocode.com.	https://opencollective-production.s3-us-west-1.amazonaws.com/19756e50-cc5d-11e6-be07-3dfc36c6d12c.png	wwcodemelbourne	\N	WWCodeMelbourne	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
274	WWCode Gujarat	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:06:44.732-07	2016-12-27 08:50:50.189-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Gujarat**](https://www.womenwhocode.com/gujarat). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfKPlXR-We8gxAKHZUh6eZ2cZDhSUcwDTDepFfquKPHax63mA/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfKPlXR-We8gxAKHZUh6eZ2cZDhSUcwDTDepFfquKPHax63mA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfKPlXR-We8gxAKHZUh6eZ2cZDhSUcwDTDepFfquKPHax63mA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodegujarat#support) to support WWCode Gujarat\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/52506d70-9c78-11e6-a3da-b7d8fa4b13cd.png	wwcodegujarat	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
297	WWCode Sydney	WWCode is a global non-profit organization that inspires women to excel in technology careers.	AUD	2016-09-29 11:34:59.472-07	2016-12-28 07:55:06.005-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Sydney**](https://www.womenwhocode.com/sydney-australia). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScZnIDanwBEgvSarNoteC9emDTvctZYwySJBJUKL2fcj9K-8Q/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScZnIDanwBEgvSarNoteC9emDTvctZYwySJBJUKL2fcj9K-8Q/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScZnIDanwBEgvSarNoteC9emDTvctZYwySJBJUKL2fcj9K-8Q/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesydney#support) to support WWCode Sydney \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/405f1180-a514-11e6-b4fe-6966ef500b6b.png	wwcodesydney	\N	wwcsyd	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
298	WWCode Dublin	WWCode is a global non-profit organization that inspires women to excel in technology careers.	EUR	2016-09-29 11:37:07.255-07	2016-12-27 08:33:19.532-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Dublin**](https://www.womenwhocode.com/wwcode-dublin). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdwrnolSbTtRkhg26WVios4q-3GxchiTiK1SNA24d-9qtMOjw/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdwrnolSbTtRkhg26WVios4q-3GxchiTiK1SNA24d-9qtMOjw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdwrnolSbTtRkhg26WVios4q-3GxchiTiK1SNA24d-9qtMOjw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodedublin#support) to support WWCode Dublin \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/70bbbe00-9ba5-11e6-84fe-5d5e57220970.png	wwcodedublin	\N	wwcodedublin	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
263	WWCode Beijing	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 10:53:00.452-07	2016-12-23 08:58:56.927-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Beijing**](https://www.womenwhocode.com/beijing). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSd7966PGrpuX1wfVL07PwwpupzTIrIi_T2WhJUe8nB4iK60dQ/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSd7966PGrpuX1wfVL07PwwpupzTIrIi_T2WhJUe8nB4iK60dQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSd7966PGrpuX1wfVL07PwwpupzTIrIi_T2WhJUe8nB4iK60dQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebeijing#support) to support WWCode Beijing\n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/f6793200-961b-11e6-a6e9-23ce753be86b.png	wwcodebeijing	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
521	Women Who Code Raleigh Durham	\N	USD	2017-02-21 11:39:46.205-08	2017-02-21 11:41:19.26-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSf0bA8m8nAIKsVtnstXcG1fYydPvvu_sHm-zm-FzTngTAQvzg/viewform)\n\n[**Attend**](https://www.womenwhocode.com/raleigh) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSf0bA8m8nAIKsVtnstXcG1fYydPvvu_sHm-zm-FzTngTAQvzg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSf0bA8m8nAIKsVtnstXcG1fYydPvvu_sHm-zm-FzTngTAQvzg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcoderaleigh#support) to support WWCode Raleigh Durham \n\nQuestions? Email us at global@womenwhocode.com.\n\n	\N	wwcoderaleigh	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech",501c3}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
271	WWCode Dallas	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:03:46.779-07	2016-12-27 08:14:29.745-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Dallas/Fort Worth**](https://www.womenwhocode.com/dfw). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSew2j5mt6negxggie47RRMNuerQSFs5T5IXVIFqrcsRyClWCg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSew2j5mt6negxggie47RRMNuerQSFs5T5IXVIFqrcsRyClWCg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSew2j5mt6negxggie47RRMNuerQSFs5T5IXVIFqrcsRyClWCg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodedallas#support) to support WWCode Dallas/Fort Worth\n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/f1679990-9a18-11e6-8650-f92e594d5de8.png	wwcodedallas	\N	wwcodedfw	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech",501c3}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
295	WWCode Tokyo	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:33:36.887-07	2016-12-28 08:00:36.071-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Tokyo**](https://www.womenwhocode.com/tokyo). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScKx7EivU4MO7pQbVNjLObcYqr0lt1W5az41EDV15bbGtJUSg/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScKx7EivU4MO7pQbVNjLObcYqr0lt1W5az41EDV15bbGtJUSg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScKx7EivU4MO7pQbVNjLObcYqr0lt1W5az41EDV15bbGtJUSg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodetokyo#support) to support WWCode Tokyo \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/bf15e4a0-a518-11e6-b4fe-6966ef500b6b.png	wwcodetokyo	\N	wwcode_tokyo	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
280	WWCode Medellín 	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:13:48.754-07	2016-12-27 09:47:24.671-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Medellin**](https://www.womenwhocode.com/medellin). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeboston#support) to support WWCode Medellin \n\nQuestions? Email us at global@womenwhocode.com.	https://opencollective-production.s3-us-west-1.amazonaws.com/85a55000-cc5c-11e6-be07-3dfc36c6d12c.png	wwcodemedellin	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
287	WWCode Sacramento 	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:24:17.771-07	2016-12-27 11:44:07.667-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Sacramento**](https://www.womenwhocode.com/sacramento). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeZ9UntJll03ZeVwFkVGMc-JFd4Y1GLXpuJzRpi-JaMa30uYQ/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeZ9UntJll03ZeVwFkVGMc-JFd4Y1GLXpuJzRpi-JaMa30uYQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeZ9UntJll03ZeVwFkVGMc-JFd4Y1GLXpuJzRpi-JaMa30uYQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesacramento#support) to support WWCode Sacramento \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/dca653c0-a2bf-11e6-b669-1f602f2f2eec.png	wwcodesacramento	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech",501c3}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
285	WWCode Reno/Tahoe	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:17:47.232-07	2016-12-27 11:29:59.63-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Reno/Tahoe**](https://www.womenwhocode.com/reno). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdyKO3Q1OUzIokwJp2D0yb8C_Chkjf66O3WaQAWoiAnRegk_w/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdyKO3Q1OUzIokwJp2D0yb8C_Chkjf66O3WaQAWoiAnRegk_w/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdyKO3Q1OUzIokwJp2D0yb8C_Chkjf66O3WaQAWoiAnRegk_w/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcoderenotahoe#support) to support WWCode Reno/Tahoe\n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/caae3800-a2be-11e6-b669-1f602f2f2eec.png	wwcoderenotahoe	\N	WWCodeRenoTahoe	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech",501c3}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
260	WWCode Accra	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 10:44:40.394-07	2016-12-23 07:39:43.815-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Accra**](https://www.womenwhocode.com/accra). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScZq_QiHPiSwhxYe74MsWt1OiscXVo41DndphmDOTYR7cEK1w/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScZq_QiHPiSwhxYe74MsWt1OiscXVo41DndphmDOTYR7cEK1w/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScZq_QiHPiSwhxYe74MsWt1OiscXVo41DndphmDOTYR7cEK1w/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeaccra#support) to support WWCode Accra\n\nQuestions? Email us at global@womenwhocode.com.  	https://opencollective-production.s3-us-west-1.amazonaws.com/c4810040-8a89-11e6-9ae7-452ac38279da.png	wwcodeaccra	\N	wwcodeaccra	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
286	WWCode Recife	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:19:11.423-07	2016-12-27 10:40:34.452-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Recife**](https://www.womenwhocode.com/recife). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScE5aeYUYx6Qxflg5CT30PgMk5zqvZl5PkKiJHgcyOmL3VTAg/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScE5aeYUYx6Qxflg5CT30PgMk5zqvZl5PkKiJHgcyOmL3VTAg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScE5aeYUYx6Qxflg5CT30PgMk5zqvZl5PkKiJHgcyOmL3VTAg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcoderecife#support) to support WWCode Recife \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/cc234080-9d47-11e6-9116-db595ff259df.png	wwcoderecife	\N	WWCode_Recife	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
273	WWCode Greenville	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:06:00.939-07	2016-12-27 08:48:30.075-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Greenville**](https://www.womenwhocode.com/greenville). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfWyfd359XuZOQpkrxOaCmrHL7KG26wpwC68qplJ6iJNuLtwg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfWyfd359XuZOQpkrxOaCmrHL7KG26wpwC68qplJ6iJNuLtwg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfWyfd359XuZOQpkrxOaCmrHL7KG26wpwC68qplJ6iJNuLtwg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodegreenville#support) to support WWCode Greenville \n\nQuestions? Email us at global@womenwhocode.com. 	https://opencollective-production.s3-us-west-1.amazonaws.com/d1719000-8fd7-11e6-b320-5125b901f984.png	wwcodegreenville	\N	wwcodegville	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech",501c3}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
513	Women Who Code Fort Collins	\N	USD	2017-02-21 10:35:34.492-08	2017-02-21 10:37:34.054-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaU7dnlAb9cneVM1fDsuNGhNfYtOTYR0UGwGploHd70ZXaLg/viewform)\n\n[**Attend**](https://www.womenwhocode.com/fortcollins) an event \n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaU7dnlAb9cneVM1fDsuNGhNfYtOTYR0UGwGploHd70ZXaLg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaU7dnlAb9cneVM1fDsuNGhNfYtOTYR0UGwGploHd70ZXaLg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodefortcollins#support) to support WWCode Fort Collins \n\nQuestions? Email us at global@womenwhocode.com.\n	\N	wwcodefortcollins	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech",501c3}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
6057	Caterina Paun	Director, WWCode Portland	USD	2016-03-19 15:11:53.101-07	2017-12-05 23:46:00.582-08	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/7446276v3s466_4d6a9940-90b9-11e6-a134-f381d4cd2713.png	cpaun	\N	caterinasworld	\N	\N	\N	\N	{"UserId":171}	{user}	f	171	171	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
10465	Kate Ageenko	\N	USD	2017-11-21 02:46:25.401-08	2017-11-21 02:46:25.401-08	\N	t	\N	\N	kate-ageenko	\N	\N	\N	\N	5	\N	{"UserId":9152}	\N	f	\N	9152	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N	\N
59	WWCode Portland	We are women who code: in any framework with any level of experience from any size of company for any reason (even just for fun)!	USD	2016-03-18 17:00:00-07	2017-11-27 10:24:50.191-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 100,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Portland**](https://www.womenwhocode.com/portland). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScxNQfvu1iPbMjG52ufF21MfgnTY9F5f_SAFAR23q1RUIg55g/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScxNQfvu1iPbMjG52ufF21MfgnTY9F5f_SAFAR23q1RUIg55g/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScxNQfvu1iPbMjG52ufF21MfgnTY9F5f_SAFAR23q1RUIg55g/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeportland#support) to support WWCode Portland \n\nQuestions? Email us at portland@womenwhocode.com.  \n	https://cldup.com/WoL-XXTWSH.png	wwcodeportland	https://www.womenwhocode.com/portland	WWCodePortland	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode","githubOrg":"wwcodeportland"}	{"githubContributors":{"caterinasworld":395,"rk101288":6,"morganpdx":23,"Ksan8":12,"EMCain":1,"scholachoi":1,"VerteDinde":14,"shanselman":6,"jennifer-kinsey":1,"KatSaldivar":1,"merylturner":1,"jastr945":1,"jminnier":1,"sajoy":23,"aliaward":14,"cynful":12,"Tradcliffe":5,"Meghane12":1,"thejensen":1,"jaebrodsky":2,"michellejl":1},"repos":{"networking-nights":{"stars":1},"wwc-website":{"stars":6},"intro-to-open-source":{"stars":12},"wwc-speaker-series":{"stars":1},"iot-hackathon-2016":{"stars":0},"study-nights":{"stars":38},"wwcodeportland.github.io":{"stars":7},"about-us":{"stars":1},"workshops":{"stars":0}}}	{wwcode,meetup,"diversity in tech",501c3}	f	3	3	9804	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


                                                     4007.dat                                                                                            0000600 0004000 0002000 00000000470 13212311737 0014245 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1911	stripe	acct_xxxxxxxxxxxxxxxx	\N	sk_test_Hcsz2JJdMzEsU2xxxxxxxxxx	{"publishableKey":"pk_test_OSQ8IaRSyLe9FVxxxxxxxxxx"}	2017-12-07 11:16:18.868-08	2017-12-07 11:16:18.868-08	\N	\N	9804	\N
1794	twitter	DionneToussaint	*****	*****	{}	2017-11-28 15:22:14.115-08	2017-11-28 15:22:14.119-08	\N	9296	10660	\N
\.


                                                                                                                                                                                                        4011.dat                                                                                            0000600 0004000 0002000 00000000005 13212311737 0014232 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4013.dat                                                                                            0000600 0004000 0002000 00000127670 13212311737 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        57	28	2	USD	15316	Mar 7 Lightning Talks	\N	******	Lightning Talks	\N	3	PAID	2016-03-20 11:06:09.887-07	2016-03-20 11:06:09.887-07	2017-03-14 10:21:29.439-07	\N	paypal
907	70	12	USD	20000	payment to artists (spoken word) for performance at IWD event	\N	******	Other WWCode Event	\N	3	PAID	2017-03-11 16:06:03.02-08	2017-03-12 11:10:39.133-07	2017-03-27 05:47:26.687-07	\N	paypal
736	171	59	USD	4431	Printing WWCODE pamphlets for Camas STEM Fair for middle-school girls (organized by OHSU).	\N	******	Other	\N	3	PAID	2017-01-20 12:05:09.337-08	2017-01-21 12:28:40.38-08	2017-02-07 10:40:28.327-08	\N	paypal
790	171	59	USD	9050	Food for 2017 Planning Meeting w/ leadership team (Jan. 22)	\N	******	Leadership Development	\N	3	PAID	2017-02-01 14:40:18.153-08	2017-02-01 15:46:50.968-08	2017-02-07 10:40:50.169-08	\N	paypal
888	69	12	USD	54783	Plaques for IWD awards ceremony​ 	\N	******	Other WWCode Event	\N	3	PAID	2017-03-06 13:54:10.307-08	2017-03-07 07:45:43.298-08	2017-03-15 06:57:14.51-07	\N	paypal
814	142	48	USD	25700	Movie screening for "She Started It"	\N	******	Other WWCode Event	\N	3	PAID	2017-02-09 18:26:00.889-08	2017-02-10 16:22:48.586-08	2017-03-14 10:59:53.192-07	\N	paypal
774	31	14	USD	6100	Travel to attend internal leads meeting to finalize plans for upcoming 2017 events	\N	******	Other	\N	3	PAID	2017-01-28 06:06:40.223-08	2017-01-28 15:49:43.515-08	2017-02-22 07:27:02.688-08	\N	paypal
889	3419	516	USD	14630	Stickers	\N	******	Leadership Supplies	\N	3	PAID	2017-03-06 13:54:10.307-08	2017-03-07 11:01:52.82-08	2017-04-07 05:58:45.571-07	\N	paypal
626	3	268	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 11:36:30.003-08	2016-12-23 11:38:32.584-08	2016-12-23 11:38:47.127-08	\N	other
644	3	279	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 09:25:07.236-08	2016-12-27 09:26:20.227-08	2016-12-27 09:27:10.046-08	\N	other
636	3	15	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:30:20.153-08	2016-12-27 08:31:33.602-08	2016-12-27 08:31:59.233-08	\N	other
637	3	298	EUR	5700	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:35:19.064-08	2016-12-27 08:35:50.321-08	2016-12-27 08:36:05.685-08	\N	other
641	3	275	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:54:08.966-08	2016-12-27 08:54:50.244-08	2016-12-27 08:55:07.749-08	\N	other
638	3	272	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:39:04.447-08	2016-12-27 08:41:02.05-08	2016-12-27 08:41:27.62-08	\N	other
642	3	276	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:58:36.204-08	2016-12-27 08:59:15.911-08	2016-12-27 08:59:34.226-08	\N	other
647	3	278	GBP	4900	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 09:28:20.017-08	2016-12-27 09:33:16.816-08	2016-12-27 09:34:46.927-08	\N	other
643	3	277	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 09:02:39.037-08	2016-12-27 09:03:12.312-08	2016-12-27 09:03:23.471-08	\N	other
648	3	280	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 09:48:20.364-08	2016-12-27 09:49:26.92-08	2016-12-27 09:49:40.165-08	\N	other
418	1371	300	USD	64978	lunch ordered at Costco	\N	******	Hackathon	\N	3	PAID	2016-10-12 12:50:37.851-07	2016-10-12 12:52:06.282-07	2016-10-28 14:31:00.087-07	\N	paypal
427	31	14	USD	1305	Google DevFest event that WWC sponsored and attended. Two large banners. Table cloth. Plus my luggage since I went directly from airport. 	\N	******	Workshop	\N	3	PAID	2016-10-15 15:59:26.409-07	2016-10-15 16:01:05.534-07	2016-10-31 10:52:13.785-07	\N	paypal
420	32	14	USD	2700	WWCode Seattle planning lunch with Sara	\N	******	Other	\N	3	PAID	2016-10-13 10:26:11.421-07	2016-10-13 10:30:27.473-07	2016-10-31 10:52:45.81-07	\N	paypal
419	171	59	USD	1446	Food for JavaScript Study Night - Oct. 11th	\N	******	Study Group	\N	3	PAID	2016-10-12 13:24:40.763-07	2016-10-12 13:48:15.148-07	2016-10-31 11:19:13.146-07	\N	paypal
649	3	281	AUD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 09:52:26.758-08	2016-12-27 09:53:15.394-08	2016-12-27 09:54:01.244-08	\N	other
785	3	47	INR	6000	Meetup Fees	\N	******	Leadership Development	\N	3	REJECTED	2017-01-30 15:17:44.823-08	2017-01-31 08:46:45.519-08	2017-02-14 13:17:53.548-08	\N	other
815	142	48	USD	33412	Wearable Clothing Workshop	\N	******	Workshop	\N	3	PAID	2017-02-09 18:26:00.889-08	2017-02-10 16:23:45.137-08	2017-03-14 11:00:11.49-07	\N	paypal
775	31	14	USD	5458	Lunch w Saranya during leads meeting. I lost the paper copy of the receipt so including the credit card statement 	\N	******	Other	\N	3	PAID	2017-01-28 06:06:40.223-08	2017-01-28 15:56:09.32-08	2017-02-22 07:27:45.559-08	\N	paypal
255	31	14	USD	10294	Monthly core team lunch with Sandra Saranya Sara CiCi Tori (5 members) ; on boarding new core member Tori!	\N	******	Leadership Development	\N	31	PAID	2016-07-02 17:00:00-07	2016-07-04 13:23:49.309-07	2016-08-02 06:38:06.274-07	\N	paypal
293	142	48	USD	10212	STEM Toys for Coding with Kids Event	\N	******	Other WWCode Event	\N	3	PAID	2016-07-16 17:00:00-07	2016-07-20 13:35:52.294-07	2016-08-16 07:58:32.981-07	\N	paypal
80	3	59	USD	10000	Global Development	\N	\N	Global Development	\N	3	PAID	2016-04-12 11:52:16.188-07	2016-04-12 11:52:16.188-07	2016-06-14 11:14:21.052-07	\N	other
136	68	15	USD	1115	Mile High Agile outreach- supplies	\N	\N	Leadership Supplies	\N	68	PAID	2016-04-02 17:00:00-07	2016-04-02 17:00:00-07	2016-06-14 11:14:21.091-07	\N	paypal
294	142	48	USD	8496	STEM Toys for Coding with Kids Event	\N	******	Other WWCode Event	\N	3	PAID	2016-07-16 17:00:00-07	2016-07-20 13:41:41.183-07	2016-08-16 07:58:02.246-07	\N	paypal
218	31	14	USD	5161	May expense: Travel and expense costs for mentoring at StartUp Weekend, Meeting w Northeeastern University for future WWC events 	\N	\N	Leadership Development	\N	3	PAID	2016-06-06 17:21:31.531-07	2016-06-06 17:21:31.531-07	2016-06-14 11:14:21.131-07	\N	paypal
366	142	48	USD	4898	Two VR headsets for our AR/VR event at Best Buy.	\N	******	Supplies & materials	\N	3	PAID	2016-09-21 13:21:09.898-07	2016-09-21 13:23:17.18-07	2016-09-27 12:31:43.772-07	\N	paypal
367	142	48	USD	2500	My coworker donated his evening to giving demos of his personal Oculus Rift for our AR/VR event, so I sent him a gift card to thank him for his help with the event.	\N	******	Other	\N	3	PAID	2016-09-22 08:22:21.436-07	2016-09-22 08:24:30.617-07	2016-09-27 12:33:54.695-07	\N	paypal
256	31	14	USD	749	Transportation for Sandra and Cici to get to meeting location with core team members	\N	******	Leadership Development	\N	31	PAID	2016-07-02 17:00:00-07	2016-07-04 13:25:35.824-07	2016-08-02 06:39:16.46-07	\N	paypal
307	31	14	USD	11757	Leadership team dinner - Sondry interview	\N	******	Scholarship	\N	31	PAID	2016-08-02 06:42:02.991-07	2016-08-02 06:43:29.423-07	2016-08-02 06:44:04.899-07	\N	paypal
333	142	48	USD	53720	Conference Travel	\N	******	Conference	\N	3	PAID	2016-08-26 17:03:45.469-07	2016-08-26 17:13:37.309-07	2016-11-03 14:27:23.523-07	\N	paypal
319	142	48	USD	13526	Dinner for last night's HackNight	\N	******	Hack Night	\N	3	PAID	2016-08-18 06:17:48.926-07	2016-08-18 06:19:12.087-07	2016-08-19 13:58:34.842-07	\N	paypal
402	31	14	USD	729	Transportation to get to GeekWire Summit social event 	\N	******	Conference	\N	3	PAID	2016-10-04 20:14:49.674-07	2016-10-04 20:17:22.898-07	2016-11-01 09:16:03.421-07	\N	paypal
417	1371	300	USD	48435	Costco breakfast, lunch, drinks, plates, cups, utensils, snacks, deserts ...	\N	******	Hackathon	\N	3	PAID	2016-10-12 12:47:17.894-07	2016-10-12 12:50:24.464-07	2016-10-31 14:08:49.808-07	\N	paypal
416	1371	300	USD	51962	500 gift cards, 19.62 printed awards	\N	******	Hackathon	\N	3	PAID	2016-10-12 12:45:46.133-07	2016-10-12 12:47:13.682-07	2016-10-31 14:09:12.082-07	\N	paypal
415	1371	300	USD	70000	pre payment for dinner catering	\N	******	Hackathon	\N	3	APPROVED	2016-10-12 12:44:25.684-07	2016-10-12 12:45:38.031-07	2016-10-27 14:05:29.785-07	2016-11-02 17:00:00-07	paypal
318	142	48	USD	1500	Coding books for our study groups (Humble Bundle -- Joy of Coding)	\N	******	Technical Study Group	\N	3	PAID	2016-08-18 05:03:51.47-07	2016-08-18 05:07:07.685-07	2016-08-19 13:58:55.155-07	\N	paypal
346	171	59	USD	3224	Event food	\N	******	Food & Beverage	\N	3	PAID	2016-09-09 09:56:27.706-07	2016-09-09 09:56:59.265-07	2016-09-13 07:57:05.808-07	\N	paypal
345	171	59	USD	2911	Event food	\N	******	Supplies & materials	\N	3	PAID	2016-09-09 09:47:46.738-07	2016-09-09 09:56:23.297-07	2016-09-15 17:09:43.894-07	\N	paypal
194	3	48	USD	12700	A Small Orange	\N	\N	Other WWCode Event	\N	3	PAID	2016-02-01 16:00:00-08	2016-02-01 16:00:00-08	2016-06-14 11:14:21.119-07	\N	other
92	3	15	USD	2322	Stacey Schipper Reimbursement	******	\N	Other WWCode Event	\N	3	REJECTED	2016-04-17 15:19:12.094-07	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.058-07	\N	paypal
81	3	4	USD	163	Meetup Donation Transaction Fee	\N	\N	Transaction Fees	\N	3	PAID	2016-04-12 11:52:16.188-07	2016-04-12 11:52:16.188-07	2016-06-14 11:14:21.051-07	\N	other
96	3	48	USD	250	Global Development	\N	\N	Global Development	\N	3	PAID	2016-04-17 15:19:12.094-07	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.06-07	\N	other
225	3	59	USD	5504	Reimburse Caterina Paun for supplies and mailing expenses	\N	\N	Leadership Supplies	\N	3	PAID	2015-12-14 16:00:00-08	2015-12-14 16:00:00-08	2016-06-14 11:14:21.135-07	\N	other
76	3	59	USD	3798	Reimburse Caterina for program materials	\N	\N	Other WWCode Event	\N	3	PAID	2016-04-05 12:44:01.338-07	2016-04-05 12:44:01.338-07	2016-06-14 11:14:21.048-07	\N	other
93	3	4	USD	150	Global Development	\N	\N	Global Development	\N	3	PAID	2016-04-17 15:19:12.094-07	2016-04-17 15:19:12.094-07	2016-07-08 20:52:41.064-07	\N	other
375	171	59	USD	2715	Event supplies	\N	******	Leadership Supplies	\N	3	PAID	2016-09-27 19:46:42.795-07	2016-09-27 19:53:14.232-07	2016-10-05 09:44:00.917-07	\N	paypal
378	171	59	USD	7167	Event Food	\N	******	Hack Night	\N	3	PAID	2016-09-27 19:55:23.801-07	2016-09-27 19:58:27.408-07	2016-10-05 09:44:48.383-07	\N	paypal
376	171	59	USD	2475	Marketing Materials	\N	******	Other	\N	3	PAID	2016-09-27 19:53:17.638-07	2016-09-27 19:54:27.309-07	2016-10-05 09:45:15.524-07	\N	paypal
377	171	59	USD	6471	Event Food	\N	******	Other WWCode Event	\N	3	PAID	2016-09-27 19:54:30.186-07	2016-09-27 19:55:20.669-07	2016-11-03 12:43:51.901-07	\N	paypal
372	142	48	USD	2200	Website - Domain Name	\N	******	Other	\N	3	PAID	2016-09-26 15:46:40.46-07	2016-09-26 15:48:04.38-07	2016-12-22 14:19:53.18-08	\N	paypal
412	3	195	USD	1000	Test	\N	******	Fees	\N	3	REJECTED	2016-10-11 09:11:05.021-07	2016-10-11 09:13:18.686-07	2016-10-11 09:17:02.494-07	\N	paypal
401	31	14	USD	3080	Monthly core team meeting. Beverages with dinner for six members 	\N	******	Other WWCode Event	\N	3	PAID	2016-10-04 20:13:51.147-07	2016-10-04 20:14:45.394-07	2016-10-31 10:59:54.551-07	\N	paypal
409	70	12	USD	2838	food/drink for organizers of NODE workshop (had to buy from on-site snack bar)	\N	******	Workshop	\N	3	PAID	2016-10-08 08:03:22.819-07	2016-10-08 08:11:18.293-07	2016-11-03 14:13:32.781-07	\N	paypal
400	31	14	USD	3323	Monthly team meeting w core six members. Food/pizza	\N	******	Other WWCode Event	\N	3	PAID	2016-10-04 20:12:18.236-07	2016-10-04 20:13:43.629-07	2016-10-31 14:02:17.181-07	\N	paypal
453	28	2	USD	35000	DJ (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-10-25 21:34:19.335-07	2016-10-25 21:34:51.547-07	2016-10-27 14:08:49.13-07	\N	paypal
450	28	2	USD	6497	September Ruby Tuesday	\N	******	Study Group	\N	3	PAID	2016-10-25 20:53:42.508-07	2016-10-25 20:54:47.132-07	2016-10-31 14:11:37.246-07	\N	paypal
452	28	2	USD	26800	May AI Workshop	\N	******	Workshop	\N	3	PAID	2016-10-25 21:06:16.475-07	2016-10-25 21:07:27.314-07	2016-10-31 14:10:54.78-07	\N	paypal
447	28	2	USD	5518	Drinks for Happy Hour (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-10-25 17:40:29.898-07	2016-10-25 17:41:14.743-07	2016-10-31 14:13:40.764-07	\N	paypal
451	28	2	USD	20568	June South Hack Night	\N	******	Hack Night	\N	3	PAID	2016-10-25 20:57:37.783-07	2016-10-25 20:59:03.214-07	2016-10-31 14:11:21.759-07	\N	paypal
449	28	2	USD	75932	Drinks and snacks (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-10-25 20:43:46.209-07	2016-10-25 20:50:39.086-07	2016-10-31 14:13:06.494-07	\N	paypal
448	28	2	USD	2108	Markers, pens, sticky notes (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-10-25 17:41:19.411-07	2016-10-25 17:42:15.042-07	2016-10-31 14:13:20.6-07	\N	paypal
446	28	2	USD	1192	Almond milk for coffee (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-10-25 17:39:05.875-07	2016-10-25 17:40:23.911-07	2016-10-31 14:13:54.099-07	\N	paypal
445	28	2	USD	1136	Painters tape for signs  	\N	******	Hackathon	\N	3	PAID	2016-10-25 17:18:03.746-07	2016-10-25 17:39:01.083-07	2016-10-31 14:14:52.301-07	\N	paypal
470	1379	301	EUR	1019	Leadership Event in Sofia	\N	******	Other WWCode Event	\N	3	PAID	2016-11-09 12:01:53.197-08	2016-11-09 12:15:40.819-08	2016-12-07 13:30:48.755-08	\N	paypal
414	1371	300	USD	76800	second half of dinner catering	\N	******	Hackathon	\N	3	APPROVED	2016-10-12 12:28:23.372-07	2016-10-12 12:44:15.333-07	2016-10-27 14:07:24.861-07	2016-11-02 17:00:00-07	paypal
466	28	2	USD	119954	Food (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-11-02 15:08:55.076-07	2016-11-02 15:10:20.431-07	2016-11-18 13:01:44.79-08	\N	paypal
498	171	59	USD	4874	Thank you cards, Christmas cards, stamps (for hackathon and all 2016 sponsors)	\N	******	Hackathon	\N	3	PAID	2016-11-20 12:18:30.305-08	2016-11-20 12:20:36.467-08	2016-11-22 13:55:11.103-08	\N	paypal
471	1379	301	EUR	6444	Leadership Event in Sofia	\N	******	Other WWCode Event	\N	3	PAID	2016-11-09 12:15:46.133-08	2016-11-09 12:16:50.117-08	2016-12-07 13:38:07.749-08	\N	paypal
197	3	59	USD	34750	CONFERENCE GRANT	\N	\N	Scholarship	\N	3	PAID	2016-05-26 12:05:53.771-07	2016-05-26 12:05:53.771-07	2016-06-14 11:14:21.121-07	\N	other
501	171	59	USD	1700	Thank you gift to an amazing sponsor!	\N	******	Hackathon	\N	3	PAID	2016-11-20 12:29:28.692-08	2016-11-20 12:34:51.872-08	2016-11-22 04:31:01.064-08	\N	paypal
499	171	59	USD	8181	Thank you bags (16) for hackathon speakers and judges, and for pre-hackathon events volunteers and sponsors.  Each bag contains a WWCode Portland coffee mug, a chocolate bar, ghirardellis squares, and a thank you card.	\N	******	Hackathon	\N	3	PAID	2016-11-20 12:20:40.018-08	2016-11-20 12:26:02.323-08	2016-11-22 13:54:34.067-08	\N	paypal
500	171	59	USD	2374	We Code Hackathon 2016	\N	******	Sponsorship	\N	3	PAID	2016-11-20 12:26:33.118-08	2016-11-20 12:29:20.497-08	2016-12-06 08:50:36.397-08	\N	paypal
502	171	59	USD	1082	Marketing for IoT Hackathon	\N	******	Hackathon	\N	3	PAID	2016-11-20 12:36:16.598-08	2016-11-20 12:36:41.928-08	2016-12-06 08:50:57.444-08	\N	paypal
508	171	59	USD	3918	Supplies	\N	******	Hackathon	\N	3	PAID	2016-11-22 16:39:47.569-08	2016-11-22 17:16:59.692-08	2016-12-06 08:51:21.271-08	\N	paypal
509	171	59	USD	2698	T-shirt order - Design Lead	\N	******	Leadership Supplies	\N	3	PAID	2016-11-22 17:17:03.111-08	2016-11-22 17:18:21.842-08	2016-12-06 08:51:55.906-08	\N	paypal
573	171	59	USD	1058	Goodie Bags	\N	******	Hackathon	\N	3	PAID	2016-12-06 19:01:09.941-08	2016-12-06 19:01:33.246-08	2016-12-07 12:49:56.687-08	\N	paypal
591	142	48	USD	30496	3D Printer & Supplies	\N	******	Hack Night	\N	3	PAID	2016-12-13 10:22:16.435-08	2016-12-13 12:33:52.789-08	2016-12-14 05:03:22.881-08	\N	paypal
602	142	48	USD	9240	Leadership - Planning for 2017 - Dinner	\N	******	Leadership Development	\N	3	PAID	2016-12-18 13:03:11.586-08	2016-12-18 13:03:54.509-08	2016-12-19 10:45:09.955-08	\N	paypal
604	142	48	USD	20397	Robotics: Coding with Your Kids HackNight Supplies	\N	******	Hack Night	\N	3	PAID	2016-12-18 13:04:48.665-08	2016-12-18 13:05:52.891-08	2016-12-19 08:20:41.101-08	\N	paypal
601	142	48	USD	1175	Leadership - Planning for 2017 - Afternoon Coffee	\N	******	Leadership Development	\N	3	PAID	2016-12-18 12:54:41.356-08	2016-12-18 13:03:08.099-08	2016-12-19 10:42:59.885-08	\N	paypal
603	142	48	USD	875	Leadership - Planning for 2017 - Evening Coffee	\N	******	Leadership Development	\N	3	PAID	2016-12-18 13:03:57.719-08	2016-12-18 13:04:44.175-08	2016-12-19 10:43:54.758-08	\N	paypal
613	3	260	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 08:32:39.612-08	2016-12-23 08:35:32.89-08	2016-12-23 08:37:59.658-08	\N	other
605	1374	300	USD	46419	Mugs for WWCode-SV	\N	******	Global Development	\N	3	PAID	2016-12-19 14:19:05.439-08	2016-12-19 14:20:00.599-08	2016-12-20 10:57:28.737-08	\N	paypal
619	3	265	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 09:06:10.893-08	2016-12-23 09:09:46.554-08	2016-12-23 09:10:35.083-08	\N	other
653	3	284	USD	6000	Meetup Fee	\N	******	Fees	\N	3	PAID	2016-12-27 10:13:06.365-08	2016-12-27 10:34:55.519-08	2016-12-27 10:35:08.976-08	\N	other
650	3	282	MXN	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 09:56:16.269-08	2016-12-27 09:57:29.639-08	2016-12-27 09:57:54.703-08	\N	other
72	32	14	USD	6800	Connect 2016 event setup day dinner	\N	******	Conference	\N	32	PAID	2016-03-17 17:00:00-07	2016-03-17 17:00:00-07	2016-06-14 11:14:21.044-07	\N	paypal
62	31	14	USD	1000	Nike Dinner	******	******	Conference	\N	31	PAID	2016-03-17 17:00:00-07	2016-03-17 17:00:00-07	2016-06-14 11:14:21.031-07	\N	paypal
724	142	48	USD	2093	Drinks (La Croix water) for Jan HackNight	\N	******	Hack Night	\N	3	PAID	2017-01-15 16:34:19.312-08	2017-01-16 12:30:30.683-08	2017-01-25 10:41:34.763-08	\N	paypal
725	142	48	USD	22137	Amazon Echo Dot devices for HackNight and first book for our book club.	\N	******	Hack Night	\N	3	PAID	2017-01-15 16:34:19.312-08	2017-01-16 12:32:05.491-08	2017-01-25 10:44:34.015-08	\N	paypal
743	70	12	USD	30000	travel to NY for bell ringing at NYSE	\N	******	Other WWCode Event	\N	3	PAID	2017-01-23 13:57:02.837-08	2017-01-23 18:35:07.349-08	2017-01-25 10:20:55.157-08	\N	paypal
167	31	14	USD	2948	Connect Conference video footage review	******	******	Conference	\N	31	PAID	2016-05-16 17:31:54.682-07	2016-05-16 17:31:54.682-07	2016-06-14 11:14:21.103-07	\N	paypal
46	68	15	USD	14000	Food for March Boulder, CO event	\N	******	Other WWCode Event	\N	68	PAID	2016-03-17 11:48:54.413-07	2016-03-17 11:48:54.413-07	2016-06-14 11:14:21.021-07	\N	paypal
53	28	2	USD	10284	Feb 4 hack night	\N	******	Hack Night	\N	28	PAID	2016-03-20 11:06:09.887-07	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.026-07	\N	paypal
55	28	2	USD	4951	Mar 3 hack night	\N	******	Hack Night	\N	28	PAID	2016-03-20 11:06:09.887-07	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.026-07	\N	paypal
497	171	59	USD	1798	Domain name for hackathon and study night projects	\N	******	Fees	\N	3	PAID	2016-11-20 12:00:51.642-08	2016-11-20 12:06:26.088-08	2017-02-20 12:53:02.93-08	\N	paypal
56	28	2	USD	22568	Feb 1, Lightning Talks	\N	******	Lightning Talks	\N	28	PAID	2016-03-20 11:06:09.887-07	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.027-07	\N	paypal
137	68	15	USD	14100	WWC Boulder- April event's food	\N	******	Other WWCode Event	\N	3	PAID	2016-04-06 17:00:00-07	2016-04-06 17:00:00-07	2016-06-14 11:14:21.09-07	\N	paypal
138	68	15	USD	7000	WWC Stickers	\N	******	Network supplies	\N	68	REJECTED	2016-03-17 17:00:00-07	2016-03-17 17:00:00-07	2016-06-14 11:14:21.091-07	\N	paypal
184	28	2	USD	8979	May 2 Lightning Talks	\N	******	Lightning Talks	\N	28	PAID	2016-05-22 16:46:04.647-07	2016-05-22 16:46:04.647-07	2016-06-14 11:14:21.113-07	\N	paypal
183	28	2	USD	13315	April 4 Lightning Talks	\N	******	Lightning Talks	\N	28	PAID	2016-05-22 16:46:04.647-07	2016-05-22 16:46:04.647-07	2016-06-14 11:14:21.113-07	\N	paypal
180	28	2	USD	5037	April 7 South Hack Night	\N	******	Hack Night	\N	28	PAID	2016-05-22 16:46:04.647-07	2016-05-22 16:46:04.647-07	2016-06-14 11:14:21.112-07	\N	paypal
181	28	2	USD	5325	May 5 South Hack Night	\N	******	Hack Night	\N	28	PAID	2016-05-22 16:46:04.647-07	2016-05-22 16:46:04.647-07	2016-06-14 11:14:21.112-07	\N	paypal
147	32	14	USD	14000	Quarterly planning meeting	\N	******	Leadership Development	\N	32	PAID	2016-05-05 17:18:43.265-07	2016-05-05 17:18:43.265-07	2016-06-14 11:14:21.095-07	\N	paypal
211	28	2	USD	20000	6/2/16 Fireside Chat at Orange Coworking	\N	******	Fireside Chat	\N	3	PAID	2016-06-04 14:37:03.991-07	2016-06-04 14:37:03.991-07	2016-06-14 11:14:21.127-07	\N	paypal
186	28	2	USD	30000	05-21-16 AI workshop	\N	******	Workshop	\N	3	PAID	2016-05-22 17:26:36.061-07	2016-05-22 17:26:36.061-07	2016-10-31 14:16:10.268-07	\N	paypal
213	28	2	USD	2400	3/30/16 Python Gameathon prize - Udemy course	\N	******	Hackathon	\N	3	PAID	2016-06-04 14:37:03.991-07	2016-06-04 14:37:03.991-07	2016-06-14 11:14:21.128-07	\N	paypal
48	68	15	USD	7800	Order for stickers of our official WWC Boulder/Denver chapter logo	******	******	Leadership Supplies	\N	3	PAID	2016-03-17 20:23:34.628-07	2016-03-17 20:23:34.628-07	2016-11-03 12:45:25.209-07	\N	paypal
59	31	14	USD	4656	WwConnect planning meeting	******	******	Conference	\N	31	PAID	2016-03-10 16:00:00-08	2016-03-10 16:00:00-08	2016-06-14 11:14:21.029-07	\N	paypal
60	31	14	USD	2519	WwConnect Planning Meeting	******	******	Conference	\N	31	PAID	2016-03-10 16:00:00-08	2016-03-10 16:00:00-08	2016-06-14 11:14:21.03-07	\N	paypal
61	31	14	USD	709	WwConnect Conference Set Up Day 1	******	******	Conference	\N	31	PAID	2016-03-18 17:00:00-07	2016-03-18 17:00:00-07	2016-06-14 11:14:21.03-07	\N	paypal
64	31	14	USD	1025	WwConnect2016	******	******	Conference	\N	31	PAID	2016-03-19 17:00:00-07	2016-03-19 17:00:00-07	2016-06-14 11:14:21.032-07	\N	paypal
776	31	14	USD	59040	Last minute (less than 7 day advance purchase) airline price purchase from SFO to JFK. Emailed Joey to alert of higher fare. 	\N	******	Other WWCode Event	\N	3	PAID	2017-01-28 06:06:40.223-08	2017-01-28 15:59:18.982-08	2017-02-07 10:32:49.378-08	\N	paypal
820	28	2	USD	10680	February Lightning Talks food	\N	******	Lightning Talks	\N	3	PAID	2017-02-11 19:22:39.341-08	2017-02-12 19:04:37.319-08	2017-03-14 10:17:54.1-07	\N	paypal
899	70	12	USD	20950	meetup with speaker, Heather VanCura, in conjunction with DevNexus conference	\N	******	Other WWCode Event	\N	3	PAID	2017-03-08 20:15:52.943-08	2017-03-08 21:17:56.148-08	2017-03-14 10:22:10.775-07	\N	paypal
900	70	12	USD	9732	IWD event -- wine for event	\N	******	Other WWCode Event	\N	3	PAID	2017-03-08 20:15:52.943-08	2017-03-08 21:20:17.878-08	2017-03-14 10:22:31.507-07	\N	paypal
858	171	59	USD	5798	Supplies for Agile workshop (2/26)	\N	******	Workshop	\N	3	PAID	2017-02-25 13:41:40.394-08	2017-02-26 13:29:05.754-08	2017-03-14 11:16:43.254-07	\N	paypal
34	7	10	MXN	166080	IVA Libretas Hackathon	******	******	Hackathon	\N	3	REJECTED	2016-02-16 10:58:04.663-08	2016-02-16 10:58:04.663-08	2016-08-16 08:05:09.996-07	\N	paypal
63	31	14	USD	658	WwConnect Conference	******	******	Conference	\N	31	PAID	2016-03-19 17:00:00-07	2016-03-19 17:00:00-07	2016-06-14 11:14:21.032-07	\N	paypal
33	7	10	MXN	1038000	Libretas Hackathon	******	******	Hackathon	\N	3	REJECTED	2016-02-16 10:56:17.216-08	2016-02-16 10:56:17.216-08	2016-08-16 08:05:15.471-07	\N	paypal
924	1332	277	USD	100000	To redeem travel stipend to Google I/O	\N	******	Conference	\N	3	PAID	2017-03-16 13:16:54.952-07	2017-03-16 18:25:25.526-07	2017-03-20 08:39:23.558-07	\N	paypal
926	1333	278	GBP	85000	Travel Stipend for Google I/O, now that I have secured my I/O Ticket via Google - see enclosed I/O Ticket Receipt)	\N	******	Scholarship	\N	3	PAID	2017-03-16 13:16:54.952-07	2017-03-16 23:43:54.949-07	2017-03-27 09:01:27.361-07	\N	paypal
935	1331	277	USD	100000	To redeem travel stipend to Google I/O	\N	******	Conference	\N	3	PAID	2017-03-20 12:19:06.997-07	2017-03-20 17:17:43.895-07	2017-03-27 10:54:16.852-07	\N	paypal
952	69	12	USD	50000	Google I/O	\N	******	Conference	\N	3	PAID	2017-03-26 09:01:07.917-07	2017-03-27 06:44:34.926-07	2017-03-27 10:11:39.352-07	\N	paypal
949	69	12	USD	37500	Google I/O ticket	\N	******	Conference	\N	3	PAID	2017-03-25 06:46:14.921-07	2017-03-25 08:06:03.662-07	2017-03-27 10:12:00.205-07	\N	paypal
965	1344	286	USD	20000	Google I/O Ticket  2017	\N	******	Leadership Development	\N	3	PAID	2017-03-29 10:01:30.368-07	2017-03-29 13:36:36.032-07	2017-06-21 07:58:51.019-07	\N	other
966	171	59	USD	3405	Snacks for Unity 101 workshop.	\N	******	Workshop	\N	3	PAID	2017-03-29 10:01:30.368-07	2017-03-29 19:17:35.707-07	2017-05-30 09:54:00.919-07	\N	other
962	1344	286	USD	100000	Travel stipend to attend the Google I/O 2017 Conference.	\N	******	Conference	\N	3	PAID	2017-03-28 09:31:20.932-07	2017-03-29 09:18:26.633-07	2017-03-31 15:33:59.762-07	\N	paypal
1001	171	59	USD	2891	Hackathon 2017 planning meeting	\N	******	Hackathon	\N	3	PAID	2017-04-09 08:46:01.525-07	2017-04-09 15:04:51.227-07	2017-04-11 12:15:09.869-07	\N	paypal
1002	171	59	USD	1527	Event supplies	\N	******	Leadership Supplies	\N	3	PAID	2017-04-09 08:46:01.525-07	2017-04-09 15:37:03.724-07	2017-04-11 12:13:28.739-07	\N	paypal
1007	142	48	USD	11948	Business cards and stickers	\N	******	Leadership Supplies	\N	3	PAID	2017-04-10 09:14:55.686-07	2017-04-10 14:31:17.015-07	2017-05-16 15:00:30.445-07	\N	other
1016	1333	278	GBP	85000	WWCode CONNECT Conference Travel Stipend	\N	******	Conference	\N	3	PAID	2017-04-11 14:35:01.731-07	2017-04-12 07:42:51.103-07	2017-04-17 14:18:35.71-07	\N	paypal
1003	171	59	USD	3306	Event supplies	\N	******	Leadership Supplies	\N	3	PAID	2017-04-09 08:33:04.72-07	2017-04-09 15:37:53.717-07	2017-05-30 09:54:37.146-07	\N	other
1027	3	270	USD	100000	Network Development: Attend CapOne WIT 2017 Kickoff to announce partnership for re-launch	\N	******	Other WWCode Event	\N	3	PAID	2017-04-17 12:15:50.71-07	2017-04-17 15:11:05.461-07	2017-04-17 15:12:23.057-07	\N	other
1054	171	59	USD	2390	Planning meetings - Unity + VR workshops	\N	******	Workshop	\N	3	PAID	2017-04-24 15:33:05.343-07	2017-04-24 19:53:38.096-07	2017-06-06 12:41:05.844-07	\N	other
374	171	59	USD	2077	Event Food	\N	******	Hack Night	\N	3	PAID	2016-09-27 19:15:48.098-07	2016-09-27 19:46:35.645-07	2016-10-05 09:43:29.036-07	\N	paypal
1055	171	59	USD	13896	Flights for Connect 2017	\N	******	Conference	\N	3	PAID	2017-04-24 15:31:39.131-07	2017-04-24 19:54:40.938-07	2017-05-30 10:02:21.537-07	\N	other
1092	171	59	USD	1950	Transportation - Connect 2017	\N	******	Conference	\N	3	PAID	2017-05-02 18:02:09.827-07	2017-05-03 12:52:47.919-07	2017-05-30 10:12:53.971-07	\N	other
1121	1378	301	EUR	2505	Regional Leadership Event: Barcelona	\N	******	Workshop	\N	3	PAID	2017-05-08 17:00:00-07	2017-05-10 13:09:17.149-07	2017-06-09 07:33:16.788-07	\N	other
1137	171	59	USD	2680	Nametags	\N	******	Leadership Supplies	\N	3	PAID	2017-05-16 12:37:26.124-07	2017-05-16 15:26:29.898-07	2017-06-06 12:42:28.778-07	\N	other
1130	4283	291	CAD	300000	Travel stipend for Betty, Stella, Steph to WWC Connect ($1000USD/director for international chapters)	******	******	Conference	\N	3	PAID	2017-05-13 23:33:41.634-07	2017-05-14 11:05:28.003-07	2017-07-14 10:24:48.777-07	\N	other
627	3	269	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 11:39:34.326-08	2016-12-23 11:41:36.646-08	2016-12-23 11:41:48.635-08	\N	other
639	3	273	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:49:03.664-08	2016-12-27 08:49:52.742-08	2016-12-27 08:50:06.731-08	\N	other
628	3	270	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 11:47:22.609-08	2016-12-23 11:49:40.181-08	2016-12-23 11:50:08.905-08	\N	other
632	3	299	MXN	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:10:47.262-08	2016-12-27 08:12:04.183-08	2016-12-27 08:12:26.594-08	\N	other
198	3	13	USD	80000	CONFERENCE GRANT	\N	\N	Scholarship	\N	3	PAID	2016-05-31 10:47:01.276-07	2016-05-31 10:47:01.276-07	2016-06-14 11:14:21.121-07	\N	other
79	3	4	USD	150	Global Developement	\N	\N	Global Development	\N	3	PAID	2016-04-12 11:46:49.263-07	2016-04-12 11:46:49.263-07	2016-06-14 11:14:21.05-07	\N	other
887	3	282	MXN	50616	Leadership Development	\N	******	Conference	\N	3	PAID	2017-03-06 13:54:10.307-08	2017-03-07 05:02:11.16-08	2017-03-14 11:17:52.017-07	\N	other
640	3	274	USD	6000	Meetup Fee	\N	******	Fees	\N	3	PAID	2016-12-27 08:51:06.223-08	2016-12-27 08:52:25.022-08	2016-12-27 08:52:46.541-08	\N	other
395	3	15	USD	32000	90/10 split: Hackathon donation	\N	******	Global Development	\N	3	PAID	2016-07-14 17:00:00-07	2016-10-04 15:04:41.846-07	2016-10-04 15:05:23.579-07	\N	other
387	3	12	USD	10000	Google I/O: Alicia Carr	\N	******	Scholarship	\N	3	PAID	2016-05-25 17:00:00-07	2016-10-04 08:31:40.439-07	2016-10-04 08:44:36.611-07	\N	other
393	3	12	USD	500	90/10 split: Turner matching donation	\N	******	Global Development	\N	3	PAID	2016-10-04 08:52:24.157-07	2016-10-04 08:53:03.718-07	2016-10-04 09:06:02.71-07	\N	other
391	3	12	USD	500	90/10 split: Beth Laing	\N	******	Global Development	\N	3	PAID	2016-10-04 08:50:56.293-07	2016-10-04 08:51:48.623-07	2016-10-04 09:06:11.584-07	\N	other
392	3	12	USD	500	90/10 split: Beth Laing	\N	******	Global Development	\N	3	PAID	2016-10-04 08:50:56.293-07	2016-10-04 08:51:59.211-07	2016-10-04 09:06:17.663-07	\N	other
390	3	12	USD	250	90/10 split: Syema Ailia	\N	******	Global Development	\N	3	PAID	2016-10-04 08:49:30.068-07	2016-10-04 08:50:45.734-07	2016-10-04 09:06:24.611-07	\N	other
394	3	2	USD	56266	Net budget balance pre-Open Collective	\N	******	Other WWCode Event	\N	3	PAID	2016-01-14 16:00:00-08	2016-10-04 14:41:43.853-07	2016-10-04 14:57:46.063-07	\N	other
634	3	13	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:22:16.78-08	2016-12-27 08:23:20.484-08	2016-12-27 08:23:36.529-08	\N	other
411	3	59	USD	31950	WWCode Portland Stickers	\N	******	Leadership Supplies	\N	3	PAID	2016-10-10 13:10:50.586-07	2016-10-10 13:11:36.293-07	2016-10-10 13:12:34.385-07	\N	other
413	3	195	USD	1000	Test	\N	******	Fees	\N	3	PAID	2016-10-11 09:17:09.527-07	2016-10-11 09:18:10.423-07	2016-10-11 09:18:39.64-07	\N	other
396	3	272	USD	25000	DIANA A. SCHOLARSHIP GOOGLE I/O	\N	******	Conference	\N	3	PAID	2016-10-04 15:22:45.384-07	2016-10-04 15:23:45.863-07	2016-11-21 14:59:44.22-08	\N	other
467	28	2	USD	339421	Food (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-11-02 15:10:25.089-07	2016-11-02 15:11:15.724-07	2016-11-21 07:23:08.924-08	\N	other
389	3	12	USD	100000	90/10 split: AT&T Sponsorship (April 2015)	******	******	Global Development	\N	3	PAID	2016-10-04 08:40:50.076-07	2016-10-04 08:44:06.971-07	2016-10-04 08:44:29.326-07	\N	other
464	3	14	USD	60000	Matthews Group - Leadership Development for Seattle team	******	******	Leadership Development	\N	3	PAID	2016-10-31 15:03:17.783-07	2016-10-31 15:05:08.929-07	2016-11-29 13:46:31.974-08	\N	other
494	1378	301	EUR	4728	European Leadership Development Workshop -- Transportation, Flight	\N	******	Leadership Development	\N	3	PAID	2016-09-30 17:00:00-07	2016-11-19 05:21:57.651-08	2016-11-22 14:07:58.565-08	\N	other
493	1378	301	EUR	4400	European Leadership Development Workshop -- Transportation, Taxi	\N	******	Leadership Development	\N	3	PAID	2016-10-26 17:00:00-07	2016-11-19 05:13:48.078-08	2016-11-22 14:07:41.878-08	\N	other
483	1325	273	USD	4351	Food for monthly hack night from Antonino Bertolo's Pizza & Wine Bar.	\N	******	Hack Night	\N	3	PAID	2016-08-31 17:00:00-07	2016-11-16 16:12:31.06-08	2016-12-06 09:58:42.358-08	\N	other
484	1325	273	USD	7773	Food for October Hack Night.	\N	******	Hack Night	\N	3	PAID	2016-10-05 17:00:00-07	2016-11-16 16:29:48.238-08	2016-12-06 09:56:13.801-08	\N	other
506	1333	278	GBP	6000	Food/Drinks for Leadership Team Meeting - Gen, Claire, Halima - Sept 2016	\N	******	Leadership Development	\N	3	PAID	2016-09-10 17:00:00-07	2016-11-22 12:36:49.712-08	2016-11-29 13:17:33.829-08	\N	other
507	1333	278	GBP	4000	Food/Drinks for Leadership Team Meeting - Gen, Claire - Oct 2016	\N	******	Leadership Development	\N	3	PAID	2016-10-01 17:00:00-07	2016-11-22 12:39:49.327-08	2016-11-29 13:17:22.193-08	\N	other
474	31	14	USD	227646	Lodging and meals for our WWC Seattle 7 team members leadership development retreat. Under approved budget!	\N	******	Leadership Development	\N	3	PAID	2016-11-15 07:52:03.936-08	2016-11-15 07:54:05.532-08	2016-11-29 13:46:42.977-08	\N	other
485	1325	273	USD	1106	October Hack Night Drinks/Food.	\N	******	Hack Night	\N	3	PAID	2016-10-05 17:00:00-07	2016-11-16 16:45:56.588-08	2016-12-06 09:58:10.939-08	\N	other
486	1325	273	USD	4444	Food/Drinks for Anniversary Reception with guest WWCode Directors!	\N	******	Other WWCode Event	\N	3	PAID	2016-10-27 17:00:00-07	2016-11-16 17:08:09.48-08	2016-11-22 14:21:43.596-08	\N	other
492	1325	273	USD	713	Food for Anniversary Reception	\N	******	Other WWCode Event	\N	3	PAID	2016-10-27 17:00:00-07	2016-11-17 12:36:37.444-08	2016-12-06 09:55:40.485-08	\N	other
607	3	2	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-21 10:50:58.117-08	2016-12-21 10:53:15.213-08	2016-12-21 10:53:47.768-08	\N	other
608	3	3	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-21 10:51:15.967-08	2016-12-21 10:54:08.982-08	2016-12-21 10:54:31.514-08	\N	other
614	3	261	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 08:45:31.739-08	2016-12-23 08:48:42.88-08	2016-12-23 08:49:17.798-08	\N	other
617	3	263	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 08:58:06.292-08	2016-12-23 09:00:11.888-08	2016-12-23 09:00:26.307-08	\N	other
615	3	12	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 08:51:12.278-08	2016-12-23 08:52:04.132-08	2016-12-23 08:52:23.784-08	\N	other
616	3	262	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 08:52:52.588-08	2016-12-23 08:55:02.457-08	2016-12-23 08:56:04.914-08	\N	other
618	3	264	GBP	4900	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 09:03:12.871-08	2016-12-23 09:05:23.588-08	2016-12-23 09:05:42.262-08	\N	other
621	3	259	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 09:20:24.371-08	2016-12-23 09:21:36.713-08	2016-12-23 09:21:53.364-08	\N	other
620	3	301	EUR	5700	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 09:13:56.172-08	2016-12-23 09:14:45.703-08	2016-12-23 09:15:16.44-08	\N	other
622	3	195	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 09:26:09.212-08	2016-12-23 09:32:25.111-08	2016-12-23 09:32:56.293-08	\N	other
623	3	266	AUD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 09:41:23.136-08	2016-12-23 09:42:05.736-08	2016-12-23 09:42:19.013-08	\N	other
624	3	267	GBP	4900	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 09:43:55.758-08	2016-12-23 09:58:18.148-08	2016-12-23 10:04:06.163-08	\N	other
652	3	283	EUR	5700	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 10:10:37.485-08	2016-12-27 10:11:36.927-08	2016-12-27 10:11:52.22-08	\N	other
651	3	10	MXN	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 09:58:18.741-08	2016-12-27 10:00:31.933-08	2016-12-27 10:01:07.996-08	\N	other
654	3	59	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 10:35:56.094-08	2016-12-27 10:38:25.72-08	2016-12-27 10:38:47.561-08	\N	other
655	3	287	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 11:33:09.199-08	2016-12-27 11:46:38.03-08	2016-12-27 11:46:51.448-08	\N	other
656	3	288	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 11:47:27.946-08	2016-12-27 11:49:57.05-08	2016-12-27 11:50:17.29-08	\N	other
657	3	14	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 11:51:59.27-08	2016-12-27 11:52:56.386-08	2016-12-27 11:53:07.813-08	\N	other
658	3	4	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 11:53:23.261-08	2016-12-27 11:55:42.961-08	2016-12-28 07:44:45.209-08	\N	other
659	3	300	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 07:46:39.253-08	2016-12-28 07:49:03.856-08	2016-12-28 07:49:16.715-08	\N	other
660	3	289	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 07:51:51.23-08	2016-12-28 07:52:34.697-08	2016-12-28 07:53:06.333-08	\N	other
661	3	297	AUD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 07:54:27.49-08	2016-12-28 07:56:08.504-08	2016-12-28 07:56:29.497-08	\N	other
662	3	241	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 07:56:55.397-08	2016-12-28 07:58:20.587-08	2016-12-28 07:58:50.601-08	\N	other
663	3	291	CAD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 08:20:10.433-08	2016-12-28 08:21:39.298-08	2016-12-28 08:21:52.881-08	\N	other
664	3	48	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 08:24:24.058-08	2016-12-28 08:25:18.14-08	2016-12-28 08:25:49.763-08	\N	other
665	3	292	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 08:26:41.188-08	2016-12-28 08:28:01.61-08	2016-12-28 08:28:16.458-08	\N	other
666	3	293	CAD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 08:28:38.36-08	2016-12-28 08:30:00.14-08	2016-12-28 08:30:16.798-08	\N	other
667	3	294	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 08:30:41.349-08	2016-12-28 08:32:05.407-08	2016-12-28 08:32:19.79-08	\N	other
635	3	47	INR	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:24:45.938-08	2016-12-27 08:25:59.379-08	2017-06-21 10:11:34.036-07	\N	other
768	3	278	GBP	40970	Travel Scholarship for WWCode Director	\N	******	Leadership Development	\N	3	PAID	2017-01-26 15:23:43.983-08	2017-01-27 07:34:47.447-08	2017-04-17 15:32:02.795-07	\N	other
886	3	511	MXN	14915	Leadership Development	\N	******	Conference	\N	3	PAID	2017-03-06 13:54:10.307-08	2017-03-07 04:57:52.472-08	2017-03-14 11:18:46.39-07	\N	other
967	171	59	USD	2085	Small thank you gifts for workshop instructors,	\N	******	Workshop	\N	3	PAID	2017-03-29 10:01:30.368-07	2017-03-29 19:21:03.723-07	2017-05-30 09:54:12.895-07	\N	other
988	3	295	USD	6000	Meetup Fees	\N	******	Leadership Development	\N	3	PAID	2017-04-05 07:08:17.838-07	2017-04-05 07:18:18.821-07	2017-04-05 07:19:21.382-07	\N	other
998	3	12	USD	235699	Atlanta IWD Event	\N	******	Other WWCode Event	\N	3	PAID	2017-04-07 07:53:35.266-07	2017-04-07 13:27:41.491-07	2017-04-17 12:17:23.077-07	\N	other
974	3	286	USD	20000	Leadership Development: Conference Support: Karina M. 	\N	******	Conference	\N	3	PAID	2017-03-31 10:33:05.687-07	2017-03-31 15:54:08.585-07	2017-06-07 06:18:03.014-07	2017-11-01 17:00:00-07	other
1070	171	59	USD	1785	Tech Summit Lunch	\N	******	Conference	\N	3	PAID	2017-04-28 16:37:09.548-07	2017-04-29 14:42:39.653-07	2017-05-30 09:53:39.256-07	\N	other
1084	142	48	USD	1554	Snacks and batteries for our robots	\N	******	Hack Night	\N	3	PAID	2017-04-18 17:00:00-07	2017-05-02 11:26:59.045-07	2017-05-16 15:00:04.484-07	\N	other
1056	171	59	USD	33534	Hotel - Connect 2017	\N	******	Conference	\N	3	PAID	2017-04-24 15:31:39.131-07	2017-04-24 19:55:35.127-07	2017-05-30 10:00:20.838-07	\N	other
1099	3	430	USD	101200	Google i/o travel stipend for Yelyzaveta (plus $12 transfer fees)	\N	******	Scholarship	\N	3	PAID	2017-05-03 18:36:17.701-07	2017-05-04 12:05:15.03-07	2017-05-04 12:06:09.066-07	\N	other
1093	171	59	USD	6513	Transportation - Connect 2017	\N	******	Conference	\N	3	PAID	2017-05-02 17:47:33.174-07	2017-05-03 13:05:13.476-07	2017-05-30 10:04:18.274-07	\N	other
1085	142	48	USD	9777	Supplies for decorating our robots	\N	******	Hack Night	\N	3	PAID	2017-04-18 17:00:00-07	2017-05-02 11:28:49.091-07	2017-05-16 15:00:15.589-07	\N	other
1086	142	48	USD	2989	Leadership meeting	\N	******	Leadership Development	\N	3	PAID	2017-04-21 17:00:00-07	2017-05-02 11:29:43.581-07	2017-05-16 14:59:48.244-07	\N	other
1088	142	48	USD	100000	Google I/O Travel Stipend	\N	******	Conference	\N	3	PAID	2017-03-14 17:00:00-07	2017-05-02 11:34:08.158-07	2017-05-16 15:00:40.397-07	\N	other
1028	3	430	USD	100000	Google I/O Travel Grant: Yelyzaveta\tL.	******	******	Conference	\N	3	APPROVED	2017-04-17 12:15:52.793-07	2017-04-17 15:41:52.852-07	2017-04-17 15:42:06.121-07	2017-05-04 17:00:00-07	other
1119	32	14	USD	11500	Farewell lunch for Clarissa + Welcome lunch for Pranoti 	\N	******	Other	\N	3	PAID	2017-05-10 03:03:37.039-07	2017-05-10 10:19:29.682-07	2017-05-16 14:55:26.77-07	\N	other
1120	1378	301	EUR	2700	Regional Leadership Event: Barcelona	\N	******	Workshop	\N	3	PAID	2017-05-08 17:00:00-07	2017-05-10 13:08:43.707-07	2017-06-06 12:33:18.234-07	\N	other
1122	1378	301	EUR	19398	Regional Leadership Event: Barcelona	\N	******	Workshop	\N	3	PAID	2017-05-09 22:18:16.903-07	2017-05-10 13:10:54.588-07	2017-05-16 14:49:07.922-07	\N	other
1123	3206	12	USD	500000	Deposit- We Rise Conference Hosting Location	\N	******	Conference	\N	3	PAID	2017-05-09 22:18:16.903-07	2017-05-10 18:32:36.838-07	2017-05-16 14:51:10.633-07	\N	other
1138	171	59	USD	3450	Color printing - flyers and signage for events. 	\N	******	Other	\N	3	PAID	2017-05-16 12:37:26.124-07	2017-05-16 15:41:15.044-07	2017-06-06 12:43:28.026-07	\N	other
1143	32	14	USD	19017	Intro to Docker workshop food for attendees	\N	******	Workshop	\N	3	PAID	2017-05-18 13:25:06.712-07	2017-05-18 21:24:00.964-07	2017-05-30 11:07:58.681-07	\N	other
99	3	14	USD	2452	CONNECT 2016	******	\N	Conference	\N	3	PAID	2016-04-25 17:00:00-07	2016-04-25 17:00:00-07	2016-06-14 11:14:21.061-07	\N	other
104	3	48	USD	400	WePay Fee	******	\N	Transaction Fees	\N	3	PAID	2016-04-10 17:00:00-07	2016-04-10 17:00:00-07	2016-06-14 11:14:21.064-07	\N	other
164	3	10	MXN	50000	Conference Grant	******	\N	Scholarship	\N	3	PAID	2016-05-16 07:49:37.27-07	2016-05-16 07:49:37.27-07	2016-06-14 11:14:21.102-07	\N	other
188	3	13	USD	15000	Conference Grant	******	\N	Scholarship	\N	3	PAID	2016-05-24 12:42:50.307-07	2016-05-24 12:42:50.307-07	2016-06-14 11:14:21.115-07	\N	other
193	3	48	USD	65000	Photographer: Mike Ross	******	\N	Conference	\N	3	PAID	2016-01-05 16:00:00-08	2016-01-05 16:00:00-08	2016-06-14 11:14:21.118-07	\N	other
156	3	48	USD	110000	Conference Grant - Sarah Olson	******	\N	Scholarship	\N	3	PAID	2016-05-10 12:19:21.785-07	2016-05-10 12:19:21.785-07	2016-06-14 11:14:21.099-07	\N	other
95	3	13	USD	125	WePay fee	******	\N	Transaction Fees	\N	3	PAID	2016-04-17 15:19:12.094-07	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.06-07	\N	other
189	3	3	USD	100000	Conference Grant	******	\N	Scholarship	\N	3	PAID	2016-05-24 12:42:50.307-07	2016-05-24 12:42:50.307-07	2016-06-14 11:14:21.116-07	\N	other
175	3	12	USD	120000	Conference Grant	******	\N	Scholarship	\N	3	PAID	2016-05-19 12:07:13.723-07	2016-05-19 12:07:13.723-07	2016-06-14 11:14:21.109-07	\N	other
101	3	13	USD	100	Global Development	\N	\N	Global Development	\N	3	PAID	2016-04-26 20:56:08.086-07	2016-04-26 20:56:08.086-07	2016-06-14 11:14:21.062-07	\N	other
86	3	13	USD	100	Global Development	\N	\N	Global Development	\N	3	PAID	2016-04-15 10:29:50.291-07	2016-04-15 10:29:50.291-07	2016-06-14 11:14:21.055-07	\N	other
195	3	48	USD	3418	FedEx Office	\N	\N	Leadership Supplies	\N	3	PAID	2016-01-24 16:00:00-08	2016-01-24 16:00:00-08	2016-06-14 11:14:21.118-07	\N	other
74	3	14	USD	11815	Reimbursement to Kamila for coffee purchased for volunteers at CONNECT 2016	\N	\N	Conference	\N	3	PAID	2016-04-05 12:44:01.338-07	2016-04-05 12:44:01.338-07	2016-06-14 11:14:21.046-07	\N	other
190	3	48	USD	20000	Conference Grant - Sarah Olson	\N	\N	Scholarship	\N	3	PAID	2016-05-25 09:39:09.882-07	2016-05-25 09:39:09.882-07	2016-06-14 11:14:21.116-07	\N	other
75	3	59	USD	6500	Reimburse Caterina for travel expenses to CONNECT 2016	\N	\N	Scholarship	\N	3	PAID	2016-04-05 12:44:01.338-07	2016-04-05 12:44:01.338-07	2016-06-14 11:14:21.047-07	\N	other
82	3	4	USD	163	Meetup Transaction Fee	\N	\N	Transaction Fees	\N	3	REJECTED	2016-04-12 11:52:16.188-07	2016-04-12 11:52:16.188-07	2016-06-14 11:14:21.052-07	\N	other
97	3	13	USD	100	Global Developement	\N	\N	Global Development	\N	3	REJECTED	2016-04-17 15:19:12.094-07	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.06-07	\N	other
224	3	59	USD	9995	Reimburse Caterina Paun for Program Expenses	******	\N	Other WWCode Event	\N	3	PAID	2016-02-24 16:00:00-08	2016-02-24 16:00:00-08	2016-06-14 11:14:21.134-07	\N	other
196	3	59	USD	50000	CONFERENCE GRANT	\N	\N	Scholarship	\N	3	PAID	2016-05-10 17:00:00-07	2016-05-10 17:00:00-07	2016-06-14 11:14:21.12-07	\N	other
103	3	48	USD	150	Global Development	\N	\N	Global Development	\N	3	PAID	2016-04-27 09:21:00.228-07	2016-04-27 09:21:00.228-07	2016-06-14 11:14:21.063-07	\N	other
145	3	13	USD	50000	Conference Grant	******	\N	Scholarship	\N	3	PAID	2016-05-04 14:14:39.136-07	2016-05-04 14:14:39.136-07	2016-06-14 11:14:21.094-07	\N	other
227	3	59	USD	5000	Global Development	******	\N	Global Development	\N	3	PAID	2016-02-21 16:00:00-08	2016-02-21 16:00:00-08	2016-06-14 11:14:21.135-07	\N	other
192	3	48	USD	2698	Leadership Tools (director tees)	******	\N	Leadership Supplies	\N	3	PAID	2015-12-14 16:00:00-08	2015-12-14 16:00:00-08	2016-06-14 11:14:21.117-07	\N	other
158	3	48	USD	8320	Conference Expense	******	\N	Conference	\N	3	REJECTED	2016-05-10 12:19:21.785-07	2016-05-10 12:19:21.785-07	2016-06-14 11:14:21.1-07	\N	other
178	3	3	USD	70000	Conference Grant	******	\N	Scholarship	\N	3	PAID	2016-05-19 12:07:13.723-07	2016-05-19 12:07:13.723-07	2016-06-14 11:14:21.11-07	\N	other
222	3	4	USD	150	Global Development 	\N	\N	Global Development	\N	3	PAID	2016-06-09 11:38:16.857-07	2016-06-09 11:38:16.857-07	2016-06-14 11:14:21.133-07	\N	other
737	171	59	USD	2439	Event supplies for Leads	\N	******	Leadership Supplies	\N	3	PAID	2017-01-20 12:05:09.337-08	2017-01-21 12:30:22.616-08	2017-02-07 10:38:15.924-08	\N	paypal
633	3	271	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:13:47.179-08	2016-12-27 08:15:24.708-08	2016-12-27 08:16:27.404-08	\N	other
\.


                                                                        4017.dat                                                                                            0000600 0004000 0002000 00000056006 13212311737 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2016-03-06 16:00:00-08	\N	\N	141	47	ADMIN	202	\N	1204	\N
2016-01-08 16:22:34.641-08	2016-01-08 16:22:34.64-08	\N	3	10	HOST	27	\N	9804	\N
2016-01-18 15:54:06.501-08	2016-01-18 15:54:06.501-08	\N	2	10	BACKER	61	\N	1729	\N
2016-02-02 15:09:06.035-08	2016-02-02 15:09:06.035-08	\N	2	13	BACKER	109	\N	1729	\N
2016-01-29 14:23:53.527-08	2016-01-29 14:23:53.527-08	\N	30	12	BACKER	87	\N	2385	\N
2016-02-02 08:36:39.043-08	2016-02-02 08:36:39.043-08	\N	30	14	BACKER	101	\N	2385	\N
2016-02-02 09:04:56.333-08	2016-02-02 09:04:56.333-08	\N	30	13	BACKER	103	\N	2385	\N
2016-03-01 20:42:00.064-08	2016-03-01 20:42:00.064-08	\N	126	13	BACKER	169	\N	4228	\N
2016-02-02 08:52:02.312-08	2016-02-02 08:52:02.312-08	\N	80	10	BACKER	102	\N	4356	\N
2016-02-18 11:54:08.738-08	2016-02-18 11:54:08.738-08	\N	108	2	BACKER	138	\N	8253	1316
2016-01-31 16:00:00-08	\N	\N	70	12	ADMIN	91	\N	1115	\N
2016-03-18 17:00:00-07	2016-03-18 17:00:00-07	\N	3	59	HOST	246	\N	9804	\N
2016-05-19 12:24:42.921-07	2016-05-19 12:24:42.921-07	\N	392	2	BACKER	533	\N	1568	1316
2016-06-21 09:02:55.799-07	2016-06-21 09:02:55.799-07	\N	642	12	BACKER	841	\N	3533	\N
2016-06-21 09:05:00.99-07	2016-06-21 09:05:00.99-07	\N	642	4	BACKER	842	\N	3533	\N
2016-06-21 09:06:05.21-07	2016-06-21 09:06:05.21-07	\N	642	48	BACKER	843	\N	3533	\N
2016-06-09 10:28:14.08-07	2016-06-09 10:28:14.08-07	\N	8	3	BACKER	717	\N	8638	\N
2016-06-06 17:53:47.104-07	2016-06-06 17:53:47.104-07	\N	555	13	BACKER	708	\N	1848	492
2016-06-06 12:04:36.955-07	2016-06-06 12:04:36.955-07	\N	551	2	BACKER	702	\N	1442	1316
2016-06-22 13:09:46.034-07	2016-06-22 13:09:46.034-07	\N	646	2	BACKER	846	\N	7263	1316
2016-07-01 15:31:46.068-07	2016-07-01 15:31:46.068-07	\N	686	2	BACKER	894	\N	6616	\N
2017-10-17 08:36:33.608-07	2017-10-17 08:36:33.608-07	\N	30	301	BACKER	7942	\N	2385	574
2016-08-01 17:00:00-07	2016-08-01 17:00:00-07	\N	3	195	HOST	1149	\N	9804	\N
2016-09-07 15:13:23.811-07	2016-09-07 15:13:23.811-07	\N	3	241	HOST	1458	\N	9804	\N
2016-09-09 20:42:51.435-07	2016-09-09 20:42:51.435-07	\N	1158	241	BACKER	1471	\N	6067	\N
2016-09-20 13:58:51.903-07	2016-09-20 13:58:51.903-07	\N	1244	4	BACKER	1544	\N	4301	\N
2016-09-29 11:09:42.806-07	2016-09-29 11:09:42.806-07	\N	1329	276	ADMIN	1664	\N	1037	\N
2016-09-29 11:43:49.259-07	2016-09-29 11:43:49.259-07	\N	3	301	HOST	1715	\N	9804	\N
2017-10-29 17:00:00-07	2017-10-29 17:00:00-07	2017-11-01 21:00:00-07	30	51	ADMIN	8592	\N	9814	\N
2016-09-29 11:17:47.337-07	2016-09-29 11:17:47.337-07	\N	3	285	HOST	1730	\N	9804	\N
2016-10-07 09:49:20.388-07	2016-10-07 09:49:20.388-07	\N	1446	241	BACKER	1822	\N	5180	864
2016-10-06 11:36:39.082-07	2016-10-06 11:36:39.082-07	\N	1438	2	BACKER	1815	\N	8045	1316
2017-11-01 17:44:14.994-07	2017-11-01 17:44:14.994-07	\N	3	48	BACKER	8691	\N	9814	\N
2017-10-20 07:35:56.698-07	2017-10-20 07:35:56.698-07	\N	8430	48	BACKER	8044	\N	9333	1027
2016-11-30 08:11:42.605-08	2016-11-30 08:11:42.605-08	\N	1957	2	BACKER	2339	\N	4960	1316
2016-11-28 07:33:15.87-08	2016-11-28 07:33:15.87-08	\N	1890	2	BACKER	2289	\N	6014	1316
2016-01-10 16:00:00-08	\N	\N	34	15	ADMIN	15	\N	1781	\N
2017-11-01 22:06:32.737-07	2017-11-01 22:06:32.737-07	\N	3	12	BACKER	8713	\N	9814	\N
2017-01-03 12:59:38.784-08	2017-01-03 12:59:38.784-08	\N	2416	2	BACKER	2665	\N	3538	1316
2017-10-20 08:17:15.541-07	2017-10-20 08:17:15.541-07	\N	8432	48	BACKER	8047	\N	9335	1027
2017-01-14 09:11:43.287-08	2017-01-14 09:11:43.287-08	\N	2549	270	BACKER	2767	\N	7262	\N
2017-01-16 10:03:56.965-08	2017-01-16 10:03:56.965-08	\N	2561	48	BACKER	2772	\N	8146	1027
2017-11-01 22:08:19.721-07	2017-11-01 22:08:19.721-07	\N	3	51	BACKER	8714	\N	9814	\N
2017-11-01 22:13:45.09-07	2017-11-01 22:13:45.09-07	\N	3	522	BACKER	8715	\N	9814	\N
2017-02-01 09:30:50.44-08	2017-02-01 09:30:50.44-08	\N	2906	271	BACKER	3045	\N	4881	997
2017-02-01 07:16:22.449-08	2017-02-01 07:16:22.449-08	\N	2898	48	BACKER	3042	\N	2232	1027
2016-01-10 16:00:00-08	\N	\N	33	13	ADMIN	12	\N	2745	\N
2016-01-10 16:00:00-08	\N	\N	37	10	ADMIN	10	\N	3441	\N
2017-02-27 16:25:20.392-08	2017-02-27 16:25:20.392-08	\N	3301	522	BACKER	3424	\N	4726	\N
2016-01-10 16:00:00-08	\N	\N	7	10	ADMIN	8	\N	5788	\N
2016-01-10 16:00:00-08	\N	\N	35	12	ADMIN	11	\N	5849	\N
2017-03-09 10:29:55.806-08	2017-03-09 10:29:55.806-08	\N	3442	259	BACKER	3521	\N	7809	855
2016-01-10 16:00:00-08	\N	\N	36	10	ADMIN	9	\N	6017	\N
2015-05-02 17:00:00-07	\N	\N	28	2	ADMIN	5	\N	6280	\N
2016-01-10 16:00:00-08	\N	\N	31	14	ADMIN	13	\N	7538	\N
2016-03-06 16:00:00-08	\N	\N	142	48	ADMIN	204	\N	8492	\N
2016-01-31 16:00:00-08	\N	\N	78	4	ADMIN	99	\N	1504	\N
2016-01-31 16:00:00-08	\N	\N	76	4	ADMIN	97	\N	2245	\N
2016-03-18 17:00:00-07	2017-11-27 10:24:50.235-08	\N	171	59	ADMIN	248	Director	6057	\N
2016-03-18 17:00:00-07	2016-03-18 17:00:00-07	2017-08-15 17:00:00-07	170	59	ADMIN	247	\N	3413	\N
2016-01-31 16:00:00-08	\N	\N	75	4	ADMIN	96	\N	3994	\N
2016-01-31 16:00:00-08	\N	\N	74	4	ADMIN	95	\N	4128	\N
2016-01-31 16:00:00-08	\N	\N	69	12	ADMIN	90	\N	5147	\N
2016-01-31 16:00:00-08	\N	\N	73	3	ADMIN	94	\N	5513	\N
2016-01-31 16:00:00-08	\N	\N	72	3	ADMIN	93	\N	5560	\N
2016-01-31 16:00:00-08	\N	\N	67	13	ADMIN	88	\N	7099	\N
2016-01-31 16:00:00-08	\N	\N	68	15	ADMIN	89	\N	8203	\N
2016-01-31 16:00:00-08	\N	\N	77	4	ADMIN	98	\N	8375	\N
2016-01-31 16:00:00-08	\N	\N	71	3	ADMIN	92	\N	8429	\N
2017-04-03 09:22:46.049-07	2017-04-03 09:22:46.049-07	\N	3	584	HOST	3951	\N	9804	\N
2017-04-04 12:51:04.96-07	2017-04-04 12:51:04.96-07	\N	3999	2	BACKER	3972	\N	2977	1316
2017-04-11 19:05:36.09-07	2017-04-11 19:05:36.09-07	\N	4173	13	BACKER	4093	\N	4475	492
2017-04-30 18:40:31.703-07	2017-04-30 18:40:31.703-07	\N	3419	516	BACKER	4353	\N	3898	\N
2017-05-01 10:13:36.311-07	2017-05-01 10:13:36.311-07	\N	4550	516	BACKER	4371	\N	1788	989
2017-05-08 22:59:17.562-07	2017-05-08 22:59:17.562-07	\N	4711	517	BACKER	4493	\N	3178	510
2017-05-09 11:14:23.365-07	2017-05-09 11:14:23.365-07	\N	4720	2	BACKER	4500	\N	1586	1316
2017-05-10 16:45:46.804-07	2017-05-10 16:45:46.804-07	\N	4749	522	BACKER	4528	\N	2804	\N
2017-06-07 03:44:39.562-07	2017-06-07 03:44:39.562-07	\N	5256	430	BACKER	4981	\N	8319	\N
2017-06-13 18:22:54.36-07	2017-06-13 18:22:54.36-07	\N	3825	517	BACKER	5090	\N	4527	511
2017-07-08 12:45:54.424-07	2017-07-08 12:45:54.424-07	\N	5939	51	BACKER	5509	\N	4707	132
2017-07-19 14:21:45.391-07	2017-07-19 14:21:45.391-07	\N	896	272	BACKER	5689	\N	8290	1051
2017-07-16 20:18:23.781-07	2017-07-16 20:18:23.781-07	\N	6100	2	BACKER	5644	\N	4802	1316
2017-07-31 21:46:30.284-07	2017-07-31 21:46:30.284-07	\N	1325	273	BACKER	5853	\N	3210	\N
2016-06-09 17:00:00-07	\N	\N	577	4	ADMIN	738	\N	3845	\N
2017-08-15 18:57:34.371-07	2017-08-15 18:57:34.371-07	\N	6656	12	BACKER	6097	\N	3919	499
2017-08-15 17:32:25.413-07	2017-08-15 17:32:25.413-07	\N	5616	12	BACKER	6096	\N	3440	499
2017-08-15 17:24:36.519-07	2017-08-15 17:24:36.519-07	\N	6653	12	BACKER	6095	\N	2086	499
2017-02-21 08:25:28.555-08	2017-02-21 08:25:28.555-08	\N	3	510	HOST	3326	\N	9804	\N
2016-01-12 16:00:00-08	\N	\N	3	13	HOST	30	\N	9804	\N
2016-01-12 16:00:00-08	\N	\N	3	14	HOST	31	\N	9804	\N
2016-01-12 16:00:00-08	\N	\N	3	15	HOST	32	\N	9804	\N
2016-03-06 16:00:00-08	\N	\N	3	47	HOST	203	\N	9804	\N
2016-03-06 16:00:00-08	\N	\N	3	48	HOST	205	\N	9804	\N
2015-10-31 17:00:00-07	2015-10-31 17:00:00-07	\N	3	51	HOST	213	\N	9804	\N
2016-01-31 16:00:00-08	\N	\N	3	2	HOST	18	\N	9804	\N
2016-01-31 16:00:00-08	\N	\N	3	3	HOST	19	\N	9804	\N
2016-01-31 16:00:00-08	\N	\N	3	4	HOST	20	\N	9804	\N
2016-09-29 11:41:11.097-07	2016-09-29 11:41:11.097-07	\N	3	300	HOST	1716	\N	9804	\N
2016-09-29 11:38:54.983-07	2016-09-29 11:38:54.983-07	\N	3	299	HOST	1717	\N	9804	\N
2016-09-29 11:37:07.378-07	2016-09-29 11:37:07.378-07	\N	3	298	HOST	1718	\N	9804	\N
2016-09-29 11:34:59.53-07	2016-09-29 11:34:59.53-07	\N	3	297	HOST	1719	\N	9804	\N
2016-09-29 11:33:37.221-07	2016-09-29 11:33:37.221-07	\N	3	295	HOST	1720	\N	9804	\N
2016-09-29 11:32:01.003-07	2016-09-29 11:32:01.003-07	\N	3	294	HOST	1721	\N	9804	\N
2016-09-29 11:30:54.26-07	2016-09-29 11:30:54.26-07	\N	3	293	HOST	1722	\N	9804	\N
2016-09-29 11:30:08.999-07	2016-09-29 11:30:08.999-07	\N	3	292	HOST	1723	\N	9804	\N
\N	\N	2017-11-13 16:00:00-08	3	51	HOST	8577	\N	9804	\N
\N	\N	2017-11-13 16:00:00-08	3	51	HOST	8578	\N	9804	\N
2016-09-29 11:28:54.298-07	2016-09-29 11:28:54.298-07	\N	3	291	HOST	1724	\N	9804	\N
2016-09-29 11:28:08.494-07	2016-09-29 11:28:08.494-07	\N	3	290	HOST	1725	\N	9804	\N
2016-09-29 11:26:35.16-07	2016-09-29 11:26:35.16-07	\N	3	289	HOST	1726	\N	9804	\N
2016-09-29 11:25:22.012-07	2016-09-29 11:25:22.012-07	\N	3	288	HOST	1727	\N	9804	\N
2016-09-29 11:24:17.83-07	2016-09-29 11:24:17.83-07	\N	3	287	HOST	1728	\N	9804	\N
2016-09-29 11:19:11.467-07	2016-09-29 11:19:11.467-07	\N	3	286	HOST	1729	\N	9804	\N
2016-09-29 11:16:52.145-07	2016-09-29 11:16:52.145-07	\N	3	284	HOST	1732	\N	9804	\N
2016-09-29 11:16:17.13-07	2016-09-29 11:16:17.13-07	\N	3	283	HOST	1733	\N	9804	\N
2016-09-29 11:15:23.948-07	2016-09-29 11:15:23.948-07	\N	3	282	HOST	1734	\N	9804	\N
2016-09-29 11:14:46.62-07	2016-09-29 11:14:46.62-07	\N	3	281	HOST	1735	\N	9804	\N
2016-09-29 11:13:48.784-07	2016-09-29 11:13:48.784-07	\N	3	280	HOST	1736	\N	9804	\N
2016-09-29 11:12:58.888-07	2016-09-29 11:12:58.888-07	\N	3	279	HOST	1737	\N	9804	\N
2016-09-29 11:11:53.87-07	2016-09-29 11:11:53.87-07	\N	3	278	HOST	1738	\N	9804	\N
2016-09-29 11:10:43.445-07	2016-09-29 11:10:43.445-07	\N	3	277	HOST	1739	\N	9804	\N
2016-09-29 11:09:42.812-07	2016-09-29 11:09:42.812-07	\N	3	276	HOST	1740	\N	9804	\N
2016-09-29 11:08:19.528-07	2016-09-29 11:08:19.528-07	\N	3	275	HOST	1741	\N	9804	\N
2016-09-29 11:06:44.758-07	2016-09-29 11:06:44.758-07	\N	3	274	HOST	1742	\N	9804	\N
2016-09-29 11:06:00.979-07	2016-09-29 11:06:00.979-07	\N	3	273	HOST	1743	\N	9804	\N
2016-09-29 11:05:19.101-07	2016-09-29 11:05:19.101-07	\N	3	272	HOST	1744	\N	9804	\N
2016-09-29 11:03:46.814-07	2016-09-29 11:03:46.814-07	\N	3	271	HOST	1745	\N	9804	\N
2016-09-29 11:02:54.581-07	2016-09-29 11:02:54.581-07	\N	3	270	HOST	1746	\N	9804	\N
2015-11-19 02:07:53.479-08	2017-10-06 06:21:12.319-07	2017-11-13 16:00:00-08	3	51	HOST	7226	\N	9804	\N
2016-09-29 11:01:49.724-07	2016-09-29 11:01:49.724-07	\N	3	269	HOST	1747	\N	9804	\N
2016-09-29 11:01:04.753-07	2016-09-29 11:01:04.753-07	\N	3	268	HOST	1748	\N	9804	\N
2016-09-29 11:00:01.891-07	2016-09-29 11:00:01.891-07	\N	3	267	HOST	1749	\N	9804	\N
2016-09-29 10:59:15.446-07	2016-09-29 10:59:15.446-07	\N	3	266	HOST	1750	\N	9804	\N
2016-09-29 10:58:16.643-07	2016-09-29 10:58:16.643-07	\N	3	265	HOST	1751	\N	9804	\N
2016-09-29 10:54:53.501-07	2016-09-29 10:54:53.501-07	\N	3	264	HOST	1752	\N	9804	\N
2016-09-29 10:53:00.559-07	2016-09-29 10:53:00.559-07	\N	3	263	HOST	1753	\N	9804	\N
2016-09-29 10:51:29.396-07	2016-09-29 10:51:29.396-07	\N	3	262	HOST	1754	\N	9804	\N
2016-09-29 10:49:43.088-07	2016-09-29 10:49:43.088-07	\N	3	261	HOST	1755	\N	9804	\N
2016-09-29 10:44:40.461-07	2016-09-29 10:44:40.461-07	\N	3	260	HOST	1756	\N	9804	\N
2016-09-29 10:43:14.112-07	2016-09-29 10:43:14.112-07	\N	3	259	HOST	1757	\N	9804	\N
2017-01-03 16:00:00-08	2017-01-03 16:00:00-08	\N	3	430	HOST	2682	\N	9804	\N
2017-02-21 08:55:29.765-08	2017-02-21 08:55:29.765-08	\N	3	511	HOST	3328	\N	9804	\N
2017-02-21 10:11:30.855-08	2017-02-21 10:11:30.855-08	\N	3	512	HOST	3332	\N	9804	\N
2017-02-21 10:35:34.613-08	2017-02-21 10:35:34.613-08	\N	3	513	HOST	3334	\N	9804	\N
2017-02-21 10:49:14.435-08	2017-02-21 10:49:14.435-08	\N	3	515	HOST	3338	\N	9804	\N
2017-02-21 11:02:21.646-08	2017-02-21 11:02:21.646-08	\N	3	516	HOST	3341	\N	9804	\N
2017-02-21 11:07:25.321-08	2017-02-21 11:07:25.321-08	\N	3	517	HOST	3343	\N	9804	\N
2017-02-21 11:13:03.538-08	2017-02-21 11:13:03.538-08	\N	3	518	HOST	3345	\N	9804	\N
2017-02-21 11:25:28.822-08	2017-02-21 11:25:28.822-08	\N	3	519	HOST	3347	\N	9804	\N
2017-02-21 11:34:47.427-08	2017-02-21 11:34:47.427-08	\N	3	520	HOST	3349	\N	9804	\N
2017-02-21 11:39:46.29-08	2017-02-21 11:39:46.29-08	\N	3	521	HOST	3351	\N	9804	\N
2017-02-21 11:45:19.309-08	2017-02-21 11:45:19.309-08	\N	3	522	HOST	3353	\N	9804	\N
2017-02-21 12:04:49.156-08	2017-02-21 12:04:49.156-08	\N	3	523	HOST	3355	\N	9804	\N
2017-09-08 04:51:40.861-07	2017-09-08 04:51:40.861-07	\N	7136	517	BACKER	6488	\N	3022	510
2017-02-21 12:11:44.893-08	2017-02-21 12:11:44.893-08	\N	3	524	HOST	3357	\N	9804	\N
2017-02-21 12:16:59.184-08	2017-02-21 12:16:59.184-08	\N	3	525	HOST	3359	\N	9804	\N
2017-02-21 11:02:21.568-08	2017-02-21 11:02:21.568-08	\N	3	516	ADMIN	3340	\N	9804	\N
2017-02-21 11:07:25.188-08	2017-02-21 11:07:25.188-08	\N	3	517	ADMIN	3342	\N	9804	\N
2017-02-21 11:13:03.394-08	2017-02-21 11:13:03.394-08	\N	3	518	ADMIN	3344	\N	9804	\N
2017-02-21 11:25:28.725-08	2017-02-21 11:25:28.725-08	\N	3	519	ADMIN	3346	\N	9804	\N
2017-02-21 11:34:47.02-08	2017-02-21 11:34:47.02-08	\N	3	520	ADMIN	3348	\N	9804	\N
2017-02-21 11:39:46.239-08	2017-02-21 11:39:46.239-08	\N	3	521	ADMIN	3350	\N	9804	\N
2017-02-21 11:45:19.169-08	2017-02-21 11:45:19.169-08	\N	3	522	ADMIN	3352	\N	9804	\N
2017-02-21 12:04:48.979-08	2017-02-21 12:04:48.979-08	\N	3	523	ADMIN	3354	\N	9804	\N
2017-02-21 12:11:44.767-08	2017-02-21 12:11:44.767-08	\N	3	524	ADMIN	3356	\N	9804	\N
2017-02-21 12:16:59.092-08	2017-02-21 12:16:59.092-08	\N	3	525	ADMIN	3358	\N	9804	\N
2017-09-15 11:11:51.958-07	2017-09-15 11:11:51.958-07	\N	896	2	BACKER	6804	\N	8290	1316
2017-09-19 16:54:18.238-07	2017-09-19 16:54:18.238-07	\N	7537	12	BACKER	6875	\N	2170	499
2017-09-19 18:51:06.139-07	2017-09-19 18:51:06.139-07	\N	7543	12	BACKER	6879	\N	3056	499
2016-01-12 16:00:00-08	\N	\N	3	12	HOST	29	\N	9804	\N
2017-10-24 11:04:53.738-07	2017-10-24 11:04:53.738-07	\N	8512	516	BACKER	8171	\N	9451	\N
2017-06-07 09:24:56.407-07	2017-06-07 09:24:56.407-07	\N	5267	13	BACKER	4999	\N	2300	492
2017-01-18 05:54:51.032-08	2017-01-18 05:54:51.032-08	\N	2594	48	BACKER	2794	\N	3116	1027
2017-05-15 05:07:59.716-07	2017-05-15 05:07:59.716-07	\N	4834	14	BACKER	4597	\N	2984	1339
2017-09-19 18:48:32.973-07	2017-09-19 18:48:32.973-07	\N	7542	12	BACKER	6878	\N	5599	499
2016-02-02 13:46:44.979-08	2016-02-02 13:46:44.979-08	\N	8	14	BACKER	108	\N	8638	\N
2017-04-10 18:09:50.695-07	2017-04-10 18:09:50.695-07	\N	4153	13	BACKER	4088	\N	7368	492
2017-08-14 14:46:25.049-07	2017-08-14 14:46:25.049-07	\N	6604	59	BACKER	6046	\N	7701	\N
2016-08-01 17:00:00-07	2016-08-01 17:00:00-07	\N	897	195	ADMIN	1150	\N	5439	\N
2016-08-03 10:47:17.3-07	2016-08-03 10:47:17.3-07	\N	896	4	BACKER	1147	\N	8290	1428
2016-12-18 17:41:29.216-08	2016-12-18 17:41:29.216-08	\N	2220	259	BACKER	2545	\N	1831	855
2016-09-07 15:13:23.641-07	2016-09-07 15:13:23.641-07	\N	1145	241	ADMIN	1457	\N	3917	\N
2016-09-29 11:26:35.151-07	2016-09-29 11:26:35.151-07	\N	1349	289	ADMIN	1684	\N	1190	\N
2016-09-29 11:30:08.992-07	2016-09-29 11:30:08.992-07	\N	1354	292	ADMIN	1689	\N	1210	\N
2016-09-29 11:14:46.62-07	2016-09-29 11:14:46.62-07	\N	1338	281	ADMIN	1673	\N	1368	\N
2016-09-29 11:09:42.812-07	2016-09-29 11:09:42.812-07	\N	1330	276	ADMIN	1665	\N	1460	\N
2016-09-29 11:33:37.221-07	2016-09-29 11:33:37.221-07	\N	1361	295	ADMIN	1695	\N	1477	\N
2016-09-29 11:32:01.003-07	2016-09-29 11:32:01.003-07	\N	1358	294	ADMIN	1693	\N	1650	\N
2016-09-29 11:43:49.259-07	2016-09-29 11:43:49.259-07	\N	1377	301	ADMIN	1713	\N	1804	\N
2016-09-29 10:44:40.454-07	2016-09-29 10:44:40.454-07	\N	1304	260	ADMIN	1638	\N	1811	\N
2016-09-29 11:38:54.983-07	2016-09-29 11:38:54.983-07	\N	1369	299	ADMIN	1704	\N	1900	\N
2016-09-29 10:58:16.643-07	2016-09-29 10:58:16.643-07	\N	1315	265	ADMIN	1649	\N	2014	\N
2016-09-29 11:11:53.87-07	2016-09-29 11:11:53.87-07	\N	1334	278	ADMIN	1669	\N	2023	\N
2016-09-29 10:44:40.461-07	2016-09-29 10:44:40.461-07	\N	1305	260	ADMIN	1639	\N	2028	\N
2016-09-29 11:12:58.888-07	2016-09-29 11:12:58.888-07	\N	1336	279	ADMIN	1671	\N	2136	\N
2016-09-29 11:05:19.093-07	2016-09-29 11:05:19.093-07	\N	1323	272	ADMIN	1658	\N	2255	\N
2016-09-29 11:08:19.514-07	2016-09-29 11:08:19.514-07	\N	1327	275	ADMIN	1662	\N	2319	\N
2016-09-29 10:51:29.396-07	2016-09-29 10:51:29.396-07	\N	1310	262	ADMIN	1644	\N	2349	\N
2016-09-29 10:53:00.559-07	2016-09-29 10:53:00.559-07	\N	1312	263	ADMIN	1646	\N	2383	\N
2016-09-29 11:16:52.145-07	2016-09-29 11:16:52.145-07	\N	1341	284	ADMIN	1676	\N	2405	\N
2016-09-29 11:37:07.378-07	2016-09-29 11:37:07.378-07	\N	1366	298	ADMIN	1702	\N	2685	\N
2016-09-29 11:25:22.012-07	2016-09-29 11:25:22.012-07	\N	1348	288	ADMIN	1683	\N	2824	\N
2016-09-29 11:06:44.758-07	2016-09-29 11:06:44.758-07	\N	1326	274	ADMIN	1661	\N	2929	\N
2016-09-29 11:37:07.37-07	2016-09-29 11:37:07.37-07	\N	1365	298	ADMIN	1700	\N	3031	\N
2016-09-29 11:28:08.494-07	2016-09-29 11:28:08.494-07	\N	1352	290	ADMIN	1687	\N	3042	\N
2016-09-29 11:01:49.724-07	2016-09-29 11:01:49.724-07	\N	1319	269	ADMIN	1654	\N	3151	\N
2016-09-29 11:06:00.979-07	2016-09-29 11:06:00.979-07	\N	1325	273	ADMIN	1660	\N	3210	\N
2016-09-29 11:34:59.522-07	2016-09-29 11:34:59.522-07	\N	1362	297	ADMIN	1697	\N	3229	\N
2016-09-29 11:43:49.259-07	2016-09-29 11:43:49.259-07	\N	1376	301	ADMIN	1712	\N	3271	\N
2016-09-29 11:38:54.974-07	2016-09-29 11:38:54.974-07	\N	1368	299	ADMIN	1703	\N	3353	\N
2016-09-29 11:19:11.462-07	2016-09-29 11:19:11.462-07	\N	1343	286	ADMIN	1678	\N	3418	\N
2016-09-29 11:41:11.077-07	2017-11-28 07:38:02.291-08	\N	1371	300	ADMIN	1706	\N	1060	\N
2016-09-29 11:32:00.998-07	2016-09-29 11:32:00.998-07	\N	1357	294	ADMIN	1692	\N	3483	\N
2016-09-29 11:16:17.13-07	2016-09-29 11:16:17.13-07	\N	1340	283	ADMIN	1675	\N	3492	\N
2016-09-29 11:02:54.581-07	2016-09-29 11:02:54.581-07	\N	1321	270	ADMIN	1656	\N	3495	\N
2016-09-29 11:33:37.213-07	2016-09-29 11:33:37.213-07	\N	1359	295	ADMIN	1694	\N	3529	\N
2016-09-29 11:28:08.489-07	2016-09-29 11:28:08.489-07	\N	1351	290	ADMIN	1686	\N	3851	\N
2016-09-29 11:43:49.258-07	2016-09-29 11:43:49.258-07	\N	1379	301	ADMIN	1711	\N	3869	\N
2016-09-29 11:15:23.948-07	2016-09-29 11:15:23.948-07	\N	1339	282	ADMIN	1674	\N	4268	\N
2016-09-29 11:24:17.83-07	2016-09-29 11:24:17.83-07	\N	1346	287	ADMIN	1681	\N	4542	\N
2016-09-29 11:24:17.825-07	2016-09-29 11:24:17.825-07	\N	1345	287	ADMIN	1680	\N	4595	\N
2016-09-29 11:02:54.576-07	2016-09-29 11:02:54.576-07	\N	1320	270	ADMIN	1655	\N	4703	\N
2016-09-29 11:00:01.891-07	2016-09-29 11:00:01.891-07	\N	1314	267	ADMIN	1651	\N	4788	\N
2016-09-29 11:26:35.16-07	2016-09-29 11:26:35.16-07	\N	1350	289	ADMIN	1685	\N	4847	\N
2016-09-29 10:59:15.446-07	2016-09-29 10:59:15.446-07	\N	1316	266	ADMIN	1650	\N	4923	\N
2016-09-29 11:01:04.753-07	2016-09-29 11:01:04.753-07	\N	1318	268	ADMIN	1653	\N	4932	\N
2016-09-29 10:43:14.112-07	2016-09-29 10:43:14.112-07	\N	1303	259	ADMIN	1637	\N	5251	\N
2016-09-29 11:30:08.999-07	2016-09-29 11:30:08.999-07	\N	1355	292	ADMIN	1690	\N	5334	\N
2016-09-29 11:43:49.259-07	2016-09-29 11:43:49.259-07	\N	1378	301	ADMIN	1714	\N	5394	\N
2016-09-29 11:13:48.784-07	2016-09-29 11:13:48.784-07	\N	1337	280	ADMIN	1672	\N	5606	\N
2016-09-29 11:43:49.24-07	2016-09-29 11:43:49.24-07	\N	1375	301	ADMIN	1710	\N	5622	\N
2016-09-29 11:10:43.419-07	2016-09-29 11:10:43.419-07	\N	1331	277	ADMIN	1666	\N	5791	\N
2016-09-29 10:49:43.081-07	2016-09-29 10:49:43.081-07	\N	1307	261	ADMIN	1641	\N	5922	\N
2016-09-29 11:30:54.26-07	2016-09-29 11:30:54.26-07	\N	1356	293	ADMIN	1691	\N	5975	\N
2016-09-29 10:53:00.559-07	2016-09-29 10:53:00.559-07	\N	1311	263	ADMIN	1645	\N	6020	\N
2016-09-29 10:51:29.377-07	2016-09-29 10:51:29.377-07	\N	1309	262	ADMIN	1643	\N	6108	\N
2016-09-29 11:17:47.337-07	2016-09-29 11:17:47.337-07	\N	1342	285	ADMIN	1677	\N	6283	\N
2016-09-29 11:19:11.467-07	2016-09-29 11:19:11.467-07	\N	1344	286	ADMIN	1679	\N	6285	\N
2016-09-29 11:12:58.877-07	2016-09-29 11:12:58.877-07	\N	1335	279	ADMIN	1670	\N	6674	\N
2016-09-29 11:05:19.101-07	2016-09-29 11:05:19.101-07	\N	1324	272	ADMIN	1659	\N	6808	\N
2016-09-29 11:34:59.53-07	2016-09-29 11:34:59.53-07	\N	1363	297	ADMIN	1698	\N	6930	\N
2016-09-29 11:10:43.445-07	2016-09-29 11:10:43.445-07	\N	1332	277	ADMIN	1667	\N	7243	\N
2016-09-29 11:08:19.528-07	2016-09-29 11:08:19.528-07	\N	1328	275	ADMIN	1663	\N	7288	\N
2016-09-29 11:38:54.983-07	2016-09-29 11:38:54.983-07	\N	1370	299	ADMIN	1705	\N	7312	\N
2016-09-29 10:49:43.088-07	2016-09-29 10:49:43.088-07	\N	1308	261	ADMIN	1642	\N	7531	\N
2016-09-29 11:33:37.221-07	2016-09-29 11:33:37.221-07	\N	1360	295	ADMIN	1696	\N	7760	\N
2016-09-29 11:25:22-07	2016-09-29 11:25:22-07	\N	1347	288	ADMIN	1682	\N	7955	\N
2016-09-29 11:03:46.814-07	2016-09-29 11:03:46.814-07	\N	1322	271	ADMIN	1657	\N	8136	\N
2016-09-29 11:34:59.53-07	2016-09-29 11:34:59.53-07	\N	1364	297	ADMIN	1699	\N	8451	\N
2016-09-29 10:54:53.485-07	2017-10-19 08:22:05.353-07	\N	1313	264	ADMIN	1647	\N	8030	\N
2016-09-29 10:54:53.501-07	2017-10-19 08:22:05.354-07	\N	1314	264	ADMIN	1648	\N	4788	\N
2016-09-29 11:41:11.097-07	2017-11-28 07:38:02.291-08	\N	1374	300	ADMIN	1708	\N	8405	\N
2016-09-29 11:41:11.089-07	2017-11-28 07:38:02.291-08	\N	1372	300	ADMIN	1707	\N	4521	\N
2017-01-03 16:00:00-08	2017-01-03 16:00:00-08	\N	2431	430	ADMIN	2681	\N	3980	\N
2017-02-21 08:25:28.457-08	2017-02-21 08:25:28.457-08	\N	3	510	ADMIN	3325	\N	9804	\N
2017-04-03 09:22:45.962-07	2017-04-03 09:22:45.962-07	\N	3206	584	ADMIN	3950	\N	5903	\N
2016-09-29 11:28:54.298-07	2016-09-29 11:28:54.298-07	2017-06-20 17:00:00-07	1353	291	ADMIN	1688	\N	2269	\N
2017-06-20 17:00:00-07	2017-06-20 17:00:00-07	\N	4283	291	ADMIN	5189	\N	2776	\N
2017-06-20 17:00:00-07	2017-06-20 17:00:00-07	\N	4285	291	ADMIN	5190	\N	4898	\N
2017-06-20 17:00:00-07	2017-06-20 17:00:00-07	\N	4843	291	ADMIN	5191	\N	4989	\N
2017-10-19 08:22:05.727-07	2017-10-19 08:22:05.727-07	\N	8410	264	ADMIN	8019	\N	9308	\N
2017-08-08 17:00:00-07	2017-08-08 17:00:00-07	\N	4921	47	ADMIN	5961	\N	5783	\N
2016-08-01 17:00:00-07	2016-08-01 17:00:00-07	2017-09-07 17:00:00-07	898	195	ADMIN	1151	\N	1734	\N
2017-09-07 17:00:00-07	2017-09-07 17:00:00-07	\N	7079	195	ADMIN	6479	\N	7229	\N
2017-02-21 10:11:30.773-08	2017-02-21 10:11:30.773-08	\N	3	512	ADMIN	3331	\N	9804	\N
2017-02-21 08:55:29.655-08	2017-02-21 08:55:29.655-08	\N	3	511	ADMIN	3327	\N	9804	\N
2017-02-21 10:35:34.524-08	2017-02-21 10:35:34.524-08	\N	3	513	ADMIN	3333	\N	9804	\N
2017-02-21 10:49:14.345-08	2017-02-21 10:49:14.345-08	\N	3	515	ADMIN	3337	\N	9804	\N
2017-10-17 08:16:23.573-07	2017-10-17 08:16:23.573-07	\N	8	301	BACKER	7939	\N	8638	574
2016-09-29 11:41:11.097-07	2017-11-28 07:38:02.291-08	\N	1373	300	ADMIN	1709	\N	7479	\N
2016-01-10 16:00:00-08	\N	\N	32	14	ADMIN	14	\N	6353	\N
2016-09-29 11:37:07.378-07	2016-09-29 11:37:07.378-07	\N	1367	298	ADMIN	1701	\N	8042	\N
2016-09-29 11:01:04.72-07	2016-09-29 11:01:04.72-07	\N	1317	268	ADMIN	1652	\N	6567	\N
2016-09-29 11:11:53.863-07	2016-09-29 11:11:53.863-07	\N	1333	278	ADMIN	1668	\N	8487	\N
2017-11-06 22:46:56.981-08	2017-11-06 22:46:56.981-08	\N	3	300	BACKER	8923	\N	9814	\N
2017-11-06 22:37:40.409-08	2017-11-06 22:37:40.409-08	\N	3	520	BACKER	8920	\N	9814	\N
2017-11-08 15:20:18.802-08	2017-11-08 15:20:18.802-08	\N	3	524	BACKER	8984	\N	9814	\N
2017-11-14 15:18:07.778-08	2017-11-14 15:18:07.778-08	\N	3	517	BACKER	9107	\N	9814	\N
2017-11-14 15:27:45.626-08	2017-11-14 15:27:45.626-08	\N	3	59	BACKER	9108	\N	9814	\N
2017-11-15 08:48:40.618-08	2017-11-15 08:48:40.618-08	\N	3	195	BACKER	9120	\N	9814	\N
2017-11-16 19:13:54.839-08	2017-11-16 19:13:54.839-08	\N	142	48	BACKER	9163	\N	8492	1027
2017-11-21 02:46:32.076-08	2017-11-21 02:46:32.076-08	\N	9152	430	BACKER	9333	\N	10465	\N
2017-11-27 10:24:50.241-08	2017-11-27 10:24:50.241-08	\N	3	59	ADMIN	9475	\N	\N	\N
2017-11-28 07:38:02.323-08	2017-11-28 07:38:02.323-08	\N	3	300	ADMIN	9514	\N	\N	\N
2017-11-28 13:30:22.01-08	2017-11-28 13:30:22.01-08	\N	9296	12	BACKER	9536	\N	10660	\N
2017-12-05 23:43:08.047-08	2017-12-05 23:43:08.047-08	\N	171	59	BACKER	10395	\N	6057	662
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          4018.dat                                                                                            0000600 0004000 0002000 00000162027 13212311737 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        79	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	2	http://****
80	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	3	http://****
81	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	4	http://****
82	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	10	http://****
83	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	12	http://****
84	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	13	http://****
85	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	14	http://****
86	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	15	http://****
87	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	47	http://****
88	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	48	http://****
89	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	59	http://****
5787	email	collective.expense.created	f	2016-12-28 16:13:56.345-08	2017-01-17 16:00:00-08	1368	299	http://****
598	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	288	http://****
599	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	289	http://****
600	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	290	http://****
601	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	291	http://****
602	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	292	http://****
603	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	293	http://****
604	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	294	http://****
605	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	295	http://****
606	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	297	http://****
607	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	298	http://****
608	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	299	http://****
609	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	13	http://****
610	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	278	http://****
611	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	59	http://****
612	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	2	http://****
613	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	51	http://****
614	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	241	http://****
615	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	3	http://****
616	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	48	http://****
2125	email	mailinglist.admins	t	2016-10-10 13:37:17.212-07	2016-10-10 13:37:17.212-07	1378	301	http://****
2053	email	mailinglist.admins	t	2016-10-10 13:37:17.196-07	2016-10-10 13:37:17.196-07	1308	261	http://****
2057	email	mailinglist.admins	t	2016-10-10 13:37:17.197-07	2016-10-10 13:37:17.197-07	1312	263	http://****
2062	email	mailinglist.admins	t	2016-10-10 13:37:17.198-07	2016-10-10 13:37:17.198-07	1314	267	http://****
2067	email	mailinglist.admins	t	2016-10-10 13:37:17.199-07	2016-10-10 13:37:17.199-07	1321	270	http://****
2074	email	mailinglist.admins	t	2016-10-10 13:37:17.2-07	2016-10-10 13:37:17.2-07	1328	275	http://****
2079	email	mailinglist.admins	t	2016-10-10 13:37:17.201-07	2016-10-10 13:37:17.201-07	1333	278	http://****
2083	email	mailinglist.admins	t	2016-10-10 13:37:17.202-07	2016-10-10 13:37:17.202-07	1337	280	http://****
2088	email	mailinglist.admins	t	2016-10-10 13:37:17.203-07	2016-10-10 13:37:17.203-07	1342	285	http://****
2095	email	mailinglist.admins	t	2016-10-10 13:37:17.205-07	2016-10-10 13:37:17.205-07	1349	289	http://****
2098	email	mailinglist.admins	t	2016-10-10 13:37:17.206-07	2016-10-10 13:37:17.206-07	1352	290	http://****
2105	email	mailinglist.admins	t	2016-10-10 13:37:17.207-07	2016-10-10 13:37:17.207-07	1359	295	http://****
2110	email	mailinglist.admins	t	2016-10-10 13:37:17.208-07	2016-10-10 13:37:17.208-07	1364	297	http://****
2115	email	mailinglist.admins	t	2016-10-10 13:37:17.21-07	2016-10-10 13:37:17.21-07	1369	299	http://****
2120	email	mailinglist.admins	t	2016-10-10 13:37:17.211-07	2016-10-10 13:37:17.211-07	1373	300	http://****
2048	email	mailinglist.admins	t	2016-10-10 13:37:17.195-07	2016-10-10 13:37:17.195-07	1303	259	http://****
2054	email	mailinglist.admins	t	2016-10-10 13:37:17.196-07	2016-10-10 13:37:17.196-07	1309	262	http://****
2058	email	mailinglist.admins	t	2016-10-10 13:37:17.197-07	2016-10-10 13:37:17.197-07	1313	264	http://****
2063	email	mailinglist.admins	t	2016-10-10 13:37:17.198-07	2016-10-10 13:37:17.198-07	1317	268	http://****
2068	email	mailinglist.admins	t	2016-10-10 13:37:17.199-07	2016-10-10 13:37:17.199-07	1322	271	http://****
2073	email	mailinglist.admins	t	2016-10-10 13:37:17.2-07	2016-10-10 13:37:17.2-07	1327	275	http://****
2078	email	mailinglist.admins	t	2016-10-10 13:37:17.201-07	2016-10-10 13:37:17.201-07	1332	277	http://****
566	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	261	http://****
567	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	10	http://****
568	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	268	http://****
617	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	47	http://****
618	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	4	http://****
619	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	300	http://****
620	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	301	http://****
621	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	12	http://****
655	email	mailinglist.backers	t	2016-10-10 13:37:16.676-07	2016-10-10 13:37:16.676-07	126	13	http://****
658	email	mailinglist.backers	t	2016-10-10 13:37:16.677-07	2016-10-10 13:37:16.677-07	2	10	http://****
698	email	mailinglist.backers	t	2016-10-10 13:37:16.722-07	2016-10-10 13:37:16.722-07	2	13	http://****
735	email	mailinglist.backers	t	2016-10-10 13:37:16.762-07	2016-10-10 13:37:16.762-07	108	2	http://****
680	email	mailinglist.backers	t	2016-10-10 13:37:16.704-07	2016-10-10 13:37:16.704-07	30	12	http://****
690	email	mailinglist.backers	t	2016-10-10 13:37:16.719-07	2016-10-10 13:37:16.719-07	30	14	http://****
16243	email	mailinglist.backers	t	2017-05-09 11:14:23.366-07	2017-05-09 11:14:23.366-07	4720	2	http://****
691	email	mailinglist.backers	t	2016-10-10 13:37:16.72-07	2016-10-10 13:37:16.72-07	80	10	http://****
697	email	mailinglist.backers	t	2016-10-10 13:37:16.722-07	2016-10-10 13:37:16.722-07	8	14	http://****
1089	email	mailinglist.backers	t	2016-10-10 13:37:16.922-07	2016-10-10 13:37:16.922-07	392	2	http://****
692	email	mailinglist.backers	t	2016-10-10 13:37:16.72-07	2016-10-10 13:37:16.72-07	30	13	http://****
1244	email	mailinglist.backers	t	2016-10-10 13:37:16.958-07	2016-10-10 13:37:16.958-07	8	3	http://****
1322	email	mailinglist.backers	t	2016-10-10 13:37:16.976-07	2016-10-10 13:37:16.976-07	642	48	http://****
1360	email	mailinglist.backers	t	2016-10-10 13:37:16.984-07	2016-10-10 13:37:16.984-07	686	2	http://****
1232	email	mailinglist.backers	t	2016-10-10 13:37:16.955-07	2016-10-10 13:37:16.955-07	551	2	http://****
1237	email	mailinglist.backers	t	2016-10-10 13:37:16.956-07	2016-10-10 13:37:16.956-07	555	13	http://****
1321	email	mailinglist.backers	t	2016-10-10 13:37:16.975-07	2016-10-10 13:37:16.975-07	642	4	http://****
1320	email	mailinglist.backers	t	2016-10-10 13:37:16.975-07	2016-10-10 13:37:16.975-07	642	12	http://****
1325	email	mailinglist.backers	t	2016-10-10 13:37:16.976-07	2016-10-10 13:37:16.976-07	646	2	http://****
1609	email	mailinglist.backers	t	2016-10-10 13:37:17.062-07	2016-10-10 13:37:17.062-07	896	4	http://****
1888	email	mailinglist.backers	t	2016-10-10 13:37:17.141-07	2016-10-10 13:37:17.141-07	1158	241	http://****
1961	email	mailinglist.backers	t	2016-10-10 13:37:17.158-07	2016-10-10 13:37:17.158-07	1244	4	http://****
2233	email	mailinglist.backers	t	2016-10-10 13:37:17.237-07	2016-10-10 13:37:17.237-07	1446	241	http://****
2226	email	mailinglist.backers	t	2016-10-10 13:37:17.235-07	2016-10-10 13:37:17.235-07	1438	2	http://****
2697	email	mailinglist.backers	t	2016-11-28 07:33:15.871-08	2016-11-28 07:33:15.871-08	1890	2	http://****
3047	email	mailinglist.backers	t	2016-11-30 08:11:42.607-08	2016-11-30 08:11:42.607-08	1957	2	http://****
3286	email	mailinglist.backers	t	2016-12-18 17:41:29.217-08	2016-12-18 17:41:29.217-08	2220	259	http://****
16437	email	collective.donation.created	f	2017-05-11 09:41:40.872-07	2017-05-11 09:41:40.872-07	171	59	http://****
6045	email	mailinglist.backers	t	2017-01-03 12:59:38.785-08	2017-01-03 12:59:38.785-08	2416	2	http://****
6351	email	mailinglist.backers	t	2017-01-14 09:11:43.288-08	2017-01-14 09:11:43.288-08	2549	270	http://****
6368	email	mailinglist.backers	t	2017-01-16 10:03:56.966-08	2017-01-16 10:03:56.966-08	2561	48	http://****
6433	email	mailinglist.backers	t	2017-01-18 05:54:51.032-08	2017-01-18 05:54:51.032-08	2594	48	http://****
5552	email	collective.expense.created	f	2016-12-28 16:13:56.264-08	2017-01-17 16:00:00-08	28	2	http://****
5563	email	collective.expense.created	f	2016-12-28 16:13:56.267-08	2017-01-17 16:00:00-08	31	14	http://****
5767	email	collective.expense.created	f	2016-12-28 16:13:56.341-08	2017-01-17 16:00:00-08	1333	278	http://****
16640	email	mailinglist.backers	t	2017-05-15 05:07:59.717-07	2017-05-15 05:07:59.717-07	4834	14	http://****
7114	email	mailinglist.backers	t	2017-02-01 07:16:22.45-08	2017-02-01 07:16:22.45-08	2898	48	http://****
7122	email	mailinglist.backers	t	2017-02-01 09:30:50.441-08	2017-02-01 09:30:50.441-08	2906	271	http://****
8040	email	mailinglist.host	t	2017-02-21 08:25:28.556-08	2017-02-21 08:25:28.556-08	3	510	http://****
8048	email	mailinglist.host	t	2017-02-21 08:55:29.765-08	2017-02-21 08:55:29.765-08	3	511	http://****
8064	email	mailinglist.host	t	2017-02-21 10:11:30.856-08	2017-02-21 10:11:30.856-08	3	512	http://****
8074	email	mailinglist.host	t	2017-02-21 10:35:34.614-08	2017-02-21 10:35:34.614-08	3	513	http://****
8039	email	collective.monthlyreport	t	2017-02-21 08:25:28.459-08	2017-02-21 08:25:28.459-08	3	510	http://****
8047	email	collective.monthlyreport	t	2017-02-21 08:55:29.66-08	2017-02-21 08:55:29.66-08	3206	511	http://****
8063	email	collective.monthlyreport	t	2017-02-21 10:11:30.775-08	2017-02-21 10:11:30.775-08	3	512	http://****
8041	email	collective.transaction.created	t	2017-02-21 08:25:28.556-08	2017-02-21 08:25:28.556-08	3	510	http://****
8049	email	collective.transaction.created	t	2017-02-21 08:55:29.765-08	2017-02-21 08:55:29.765-08	3	511	http://****
8065	email	collective.transaction.created	t	2017-02-21 10:11:30.856-08	2017-02-21 10:11:30.856-08	3	512	http://****
8038	email	collective.expense.created	t	2017-02-21 08:25:28.459-08	2017-02-21 08:25:28.459-08	3	510	http://****
8046	email	collective.expense.created	t	2017-02-21 08:55:29.658-08	2017-02-21 08:55:29.658-08	3206	511	http://****
8050	email	collective.expense.created	t	2017-02-21 08:55:29.766-08	2017-02-21 08:55:29.766-08	3	511	http://****
8075	email	collective.transaction.created	t	2017-02-21 10:35:34.614-08	2017-02-21 10:35:34.614-08	3	513	http://****
8086	email	collective.expense.created	t	2017-02-21 10:49:14.347-08	2017-02-21 10:49:14.347-08	3	515	http://****
8088	email	mailinglist.host	t	2017-02-21 10:49:14.435-08	2017-02-21 10:49:14.435-08	3	515	http://****
8095	email	mailinglist.host	t	2017-02-21 11:02:21.647-08	2017-02-21 11:02:21.647-08	3	516	http://****
8101	email	mailinglist.host	t	2017-02-21 11:07:25.322-08	2017-02-21 11:07:25.322-08	3	517	http://****
8107	email	mailinglist.host	t	2017-02-21 11:13:03.539-08	2017-02-21 11:13:03.539-08	3	518	http://****
8113	email	mailinglist.host	t	2017-02-21 11:25:28.823-08	2017-02-21 11:25:28.823-08	3	519	http://****
8119	email	mailinglist.host	t	2017-02-21 11:34:47.428-08	2017-02-21 11:34:47.428-08	3	520	http://****
8125	email	mailinglist.host	t	2017-02-21 11:39:46.291-08	2017-02-21 11:39:46.291-08	3	521	http://****
8131	email	mailinglist.host	t	2017-02-21 11:45:19.314-08	2017-02-21 11:45:19.314-08	3	522	http://****
8141	email	mailinglist.host	t	2017-02-21 12:04:49.157-08	2017-02-21 12:04:49.157-08	3	523	http://****
8147	email	mailinglist.host	t	2017-02-21 12:11:44.894-08	2017-02-21 12:11:44.894-08	3	524	http://****
8153	email	mailinglist.host	t	2017-02-21 12:16:59.184-08	2017-02-21 12:16:59.184-08	3	525	http://****
8087	email	collective.monthlyreport	t	2017-02-21 10:49:14.347-08	2017-02-21 10:49:14.347-08	3	515	http://****
8094	email	collective.monthlyreport	t	2017-02-21 11:02:21.57-08	2017-02-21 11:02:21.57-08	3	516	http://****
8099	email	collective.monthlyreport	t	2017-02-21 11:07:25.189-08	2017-02-21 11:07:25.189-08	3	517	http://****
8106	email	collective.monthlyreport	t	2017-02-21 11:13:03.397-08	2017-02-21 11:13:03.397-08	3	518	http://****
8112	email	collective.monthlyreport	t	2017-02-21 11:25:28.726-08	2017-02-21 11:25:28.726-08	3	519	http://****
8118	email	collective.monthlyreport	t	2017-02-21 11:34:47.023-08	2017-02-21 11:34:47.023-08	3	520	http://****
8124	email	collective.monthlyreport	t	2017-02-21 11:39:46.24-08	2017-02-21 11:39:46.24-08	3	521	http://****
8130	email	collective.monthlyreport	t	2017-02-21 11:45:19.171-08	2017-02-21 11:45:19.171-08	3	522	http://****
8140	email	collective.monthlyreport	t	2017-02-21 12:04:48.984-08	2017-02-21 12:04:48.984-08	3	523	http://****
8089	email	collective.transaction.created	t	2017-02-21 10:49:14.436-08	2017-02-21 10:49:14.436-08	3	515	http://****
8096	email	collective.transaction.created	t	2017-02-21 11:02:21.647-08	2017-02-21 11:02:21.647-08	3	516	http://****
8102	email	collective.transaction.created	t	2017-02-21 11:07:25.322-08	2017-02-21 11:07:25.322-08	3	517	http://****
8108	email	collective.transaction.created	t	2017-02-21 11:13:03.539-08	2017-02-21 11:13:03.539-08	3	518	http://****
8114	email	collective.transaction.created	t	2017-02-21 11:25:28.823-08	2017-02-21 11:25:28.823-08	3	519	http://****
8120	email	collective.transaction.created	t	2017-02-21 11:34:47.428-08	2017-02-21 11:34:47.428-08	3	520	http://****
8127	email	collective.transaction.created	t	2017-02-21 11:39:46.291-08	2017-02-21 11:39:46.291-08	3	521	http://****
8093	email	collective.expense.created	t	2017-02-21 11:02:21.57-08	2017-02-21 11:02:21.57-08	3	516	http://****
8100	email	collective.expense.created	t	2017-02-21 11:07:25.189-08	2017-02-21 11:07:25.189-08	3	517	http://****
8105	email	collective.expense.created	t	2017-02-21 11:13:03.396-08	2017-02-21 11:13:03.396-08	3	518	http://****
8111	email	collective.expense.created	t	2017-02-21 11:25:28.726-08	2017-02-21 11:25:28.726-08	3	519	http://****
8117	email	collective.expense.created	t	2017-02-21 11:34:47.023-08	2017-02-21 11:34:47.023-08	3	520	http://****
8123	email	collective.expense.created	t	2017-02-21 11:39:46.24-08	2017-02-21 11:39:46.24-08	3	521	http://****
8129	email	collective.expense.created	t	2017-02-21 11:45:19.17-08	2017-02-21 11:45:19.17-08	3	522	http://****
8139	email	collective.expense.created	t	2017-02-21 12:04:48.983-08	2017-02-21 12:04:48.983-08	3	523	http://****
8145	email	collective.expense.created	t	2017-02-21 12:11:44.769-08	2017-02-21 12:11:44.769-08	3	524	http://****
8151	email	collective.expense.created	t	2017-02-21 12:16:59.094-08	2017-02-21 12:16:59.094-08	3	525	http://****
16332	email	mailinglist.backers	t	2017-05-10 16:45:46.805-07	2017-05-10 16:45:46.805-07	4749	522	http://****
8426	email	mailinglist.backers	f	2017-02-27 16:25:20.393-08	2017-02-27 16:25:20.393-08	3301	522	http://****
12034	email	mailinglist.backers	t	2017-03-09 10:29:55.807-08	2017-03-09 10:29:55.807-08	3442	259	http://****
16214	email	mailinglist.backers	t	2017-05-08 22:59:17.564-07	2017-05-08 22:59:17.564-07	4711	517	http://****
13800	email	mailinglist.host	t	2017-04-03 09:22:46.049-07	2017-04-03 09:22:46.049-07	3	584	http://****
13799	email	collective.monthlyreport	t	2017-04-03 09:22:45.964-07	2017-04-03 09:22:45.964-07	3206	584	http://****
13801	email	collective.transaction.created	t	2017-04-03 09:22:46.049-07	2017-04-03 09:22:46.049-07	3	584	http://****
13798	email	collective.expense.created	t	2017-04-03 09:22:45.964-07	2017-04-03 09:22:45.964-07	3206	584	http://****
13802	email	collective.expense.created	t	2017-04-03 09:22:46.05-07	2017-04-03 09:22:46.05-07	3	584	http://****
13887	email	mailinglist.backers	t	2017-04-04 12:51:04.96-07	2017-04-04 12:51:04.96-07	3999	2	http://****
14398	email	mailinglist.backers	t	2017-04-10 18:09:50.696-07	2017-04-10 18:09:50.696-07	4153	13	http://****
14447	email	mailinglist.backers	t	2017-04-11 19:05:36.091-07	2017-04-11 19:05:36.091-07	4173	13	http://****
15657	email	mailinglist.backers	t	2017-04-30 18:40:31.704-07	2017-04-30 18:40:31.704-07	3419	516	http://****
15717	email	mailinglist.backers	t	2017-05-01 10:13:36.324-07	2017-05-01 10:13:36.324-07	4550	516	http://****
624	email	mailinglist.admins	t	2016-10-10 13:37:16.649-07	2016-10-10 13:37:16.649-07	7	10	http://****
625	email	mailinglist.admins	t	2016-10-10 13:37:16.65-07	2016-10-10 13:37:16.65-07	36	10	http://****
626	email	mailinglist.admins	t	2016-10-10 13:37:16.65-07	2016-10-10 13:37:16.65-07	37	10	http://****
627	email	mailinglist.admins	t	2016-10-10 13:37:16.651-07	2016-10-10 13:37:16.651-07	35	12	http://****
628	email	mailinglist.admins	t	2016-10-10 13:37:16.652-07	2016-10-10 13:37:16.652-07	33	13	http://****
629	email	mailinglist.admins	t	2016-10-10 13:37:16.652-07	2016-10-10 13:37:16.652-07	31	14	http://****
630	email	mailinglist.admins	t	2016-10-10 13:37:16.654-07	2016-10-10 13:37:16.654-07	32	14	http://****
633	email	mailinglist.admins	t	2016-10-10 13:37:16.654-07	2016-10-10 13:37:16.654-07	34	15	http://****
669	email	mailinglist.admins	t	2016-10-10 13:37:16.688-07	2016-10-10 13:37:16.688-07	141	47	http://****
671	email	mailinglist.admins	t	2016-10-10 13:37:16.69-07	2016-10-10 13:37:16.69-07	142	48	http://****
765	email	mailinglist.admins	t	2016-10-10 13:37:16.794-07	2016-10-10 13:37:16.794-07	72	3	http://****
770	email	mailinglist.admins	t	2016-10-10 13:37:16.795-07	2016-10-10 13:37:16.795-07	77	4	http://****
705	email	mailinglist.admins	t	2016-10-10 13:37:16.725-07	2016-10-10 13:37:16.725-07	28	2	http://****
763	email	mailinglist.admins	t	2016-10-10 13:37:16.793-07	2016-10-10 13:37:16.793-07	70	12	http://****
764	email	mailinglist.admins	t	2016-10-10 13:37:16.793-07	2016-10-10 13:37:16.793-07	71	3	http://****
769	email	mailinglist.admins	t	2016-10-10 13:37:16.795-07	2016-10-10 13:37:16.795-07	76	4	http://****
844	email	mailinglist.admins	t	2016-10-10 13:37:16.819-07	2016-10-10 13:37:16.819-07	170	59	http://****
761	email	mailinglist.admins	t	2016-10-10 13:37:16.792-07	2016-10-10 13:37:16.792-07	68	15	http://****
768	email	mailinglist.admins	t	2016-10-10 13:37:16.795-07	2016-10-10 13:37:16.795-07	75	4	http://****
760	email	mailinglist.admins	t	2016-10-10 13:37:16.792-07	2016-10-10 13:37:16.792-07	67	13	http://****
766	email	mailinglist.admins	t	2016-10-10 13:37:16.794-07	2016-10-10 13:37:16.794-07	73	3	http://****
771	email	mailinglist.admins	t	2016-10-10 13:37:16.796-07	2016-10-10 13:37:16.796-07	78	4	http://****
762	email	mailinglist.admins	t	2016-10-10 13:37:16.793-07	2016-10-10 13:37:16.793-07	69	12	http://****
767	email	mailinglist.admins	t	2016-10-10 13:37:16.794-07	2016-10-10 13:37:16.794-07	74	4	http://****
845	email	mailinglist.admins	t	2016-10-10 13:37:16.819-07	2016-10-10 13:37:16.819-07	171	59	http://****
1261	email	mailinglist.admins	t	2016-10-10 13:37:16.962-07	2016-10-10 13:37:16.962-07	577	4	http://****
1613	email	mailinglist.admins	t	2016-10-10 13:37:17.063-07	2016-10-10 13:37:17.063-07	898	195	http://****
1612	email	mailinglist.admins	t	2016-10-10 13:37:17.063-07	2016-10-10 13:37:17.063-07	897	195	http://****
1873	email	mailinglist.admins	t	2016-10-10 13:37:17.137-07	2016-10-10 13:37:17.137-07	1145	241	http://****
2052	email	mailinglist.admins	t	2016-10-10 13:37:17.196-07	2016-10-10 13:37:17.196-07	1307	261	http://****
2059	email	mailinglist.admins	t	2016-10-10 13:37:17.197-07	2016-10-10 13:37:17.197-07	1314	264	http://****
2064	email	mailinglist.admins	t	2016-10-10 13:37:17.198-07	2016-10-10 13:37:17.198-07	1318	268	http://****
2069	email	mailinglist.admins	t	2016-10-10 13:37:17.199-07	2016-10-10 13:37:17.199-07	1323	272	http://****
2075	email	mailinglist.admins	t	2016-10-10 13:37:17.201-07	2016-10-10 13:37:17.201-07	1329	276	http://****
2080	email	mailinglist.admins	t	2016-10-10 13:37:17.202-07	2016-10-10 13:37:17.202-07	1334	278	http://****
2085	email	mailinglist.admins	t	2016-10-10 13:37:17.203-07	2016-10-10 13:37:17.203-07	1339	282	http://****
2091	email	mailinglist.admins	t	2016-10-10 13:37:17.204-07	2016-10-10 13:37:17.204-07	1345	287	http://****
2096	email	mailinglist.admins	t	2016-10-10 13:37:17.205-07	2016-10-10 13:37:17.205-07	1350	289	http://****
2100	email	mailinglist.admins	t	2016-10-10 13:37:17.206-07	2016-10-10 13:37:17.206-07	1355	292	http://****
2104	email	mailinglist.admins	t	2016-10-10 13:37:17.207-07	2016-10-10 13:37:17.207-07	1358	294	http://****
2109	email	mailinglist.admins	t	2016-10-10 13:37:17.208-07	2016-10-10 13:37:17.208-07	1363	297	http://****
2114	email	mailinglist.admins	t	2016-10-10 13:37:17.209-07	2016-10-10 13:37:17.209-07	1368	299	http://****
2119	email	mailinglist.admins	t	2016-10-10 13:37:17.21-07	2016-10-10 13:37:17.21-07	1374	300	http://****
2124	email	mailinglist.admins	t	2016-10-10 13:37:17.212-07	2016-10-10 13:37:17.212-07	1377	301	http://****
2049	email	mailinglist.admins	t	2016-10-10 13:37:17.195-07	2016-10-10 13:37:17.195-07	1304	260	http://****
2055	email	mailinglist.admins	t	2016-10-10 13:37:17.196-07	2016-10-10 13:37:17.196-07	1310	262	http://****
2060	email	mailinglist.admins	t	2016-10-10 13:37:17.197-07	2016-10-10 13:37:17.197-07	1315	265	http://****
2065	email	mailinglist.admins	t	2016-10-10 13:37:17.198-07	2016-10-10 13:37:17.198-07	1319	269	http://****
2070	email	mailinglist.admins	t	2016-10-10 13:37:17.199-07	2016-10-10 13:37:17.199-07	1324	272	http://****
2076	email	mailinglist.admins	t	2016-10-10 13:37:17.201-07	2016-10-10 13:37:17.201-07	1330	276	http://****
2081	email	mailinglist.admins	t	2016-10-10 13:37:17.202-07	2016-10-10 13:37:17.202-07	1335	279	http://****
2086	email	mailinglist.admins	t	2016-10-10 13:37:17.203-07	2016-10-10 13:37:17.203-07	1340	283	http://****
2090	email	mailinglist.admins	t	2016-10-10 13:37:17.204-07	2016-10-10 13:37:17.204-07	1344	286	http://****
2093	email	mailinglist.admins	t	2016-10-10 13:37:17.204-07	2016-10-10 13:37:17.204-07	1347	288	http://****
2101	email	mailinglist.admins	t	2016-10-10 13:37:17.206-07	2016-10-10 13:37:17.206-07	1354	292	http://****
2107	email	mailinglist.admins	t	2016-10-10 13:37:17.208-07	2016-10-10 13:37:17.208-07	1360	295	http://****
2112	email	mailinglist.admins	t	2016-10-10 13:37:17.209-07	2016-10-10 13:37:17.209-07	1367	298	http://****
2117	email	mailinglist.admins	t	2016-10-10 13:37:17.21-07	2016-10-10 13:37:17.21-07	1371	300	http://****
2122	email	mailinglist.admins	t	2016-10-10 13:37:17.211-07	2016-10-10 13:37:17.211-07	1379	301	http://****
2050	email	mailinglist.admins	t	2016-10-10 13:37:17.195-07	2016-10-10 13:37:17.195-07	1305	260	http://****
2056	email	mailinglist.admins	t	2016-10-10 13:37:17.196-07	2016-10-10 13:37:17.196-07	1311	263	http://****
2061	email	mailinglist.admins	t	2016-10-10 13:37:17.197-07	2016-10-10 13:37:17.197-07	1316	266	http://****
2066	email	mailinglist.admins	t	2016-10-10 13:37:17.199-07	2016-10-10 13:37:17.199-07	1320	270	http://****
2071	email	mailinglist.admins	t	2016-10-10 13:37:17.2-07	2016-10-10 13:37:17.2-07	1325	273	http://****
2072	email	mailinglist.admins	t	2016-10-10 13:37:17.2-07	2016-10-10 13:37:17.2-07	1326	274	http://****
2077	email	mailinglist.admins	t	2016-10-10 13:37:17.201-07	2016-10-10 13:37:17.201-07	1331	277	http://****
2082	email	mailinglist.admins	t	2016-10-10 13:37:17.202-07	2016-10-10 13:37:17.202-07	1336	279	http://****
2087	email	mailinglist.admins	t	2016-10-10 13:37:17.203-07	2016-10-10 13:37:17.203-07	1341	284	http://****
2094	email	mailinglist.admins	t	2016-10-10 13:37:17.205-07	2016-10-10 13:37:17.205-07	1348	288	http://****
2099	email	mailinglist.admins	t	2016-10-10 13:37:17.206-07	2016-10-10 13:37:17.206-07	1353	291	http://****
2106	email	mailinglist.admins	t	2016-10-10 13:37:17.207-07	2016-10-10 13:37:17.207-07	1361	295	http://****
2111	email	mailinglist.admins	t	2016-10-10 13:37:17.208-07	2016-10-10 13:37:17.208-07	1365	298	http://****
2116	email	mailinglist.admins	t	2016-10-10 13:37:17.21-07	2016-10-10 13:37:17.21-07	1370	299	http://****
2121	email	mailinglist.admins	t	2016-10-10 13:37:17.211-07	2016-10-10 13:37:17.211-07	1375	301	http://****
2084	email	mailinglist.admins	t	2016-10-10 13:37:17.202-07	2016-10-10 13:37:17.202-07	1338	281	http://****
2089	email	mailinglist.admins	t	2016-10-10 13:37:17.204-07	2016-10-10 13:37:17.204-07	1343	286	http://****
2092	email	mailinglist.admins	t	2016-10-10 13:37:17.204-07	2016-10-10 13:37:17.204-07	1346	287	http://****
2097	email	mailinglist.admins	t	2016-10-10 13:37:17.205-07	2016-10-10 13:37:17.205-07	1351	290	http://****
2102	email	mailinglist.admins	t	2016-10-10 13:37:17.207-07	2016-10-10 13:37:17.207-07	1356	293	http://****
2103	email	mailinglist.admins	t	2016-10-10 13:37:17.207-07	2016-10-10 13:37:17.207-07	1357	294	http://****
2108	email	mailinglist.admins	t	2016-10-10 13:37:17.208-07	2016-10-10 13:37:17.208-07	1362	297	http://****
2113	email	mailinglist.admins	t	2016-10-10 13:37:17.209-07	2016-10-10 13:37:17.209-07	1366	298	http://****
2118	email	mailinglist.admins	t	2016-10-10 13:37:17.21-07	2016-10-10 13:37:17.21-07	1372	300	http://****
2123	email	mailinglist.admins	t	2016-10-10 13:37:17.211-07	2016-10-10 13:37:17.211-07	1376	301	http://****
8037	email	mailinglist.admins	t	2017-02-21 08:25:28.458-08	2017-02-21 08:25:28.458-08	3	510	http://****
8045	email	mailinglist.admins	t	2017-02-21 08:55:29.657-08	2017-02-21 08:55:29.657-08	3206	511	http://****
8061	email	mailinglist.admins	t	2017-02-21 10:11:30.774-08	2017-02-21 10:11:30.774-08	3	512	http://****
8071	email	mailinglist.admins	t	2017-02-21 10:35:34.525-08	2017-02-21 10:35:34.525-08	3	513	http://****
8085	email	mailinglist.admins	t	2017-02-21 10:49:14.347-08	2017-02-21 10:49:14.347-08	3	515	http://****
8092	email	mailinglist.admins	t	2017-02-21 11:02:21.569-08	2017-02-21 11:02:21.569-08	3	516	http://****
8098	email	mailinglist.admins	t	2017-02-21 11:07:25.188-08	2017-02-21 11:07:25.188-08	3	517	http://****
8104	email	mailinglist.admins	t	2017-02-21 11:13:03.396-08	2017-02-21 11:13:03.396-08	3	518	http://****
8110	email	mailinglist.admins	t	2017-02-21 11:25:28.726-08	2017-02-21 11:25:28.726-08	3	519	http://****
8116	email	mailinglist.admins	t	2017-02-21 11:34:47.023-08	2017-02-21 11:34:47.023-08	3	520	http://****
8122	email	mailinglist.admins	t	2017-02-21 11:39:46.24-08	2017-02-21 11:39:46.24-08	3	521	http://****
8128	email	mailinglist.admins	t	2017-02-21 11:45:19.17-08	2017-02-21 11:45:19.17-08	3	522	http://****
8138	email	mailinglist.admins	t	2017-02-21 12:04:48.982-08	2017-02-21 12:04:48.982-08	3	523	http://****
8144	email	mailinglist.admins	t	2017-02-21 12:11:44.768-08	2017-02-21 12:11:44.768-08	3	524	http://****
8150	email	mailinglist.admins	t	2017-02-21 12:16:59.093-08	2017-02-21 12:16:59.093-08	3	525	http://****
13797	email	mailinglist.admins	t	2017-04-03 09:22:45.963-07	2017-04-03 09:22:45.963-07	3206	584	http://****
99	email	collective.monthlyreport	t	2016-08-10 17:22:42.133-07	2016-08-10 17:22:42.133-07	7	10	http://****
100	email	collective.monthlyreport	t	2016-08-10 17:22:42.133-07	2016-08-10 17:22:42.133-07	36	10	http://****
101	email	collective.monthlyreport	t	2016-08-10 17:22:42.134-07	2016-08-10 17:22:42.134-07	37	10	http://****
102	email	collective.monthlyreport	t	2016-08-10 17:22:42.135-07	2016-08-10 17:22:42.135-07	35	12	http://****
103	email	collective.monthlyreport	t	2016-08-10 17:22:42.136-07	2016-08-10 17:22:42.136-07	33	13	http://****
104	email	collective.monthlyreport	t	2016-08-10 17:22:42.136-07	2016-08-10 17:22:42.136-07	31	14	http://****
105	email	collective.monthlyreport	t	2016-08-10 17:22:42.137-07	2016-08-10 17:22:42.137-07	32	14	http://****
106	email	collective.monthlyreport	t	2016-08-10 17:22:42.139-07	2016-08-10 17:22:42.139-07	34	15	http://****
115	email	collective.monthlyreport	t	2016-08-10 17:22:42.145-07	2016-08-10 17:22:42.145-07	141	47	http://****
116	email	collective.monthlyreport	t	2016-08-10 17:22:42.146-07	2016-08-10 17:22:42.146-07	142	48	http://****
124	email	collective.monthlyreport	t	2016-08-10 17:22:42.149-07	2016-08-10 17:22:42.149-07	28	2	http://****
148	email	collective.monthlyreport	t	2016-08-10 17:22:42.162-07	2016-08-10 17:22:42.162-07	67	13	http://****
149	email	collective.monthlyreport	t	2016-08-10 17:22:42.164-07	2016-08-10 17:22:42.164-07	68	15	http://****
150	email	collective.monthlyreport	t	2016-08-10 17:22:42.164-07	2016-08-10 17:22:42.164-07	69	12	http://****
151	email	collective.monthlyreport	t	2016-08-10 17:22:42.164-07	2016-08-10 17:22:42.164-07	70	12	http://****
152	email	collective.monthlyreport	t	2016-08-10 17:22:42.165-07	2016-08-10 17:22:42.165-07	71	3	http://****
153	email	collective.monthlyreport	t	2016-08-10 17:22:42.165-07	2016-08-10 17:22:42.165-07	72	3	http://****
154	email	collective.monthlyreport	t	2016-08-10 17:22:42.166-07	2016-08-10 17:22:42.166-07	73	3	http://****
155	email	collective.monthlyreport	t	2016-08-10 17:22:42.166-07	2016-08-10 17:22:42.166-07	74	4	http://****
156	email	collective.monthlyreport	t	2016-08-10 17:22:42.166-07	2016-08-10 17:22:42.166-07	75	4	http://****
157	email	collective.monthlyreport	t	2016-08-10 17:22:42.167-07	2016-08-10 17:22:42.167-07	76	4	http://****
158	email	collective.monthlyreport	t	2016-08-10 17:22:42.167-07	2016-08-10 17:22:42.167-07	77	4	http://****
159	email	collective.monthlyreport	t	2016-08-10 17:22:42.168-07	2016-08-10 17:22:42.168-07	78	4	http://****
194	email	collective.monthlyreport	t	2016-08-10 17:22:42.182-07	2016-08-10 17:22:42.182-07	170	59	http://****
335	email	collective.monthlyreport	t	2016-08-10 17:22:42.23-07	2016-08-10 17:22:42.23-07	577	4	http://****
472	email	collective.monthlyreport	t	2016-08-10 17:22:42.274-07	2016-08-10 17:22:42.274-07	898	195	http://****
471	email	collective.monthlyreport	t	2016-08-10 17:22:42.273-07	2016-08-10 17:22:42.273-07	897	195	http://****
195	email	collective.monthlyreport	t	2016-08-10 17:22:42.182-07	2016-08-10 17:22:42.182-07	171	59	http://****
2392	email	collective.monthlyreport	t	2016-11-06 16:37:19.104-08	2016-11-06 16:37:19.104-08	1303	259	http://****
2397	email	collective.monthlyreport	t	2016-11-06 16:37:19.104-08	2016-11-06 16:37:19.104-08	1309	262	http://****
2401	email	collective.monthlyreport	t	2016-11-06 16:37:19.105-08	2016-11-06 16:37:19.105-08	1313	264	http://****
2406	email	collective.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1317	268	http://****
2411	email	collective.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1322	271	http://****
2416	email	collective.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1327	275	http://****
2421	email	collective.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1332	277	http://****
2426	email	collective.monthlyreport	t	2016-11-06 16:37:19.108-08	2016-11-06 16:37:19.108-08	1337	280	http://****
2431	email	collective.monthlyreport	t	2016-11-06 16:37:19.109-08	2016-11-06 16:37:19.109-08	1342	285	http://****
2436	email	collective.monthlyreport	t	2016-11-06 16:37:19.109-08	2016-11-06 16:37:19.109-08	1347	288	http://****
2441	email	collective.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1352	290	http://****
2446	email	collective.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1357	294	http://****
2451	email	collective.monthlyreport	t	2016-11-06 16:37:19.111-08	2016-11-06 16:37:19.111-08	1362	297	http://****
2456	email	collective.monthlyreport	t	2016-11-06 16:37:19.112-08	2016-11-06 16:37:19.112-08	1366	298	http://****
2461	email	collective.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1372	300	http://****
2466	email	collective.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1376	301	http://****
2393	email	collective.monthlyreport	t	2016-11-06 16:37:19.104-08	2016-11-06 16:37:19.104-08	1304	260	http://****
2398	email	collective.monthlyreport	t	2016-11-06 16:37:19.105-08	2016-11-06 16:37:19.105-08	1310	262	http://****
2403	email	collective.monthlyreport	t	2016-11-06 16:37:19.105-08	2016-11-06 16:37:19.105-08	1315	265	http://****
2408	email	collective.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1319	269	http://****
2413	email	collective.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1324	272	http://****
2418	email	collective.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1329	276	http://****
2423	email	collective.monthlyreport	t	2016-11-06 16:37:19.108-08	2016-11-06 16:37:19.108-08	1334	278	http://****
2428	email	collective.monthlyreport	t	2016-11-06 16:37:19.108-08	2016-11-06 16:37:19.108-08	1339	282	http://****
2433	email	collective.monthlyreport	t	2016-11-06 16:37:19.109-08	2016-11-06 16:37:19.109-08	1344	286	http://****
2438	email	collective.monthlyreport	t	2016-11-06 16:37:19.109-08	2016-11-06 16:37:19.109-08	1349	289	http://****
2442	email	collective.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1353	291	http://****
2447	email	collective.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1358	294	http://****
2452	email	collective.monthlyreport	t	2016-11-06 16:37:19.112-08	2016-11-06 16:37:19.112-08	1363	297	http://****
2457	email	collective.monthlyreport	t	2016-11-06 16:37:19.112-08	2016-11-06 16:37:19.112-08	1368	299	http://****
2462	email	collective.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1374	300	http://****
2467	email	collective.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1377	301	http://****
2394	email	collective.monthlyreport	t	2016-11-06 16:37:19.104-08	2016-11-06 16:37:19.104-08	1305	260	http://****
2399	email	collective.monthlyreport	t	2016-11-06 16:37:19.105-08	2016-11-06 16:37:19.105-08	1311	263	http://****
2405	email	collective.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1314	267	http://****
2409	email	collective.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1320	270	http://****
2414	email	collective.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1325	273	http://****
2419	email	collective.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1330	276	http://****
2424	email	collective.monthlyreport	t	2016-11-06 16:37:19.108-08	2016-11-06 16:37:19.108-08	1335	279	http://****
2429	email	collective.monthlyreport	t	2016-11-06 16:37:19.108-08	2016-11-06 16:37:19.108-08	1340	283	http://****
2435	email	collective.monthlyreport	t	2016-11-06 16:37:19.109-08	2016-11-06 16:37:19.109-08	1346	287	http://****
2440	email	collective.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1351	290	http://****
2444	email	collective.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1355	292	http://****
2449	email	collective.monthlyreport	t	2016-11-06 16:37:19.111-08	2016-11-06 16:37:19.111-08	1361	295	http://****
2455	email	collective.monthlyreport	t	2016-11-06 16:37:19.112-08	2016-11-06 16:37:19.112-08	1367	298	http://****
2460	email	collective.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1371	300	http://****
2465	email	collective.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1379	301	http://****
2395	email	collective.monthlyreport	t	2016-11-06 16:37:19.104-08	2016-11-06 16:37:19.104-08	1307	261	http://****
2400	email	collective.monthlyreport	t	2016-11-06 16:37:19.105-08	2016-11-06 16:37:19.105-08	1312	263	http://****
2404	email	collective.monthlyreport	t	2016-11-06 16:37:19.105-08	2016-11-06 16:37:19.105-08	1316	266	http://****
2410	email	collective.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1321	270	http://****
2415	email	collective.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1326	274	http://****
2420	email	collective.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1331	277	http://****
2425	email	collective.monthlyreport	t	2016-11-06 16:37:19.108-08	2016-11-06 16:37:19.108-08	1336	279	http://****
2430	email	collective.monthlyreport	t	2016-11-06 16:37:19.108-08	2016-11-06 16:37:19.108-08	1341	284	http://****
2434	email	collective.monthlyreport	t	2016-11-06 16:37:19.109-08	2016-11-06 16:37:19.109-08	1345	287	http://****
2439	email	collective.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1350	289	http://****
2445	email	collective.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1356	293	http://****
2450	email	collective.monthlyreport	t	2016-11-06 16:37:19.111-08	2016-11-06 16:37:19.111-08	1360	295	http://****
2454	email	collective.monthlyreport	t	2016-11-06 16:37:19.112-08	2016-11-06 16:37:19.112-08	1365	298	http://****
2459	email	collective.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1370	299	http://****
2464	email	collective.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1375	301	http://****
2348	email	collective.monthlyreport	t	2016-11-06 16:37:19.095-08	2016-11-06 16:37:19.095-08	1145	241	http://****
2396	email	collective.monthlyreport	t	2016-11-06 16:37:19.104-08	2016-11-06 16:37:19.104-08	1308	261	http://****
2402	email	collective.monthlyreport	t	2016-11-06 16:37:19.105-08	2016-11-06 16:37:19.105-08	1314	264	http://****
2407	email	collective.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1318	268	http://****
2412	email	collective.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1323	272	http://****
2417	email	collective.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1328	275	http://****
2422	email	collective.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1333	278	http://****
2427	email	collective.monthlyreport	t	2016-11-06 16:37:19.108-08	2016-11-06 16:37:19.108-08	1338	281	http://****
2432	email	collective.monthlyreport	t	2016-11-06 16:37:19.109-08	2016-11-06 16:37:19.109-08	1343	286	http://****
2437	email	collective.monthlyreport	t	2016-11-06 16:37:19.109-08	2016-11-06 16:37:19.109-08	1348	288	http://****
2443	email	collective.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1354	292	http://****
2448	email	collective.monthlyreport	t	2016-11-06 16:37:19.111-08	2016-11-06 16:37:19.111-08	1359	295	http://****
2453	email	collective.monthlyreport	t	2016-11-06 16:37:19.112-08	2016-11-06 16:37:19.112-08	1364	297	http://****
2458	email	collective.monthlyreport	t	2016-11-06 16:37:19.112-08	2016-11-06 16:37:19.112-08	1369	299	http://****
2463	email	collective.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1373	300	http://****
2468	email	collective.monthlyreport	t	2016-11-06 16:37:19.114-08	2016-11-06 16:37:19.114-08	1378	301	http://****
8073	email	collective.monthlyreport	t	2017-02-21 10:35:34.526-08	2017-02-21 10:35:34.526-08	3	513	http://****
8146	email	collective.monthlyreport	t	2017-02-21 12:11:44.769-08	2017-02-21 12:11:44.769-08	3	524	http://****
8152	email	collective.monthlyreport	t	2017-02-21 12:16:59.094-08	2017-02-21 12:16:59.094-08	3	525	http://****
70	email	collective.transaction.created	t	2016-07-06 17:00:00-07	2016-07-06 17:00:00-07	577	4	http://****
39	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	142	48	http://****
40	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	28	2	http://****
41	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	33	13	http://****
42	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	67	13	http://****
43	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	71	3	http://****
44	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	72	3	http://****
45	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	73	3	http://****
46	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	170	59	http://****
47	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	171	59	http://****
48	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	35	12	http://****
49	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	69	12	http://****
50	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	70	12	http://****
8132	email	collective.transaction.created	t	2017-02-21 11:45:19.315-08	2017-02-21 11:45:19.315-08	3	522	http://****
8142	email	collective.transaction.created	t	2017-02-21 12:04:49.157-08	2017-02-21 12:04:49.157-08	3	523	http://****
8148	email	collective.transaction.created	t	2017-02-21 12:11:44.895-08	2017-02-21 12:11:44.895-08	3	524	http://****
8154	email	collective.transaction.created	t	2017-02-21 12:16:59.185-08	2017-02-21 12:16:59.185-08	3	525	http://****
2917	email	collective.expense.created	t	2016-11-28 14:28:52.443-08	2017-01-10 16:00:00-08	3	298	http://****
2922	email	collective.expense.created	t	2016-11-28 14:28:52.445-08	2017-01-10 16:00:00-08	3	292	http://****
2927	email	collective.expense.created	t	2016-11-28 14:28:52.446-08	2017-01-10 16:00:00-08	3	287	http://****
2932	email	collective.expense.created	t	2016-11-28 14:28:52.447-08	2017-01-10 16:00:00-08	3	282	http://****
2937	email	collective.expense.created	t	2016-11-28 14:28:52.448-08	2017-01-10 16:00:00-08	3	277	http://****
2942	email	collective.expense.created	t	2016-11-28 14:28:52.449-08	2017-01-10 16:00:00-08	3	272	http://****
2947	email	collective.expense.created	t	2016-11-28 14:28:52.45-08	2017-01-10 16:00:00-08	3	267	http://****
2953	email	collective.expense.created	t	2016-11-28 14:28:52.451-08	2017-01-10 16:00:00-08	3	261	http://****
2897	email	collective.expense.created	t	2016-11-28 14:28:52.436-08	2017-01-10 16:00:00-08	3	241	http://****
2915	email	collective.expense.created	t	2016-11-28 14:28:52.443-08	2017-01-10 16:00:00-08	3	300	http://****
2920	email	collective.expense.created	t	2016-11-28 14:28:52.444-08	2017-01-10 16:00:00-08	3	294	http://****
2925	email	collective.expense.created	t	2016-11-28 14:28:52.445-08	2017-01-10 16:00:00-08	3	289	http://****
2929	email	collective.expense.created	t	2016-11-28 14:28:52.446-08	2017-01-10 16:00:00-08	3	285	http://****
2935	email	collective.expense.created	t	2016-11-28 14:28:52.447-08	2017-01-10 16:00:00-08	3	279	http://****
2939	email	collective.expense.created	t	2016-11-28 14:28:52.448-08	2017-01-10 16:00:00-08	3	275	http://****
2945	email	collective.expense.created	t	2016-11-28 14:28:52.449-08	2017-01-10 16:00:00-08	3	269	http://****
2950	email	collective.expense.created	t	2016-11-28 14:28:52.45-08	2017-01-10 16:00:00-08	3	264	http://****
2955	email	collective.expense.created	t	2016-11-28 14:28:52.451-08	2017-01-10 16:00:00-08	3	259	http://****
2916	email	collective.expense.created	t	2016-11-28 14:28:52.443-08	2017-01-10 16:00:00-08	3	299	http://****
2921	email	collective.expense.created	t	2016-11-28 14:28:52.445-08	2017-01-10 16:00:00-08	3	293	http://****
2924	email	collective.expense.created	t	2016-11-28 14:28:52.445-08	2017-01-10 16:00:00-08	3	290	http://****
2930	email	collective.expense.created	t	2016-11-28 14:28:52.446-08	2017-01-10 16:00:00-08	3	284	http://****
2934	email	collective.expense.created	t	2016-11-28 14:28:52.447-08	2017-01-10 16:00:00-08	3	280	http://****
2940	email	collective.expense.created	t	2016-11-28 14:28:52.448-08	2017-01-10 16:00:00-08	3	274	http://****
2944	email	collective.expense.created	t	2016-11-28 14:28:52.449-08	2017-01-10 16:00:00-08	3	270	http://****
2949	email	collective.expense.created	t	2016-11-28 14:28:52.45-08	2017-01-10 16:00:00-08	3	265	http://****
2914	email	collective.expense.created	t	2016-11-28 14:28:52.443-08	2017-01-10 16:00:00-08	3	301	http://****
2919	email	collective.expense.created	t	2016-11-28 14:28:52.444-08	2017-01-10 16:00:00-08	3	295	http://****
2926	email	collective.expense.created	t	2016-11-28 14:28:52.445-08	2017-01-10 16:00:00-08	3	288	http://****
2931	email	collective.expense.created	t	2016-11-28 14:28:52.446-08	2017-01-10 16:00:00-08	3	283	http://****
2936	email	collective.expense.created	t	2016-11-28 14:28:52.447-08	2017-01-10 16:00:00-08	3	278	http://****
2941	email	collective.expense.created	t	2016-11-28 14:28:52.448-08	2017-01-10 16:00:00-08	3	273	http://****
2946	email	collective.expense.created	t	2016-11-28 14:28:52.449-08	2017-01-10 16:00:00-08	3	268	http://****
2951	email	collective.expense.created	t	2016-11-28 14:28:52.45-08	2017-01-10 16:00:00-08	3	263	http://****
2701	email	collective.expense.created	t	2016-11-28 14:28:52.359-08	2017-01-10 16:00:00-08	3	10	http://****
2703	email	collective.expense.created	t	2016-11-28 14:28:52.36-08	2017-01-10 16:00:00-08	3	12	http://****
2704	email	collective.expense.created	t	2016-11-28 14:28:52.361-08	2017-01-10 16:00:00-08	3	13	http://****
2705	email	collective.expense.created	t	2016-11-28 14:28:52.362-08	2017-01-10 16:00:00-08	3	14	http://****
2706	email	collective.expense.created	t	2016-11-28 14:28:52.362-08	2017-01-10 16:00:00-08	3	15	http://****
2708	email	collective.expense.created	t	2016-11-28 14:28:52.365-08	2017-01-10 16:00:00-08	3	47	http://****
2709	email	collective.expense.created	t	2016-11-28 14:28:52.368-08	2017-01-10 16:00:00-08	3	48	http://****
2712	email	collective.expense.created	t	2016-11-28 14:28:52.373-08	2017-01-10 16:00:00-08	3	51	http://****
2723	email	collective.expense.created	t	2016-11-28 14:28:52.376-08	2017-01-10 16:00:00-08	3	2	http://****
2724	email	collective.expense.created	t	2016-11-28 14:28:52.377-08	2017-01-10 16:00:00-08	3	3	http://****
2725	email	collective.expense.created	t	2016-11-28 14:28:52.377-08	2017-01-10 16:00:00-08	3	4	http://****
2751	email	collective.expense.created	t	2016-11-28 14:28:52.388-08	2017-01-10 16:00:00-08	3	59	http://****
2954	email	collective.expense.created	t	2016-11-28 14:28:52.451-08	2017-01-10 16:00:00-08	3	260	http://****
2851	email	collective.expense.created	t	2016-11-28 14:28:52.427-08	2017-01-10 16:00:00-08	3	195	http://****
2918	email	collective.expense.created	t	2016-11-28 14:28:52.444-08	2017-01-10 16:00:00-08	3	297	http://****
2923	email	collective.expense.created	t	2016-11-28 14:28:52.445-08	2017-01-10 16:00:00-08	3	291	http://****
2928	email	collective.expense.created	t	2016-11-28 14:28:52.446-08	2017-01-10 16:00:00-08	3	286	http://****
2933	email	collective.expense.created	t	2016-11-28 14:28:52.447-08	2017-01-10 16:00:00-08	3	281	http://****
2938	email	collective.expense.created	t	2016-11-28 14:28:52.448-08	2017-01-10 16:00:00-08	3	276	http://****
2943	email	collective.expense.created	t	2016-11-28 14:28:52.449-08	2017-01-10 16:00:00-08	3	271	http://****
2948	email	collective.expense.created	t	2016-11-28 14:28:52.45-08	2017-01-10 16:00:00-08	3	266	http://****
2952	email	collective.expense.created	t	2016-11-28 14:28:52.451-08	2017-01-10 16:00:00-08	3	262	http://****
5766	email	collective.expense.created	f	2016-12-28 16:13:56.341-08	2017-01-17 16:00:00-08	1329	276	http://****
5780	email	collective.expense.created	f	2016-12-28 16:13:56.343-08	2017-01-17 16:00:00-08	1351	290	http://****
5770	email	collective.expense.created	f	2016-12-28 16:13:56.342-08	2017-01-17 16:00:00-08	1337	280	http://****
5759	email	collective.expense.created	f	2016-12-28 16:13:56.34-08	2017-01-17 16:00:00-08	1317	268	http://****
5760	email	collective.expense.created	f	2016-12-28 16:13:56.34-08	2017-01-17 16:00:00-08	1319	269	http://****
5788	email	collective.expense.created	f	2016-12-28 16:13:56.344-08	2017-01-17 16:00:00-08	1365	298	http://****
5781	email	collective.expense.created	f	2016-12-28 16:13:56.343-08	2017-01-17 16:00:00-08	1353	291	http://****
5765	email	collective.expense.created	f	2016-12-28 16:13:56.341-08	2017-01-17 16:00:00-08	1325	273	http://****
5782	email	collective.expense.created	f	2016-12-28 16:13:56.343-08	2017-01-17 16:00:00-08	1354	292	http://****
5768	email	collective.expense.created	f	2016-12-28 16:13:56.341-08	2017-01-17 16:00:00-08	1331	277	http://****
5557	email	collective.expense.created	f	2016-12-28 16:13:56.267-08	2017-01-17 16:00:00-08	33	13	http://****
5774	email	collective.expense.created	f	2016-12-28 16:13:56.342-08	2017-01-17 16:00:00-08	1341	284	http://****
5751	email	collective.expense.created	f	2016-12-28 16:13:56.339-08	2017-01-17 16:00:00-08	1303	259	http://****
5589	email	collective.expense.created	f	2016-12-28 16:13:56.281-08	2017-01-17 16:00:00-08	142	48	http://****
5786	email	collective.expense.created	f	2016-12-28 16:13:56.344-08	2017-01-17 16:00:00-08	1357	294	http://****
5776	email	collective.expense.created	f	2016-12-28 16:13:56.343-08	2017-01-17 16:00:00-08	1343	286	http://****
5771	email	collective.expense.created	f	2016-12-28 16:13:56.342-08	2017-01-17 16:00:00-08	1338	281	http://****
5588	email	collective.expense.created	f	2016-12-28 16:13:56.281-08	2017-01-17 16:00:00-08	141	47	http://****
5555	email	collective.expense.created	f	2016-12-28 16:13:56.265-08	2017-01-17 16:00:00-08	7	10	http://****
5757	email	collective.expense.created	f	2016-12-28 16:13:56.34-08	2017-01-17 16:00:00-08	1316	266	http://****
5763	email	collective.expense.created	f	2016-12-28 16:13:56.341-08	2017-01-17 16:00:00-08	1326	274	http://****
5764	email	collective.expense.created	f	2016-12-28 16:13:56.341-08	2017-01-17 16:00:00-08	1327	275	http://****
5779	email	collective.expense.created	f	2016-12-28 16:13:56.343-08	2017-01-17 16:00:00-08	1349	289	http://****
5758	email	collective.expense.created	f	2016-12-28 16:13:56.34-08	2017-01-17 16:00:00-08	1314	267	http://****
5689	email	collective.expense.created	f	2016-12-28 16:13:56.324-08	2017-01-17 16:00:00-08	897	195	http://****
5733	email	collective.expense.created	f	2016-12-28 16:13:56.333-08	2017-01-17 16:00:00-08	1145	241	http://****
5762	email	collective.expense.created	f	2016-12-28 16:13:56.341-08	2017-01-17 16:00:00-08	1323	272	http://****
5783	email	collective.expense.created	f	2016-12-28 16:13:56.344-08	2017-01-17 16:00:00-08	1356	293	http://****
5785	email	collective.expense.created	f	2016-12-28 16:13:56.344-08	2017-01-17 16:00:00-08	1362	297	http://****
5756	email	collective.expense.created	f	2016-12-28 16:13:56.34-08	2017-01-17 16:00:00-08	1315	265	http://****
5754	email	collective.expense.created	f	2016-12-28 16:13:56.339-08	2017-01-17 16:00:00-08	1309	262	http://****
5755	email	collective.expense.created	f	2016-12-28 16:13:56.339-08	2017-01-17 16:00:00-08	1313	264	http://****
5772	email	collective.expense.created	f	2016-12-28 16:13:56.342-08	2017-01-17 16:00:00-08	1339	282	http://****
5558	email	collective.expense.created	f	2016-12-28 16:13:56.268-08	2017-01-17 16:00:00-08	34	15	http://****
5789	email	collective.expense.created	f	2016-12-28 16:13:56.345-08	2017-01-17 16:00:00-08	1371	300	http://****
5769	email	collective.expense.created	f	2016-12-28 16:13:56.342-08	2017-01-17 16:00:00-08	1335	279	http://****
5777	email	collective.expense.created	f	2016-12-28 16:13:56.343-08	2017-01-17 16:00:00-08	1345	287	http://****
5556	email	collective.expense.created	f	2016-12-28 16:13:56.266-08	2017-01-17 16:00:00-08	35	12	http://****
5775	email	collective.expense.created	f	2016-12-28 16:13:56.342-08	2017-01-17 16:00:00-08	1342	285	http://****
5596	email	collective.expense.created	f	2016-12-28 16:13:56.284-08	2017-01-17 16:00:00-08	170	59	http://****
5753	email	collective.expense.created	f	2016-12-28 16:13:56.339-08	2017-01-17 16:00:00-08	1307	261	http://****
5570	email	collective.expense.created	f	2016-12-28 16:13:56.274-08	2017-01-17 16:00:00-08	71	3	http://****
5790	email	collective.expense.created	f	2016-12-28 16:13:56.345-08	2017-01-17 16:00:00-08	1375	301	http://****
5571	email	collective.expense.created	f	2016-12-28 16:13:56.275-08	2017-01-17 16:00:00-08	74	4	http://****
5778	email	collective.expense.created	f	2016-12-28 16:13:56.343-08	2017-01-17 16:00:00-08	1347	288	http://****
5773	email	collective.expense.created	f	2016-12-28 16:13:56.342-08	2017-01-17 16:00:00-08	1340	283	http://****
5784	email	collective.expense.created	f	2016-12-28 16:13:56.344-08	2017-01-17 16:00:00-08	1359	295	http://****
5761	email	collective.expense.created	f	2016-12-28 16:13:56.34-08	2017-01-17 16:00:00-08	1320	270	http://****
5752	email	collective.expense.created	f	2016-12-28 16:13:56.339-08	2017-01-17 16:00:00-08	1304	260	http://****
8062	email	collective.expense.created	t	2017-02-21 10:11:30.775-08	2017-02-21 10:11:30.775-08	3	512	http://****
8072	email	collective.expense.created	t	2017-02-21 10:35:34.525-08	2017-02-21 10:35:34.525-08	3	513	http://****
569	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	262	http://****
570	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	269	http://****
571	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	263	http://****
572	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	270	http://****
573	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	264	http://****
574	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	265	http://****
575	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	15	http://****
576	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	259	http://****
577	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	266	http://****
578	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	271	http://****
579	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	260	http://****
580	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	267	http://****
581	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	272	http://****
582	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	273	http://****
583	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	14	http://****
584	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	274	http://****
585	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	275	http://****
586	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	276	http://****
587	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	277	http://****
588	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	279	http://****
589	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	280	http://****
590	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	281	http://****
591	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	282	http://****
592	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	283	http://****
593	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	284	http://****
594	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	285	http://****
595	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	286	http://****
596	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	287	http://****
597	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	195	http://****
799	email	mailinglist.backers	t	2016-10-10 13:37:16.803-07	2016-10-10 13:37:16.803-07	\N	2	http://****
15002	email	mailinglist.backers	t	2017-04-20 03:17:23.322-07	2017-04-20 03:17:23.322-07	\N	59	http://****
7610	email	mailinglist.backers	t	2017-02-10 08:47:34.942-08	2017-02-10 08:47:34.942-08	\N	15	http://****
987	email	mailinglist.backers	t	2016-10-10 13:37:16.883-07	2016-10-10 13:37:16.883-07	\N	13	http://****
912	email	mailinglist.backers	t	2016-10-10 13:37:16.84-07	2016-10-10 13:37:16.84-07	\N	2	http://****
990	email	mailinglist.backers	t	2016-10-10 13:37:16.883-07	2016-10-10 13:37:16.883-07	\N	13	http://****
865	email	mailinglist.backers	t	2016-10-10 13:37:16.826-07	2016-10-10 13:37:16.826-07	\N	2	http://****
1003	email	mailinglist.backers	t	2016-10-10 13:37:16.887-07	2016-10-10 13:37:16.887-07	\N	2	http://****
2045	email	mailinglist.backers	t	2016-10-10 13:37:17.194-07	2016-10-10 13:37:17.194-07	\N	2	http://****
1985	email	mailinglist.backers	t	2016-10-10 13:37:17.168-07	2016-10-10 13:37:17.168-07	\N	59	http://****
1911	email	mailinglist.backers	t	2016-10-10 13:37:17.146-07	2016-10-10 13:37:17.146-07	\N	2	http://****
1128	email	mailinglist.backers	t	2016-10-10 13:37:16.931-07	2016-10-10 13:37:16.931-07	\N	2	http://****
1805	email	mailinglist.backers	t	2016-10-10 13:37:17.119-07	2016-10-10 13:37:17.119-07	\N	2	http://****
2597	email	mailinglist.backers	t	2016-11-17 09:43:31.222-08	2016-11-17 09:43:31.222-08	\N	59	http://****
3000	email	mailinglist.backers	t	2016-11-29 02:03:23.975-08	2016-11-29 02:03:23.975-08	\N	301	http://****
2645	email	mailinglist.backers	t	2016-11-22 07:22:40.421-08	2016-11-22 07:22:40.421-08	\N	59	http://****
1594	email	mailinglist.backers	t	2016-10-10 13:37:17.04-07	2016-10-10 13:37:17.04-07	\N	2	http://****
1595	email	mailinglist.backers	t	2016-10-10 13:37:17.04-07	2016-10-10 13:37:17.04-07	\N	2	http://****
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         4009.dat                                                                                            0000600 0004000 0002000 00000134226 13212311737 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        102	2	13	USD	100	Recurring subscription	2	2016-04-01 07:32:16.704-07	2016-04-01 07:32:16.704-07	2016-04-07 07:32:16.691-07	\N	\N	\N	\N	1729	\N	1
97	30	14	USD	100	Recurring subscription	6	2016-04-01 07:32:16.68-07	2016-04-01 07:32:16.68-07	2016-04-07 07:32:16.68-07	\N	\N	\N	\N	2385	\N	1
122	7	10	MXN	100	Recurring subscription	16	2016-04-01 07:32:16.774-07	2016-04-01 07:32:16.774-07	2016-04-01 07:32:16.774-07	\N	\N	\N	\N	5788	\N	1
98	80	10	MXN	500	Recurring subscription	4	2016-04-01 07:32:16.686-07	2016-04-01 07:32:16.686-07	2016-04-07 07:32:16.686-07	\N	\N	\N	\N	4356	\N	1
6212	9296	12	USD	2500	Donation to Women Who Code Atlanta	\N	2017-11-28 13:30:13.844-08	2017-11-28 13:30:22.024-08	\N	8646	2017-11-28 13:30:22.024-08	\N	\N	10660	So excited to use this groundbreaking  platform, Open Collective, for the first time to support these daring women in tech. Happy Giving Tuesday!	1
686	1244	4	USD	0	Monthly donation to wwcode san francisco	530	2016-09-20 13:58:49.811-07	2016-10-14 13:08:32.409-07	\N	773	2016-09-20 13:58:51.909-07	\N	\N	4301	\N	1
6107	9152	430	USD	1000	Donation to WWCode Kyiv	\N	2017-11-21 02:46:25.428-08	2017-11-21 02:46:32.102-08	\N	8533	2017-11-21 02:46:32.101-08	\N	\N	10465	\N	1
5650	3	521	USD	2928	Director TShirt Surplus	\N	2017-10-25 09:50:40.001-07	2017-11-02 14:23:27.343-07	\N	\N	2017-10-25 09:50:40.085-07	******	\N	9804	\N	\N
6323	171	59	USD	2500	Donation to WWCode Portland (Backers)	\N	2017-12-05 23:43:01.852-08	2017-12-05 23:43:08.067-08	\N	\N	2017-12-05 23:43:08.066-08	\N	662	6057	\N	1
5991	3	517	USD	70852	Ticket Sales for Hackathon 10/27 - 11/13	\N	2017-11-14 15:18:07.73-08	2017-11-14 15:18:07.794-08	\N	\N	2017-11-14 15:18:07.793-08	******	\N	9814	\N	\N
5992	3	59	USD	75000	Mozilla Sponsorship for PDX IoT Hackathon	\N	2017-11-14 15:27:45.561-08	2017-11-14 15:27:45.645-08	\N	\N	2017-11-14 15:27:45.645-08	******	\N	9814	\N	\N
5993	3	59	USD	37500	GitLab Diversity Sponsorship for PDX IoT Hackathon 	\N	2017-11-14 15:28:31.351-08	2017-11-14 15:28:31.424-08	\N	\N	2017-11-14 15:28:31.424-08	******	\N	9814	\N	\N
3202	3	430	USD	1200	Transferwise fees	\N	2017-06-13 13:02:53.07-07	2017-06-13 13:02:53.176-07	\N	\N	2017-06-13 13:02:53.175-07	******	\N	9804	\N	1
3724	3	51	USD	7500	GitHub and WWCode Atlanta	\N	2017-07-17 10:58:35.255-07	2017-07-17 10:58:35.349-07	\N	\N	2017-07-17 10:58:35.255-07	******	132	9804	\N	1
2508	3	14	USD	1480	PayPal fees Google I/O Travel Stipend	\N	2017-04-18 17:39:23.089-07	2017-04-18 17:39:23.171-07	\N	\N	2017-04-18 17:39:23.17-07	******	\N	9804	\N	1
2694	3	51	USD	30000	User Testing and WWCode ATL	\N	2017-05-03 10:33:13.357-07	2017-05-03 10:33:13.7-07	\N	\N	2017-05-03 10:33:13.357-07	******	132	9804	\N	1
2713	3	430	USD	1200	Western Union Fees for Google I/O grant	\N	2017-05-04 11:58:24.782-07	2017-05-04 11:58:24.948-07	\N	\N	2017-05-04 11:58:24.947-07	******	\N	9804	\N	1
2505	3	12	USD	1198	PayPal Fees Google I/O Ticket	\N	2017-04-18 17:19:14.259-07	2017-04-18 17:19:14.339-07	\N	\N	2017-04-18 17:19:14.339-07	******	\N	9804	\N	1
3910	3	51	USD	120000	Turner Donation for WWCode ATL - We Rise 	\N	2017-08-01 15:56:07.868-07	2017-08-01 15:56:08.027-07	\N	\N	2017-08-01 15:56:07.868-07	******	132	9804	\N	1
4118	3	510	USD	30000	Thanks Capital One iOS summit	\N	2017-08-18 14:08:39.817-07	2017-08-18 14:08:39.892-07	\N	\N	2017-08-18 14:08:39.892-07	******	\N	9804	\N	1
4340	3	51	USD	500000	Sony	\N	2017-09-05 16:52:24.96-07	2017-09-05 16:52:25.094-07	\N	\N	2017-09-05 16:52:24.96-07	******	132	9804	\N	1
83	7	10	MXN	100	Monthly donation to wwcode mexico city	16	2016-04-01 07:32:16.636-07	2016-10-14 13:08:31.996-07	\N	\N	\N	\N	\N	5788	\N	1
3530	3	51	USD	30000	Instrument and WWCode Atlanta	\N	2017-07-05 14:33:39.708-07	2017-07-05 14:33:39.787-07	\N	\N	2017-07-05 14:33:39.708-07	******	132	9804	\N	1
5997	3	195	USD	50000	Budget Bonus from October Martech Event 	\N	2017-11-15 08:48:40.577-08	2017-11-15 08:48:40.632-08	\N	\N	2017-11-15 08:48:40.632-08	******	\N	9814	\N	\N
3528	3	51	USD	90000	Salesforce WWCode ATL 	\N	2017-07-05 14:32:15.56-07	2017-07-05 14:32:15.638-07	\N	\N	2017-07-05 14:32:15.56-07	******	132	9804	\N	1
4938	3	525	USD	6188	VMWare Donation 	\N	2017-10-03 21:10:51.435-07	2017-10-03 21:10:51.655-07	\N	\N	2017-10-03 21:10:51.652-07	******	\N	9804	\N	1
4274	3	282	MXN	355406	Q1 Activity Budget Bonus	\N	2017-08-31 17:45:00.127-07	2017-08-31 17:45:00.291-07	\N	\N	2017-08-31 17:45:00.29-07	******	\N	9804	\N	1
70	30	13	USD	100	Monthly donation to wwcode washington dc	3	2016-04-01 07:32:16.57-07	2017-02-02 07:06:21.68-08	\N	44	\N	\N	\N	2385	\N	1
361	642	48	USD	100	Donation to WWCode Twin Cities	\N	2016-06-21 09:06:05.176-07	2017-02-02 07:06:18.855-08	\N	432	\N	\N	\N	3533	\N	1
320	8	3	USD	100	Monthly donation to wwcode new york	224	2016-06-09 10:28:13.93-07	2017-02-02 07:06:18.32-08	\N	385	\N	\N	\N	8638	\N	1
3338	3	51	USD	15000	Bluefletch WWCode ATL We Rise sponsorship 	\N	2017-06-24 07:07:53.794-07	2017-06-24 07:07:53.908-07	\N	\N	2017-06-24 07:07:53.794-07	******	132	9804	\N	1
3850	3	47	USD	2358	PayPal Fees 	\N	2017-07-28 11:29:05.195-07	2017-07-28 11:29:05.29-07	\N	\N	2017-07-28 11:29:05.289-07	******	\N	9804	\N	1
5999	3	517	USD	448650	Accenture Sponsorship for Manila  Hackathon	\N	2017-11-15 09:11:48.925-08	2017-11-15 09:11:49.085-08	\N	\N	2017-11-15 09:11:49.084-08	******	\N	9814	\N	\N
386	686	2	USD	1000	Monthly donation to wwcode austin	286	2016-07-01 15:31:45.982-07	2017-02-02 07:06:19.11-08	\N	461	\N	\N	\N	6616	\N	1
6000	3	48	USD	62010	Ticket Sales from Tech Diversity	\N	2017-11-15 11:52:45-08	2017-11-15 11:52:45.1-08	\N	\N	2017-11-15 11:52:45.099-08	******	\N	9814	\N	\N
65	2	10	USD	500	Monthly donation to wwcode mexico city	1	2016-04-01 07:32:16.527-07	2017-02-02 07:06:21.656-08	\N	34	\N	\N	\N	1729	\N	1
5561	8430	48	USD	10000	Donation to WWCode Twin Cities (Backers)	\N	2017-10-20 07:35:50.384-07	2017-10-20 07:35:56.715-07	\N	\N	2017-10-20 07:35:56.714-07	\N	1027	9333	\N	1
5564	8432	48	USD	2500	Donation to WWCode Twin Cities (Backers)	\N	2017-10-20 08:17:09.321-07	2017-10-20 08:17:15.564-07	\N	\N	2017-10-20 08:17:15.564-07	\N	1027	9335	\N	1
5880	3	520	USD	3054	T-Shirt Sales from August	\N	2017-11-06 22:37:40.362-08	2017-11-06 22:37:40.434-08	\N	\N	2017-11-06 22:37:40.434-08	******	\N	9814	\N	\N
5881	3	300	USD	2058	TShirt Sales from September 	\N	2017-11-06 22:46:56.936-08	2017-11-06 22:46:57.01-08	\N	\N	2017-11-06 22:46:57.01-08	******	\N	9814	\N	\N
5882	3	300	USD	1281	TShirt Sale from October 	\N	2017-11-06 22:50:01.738-08	2017-11-06 22:50:01.793-08	\N	\N	2017-11-06 22:50:01.793-08	******	\N	9814	\N	\N
6024	142	48	USD	42203	Donation to WWCode Twin Cities (Backers)	\N	2017-11-16 19:13:47.765-08	2017-11-16 19:13:54.852-08	\N	8451	2017-11-16 19:13:54.852-08	\N	1027	8492	Swag sales and silent auction proceeds from our 2YR Anniversary Event	1
6256	2594	48	USD	2500	Monthly donation to WWCode Twin Cities (Backers)	4156	2017-12-01 04:14:48.571-08	2017-12-01 04:14:54.638-08	\N	8690	2017-12-01 04:14:54.638-08	\N	1027	3116	\N	1
3101	5256	430	USD	2000	Donation to WWCode Kyiv	\N	2017-06-07 03:44:36.734-07	2017-06-07 03:44:39.575-07	\N	3211	2017-06-07 03:44:39.575-07	\N	\N	8319	\N	1
3283	3	51	USD	75000	Mozilla We Rise Atlanta support	\N	2017-06-20 07:46:21.208-07	2017-06-20 07:46:21.281-07	\N	\N	2017-06-20 07:46:21.208-07	******	132	9804	\N	1
5489	8	301	EUR	500	Donation to WWCode Berlin (Backers)	\N	2017-10-17 08:16:11.048-07	2017-10-17 08:16:23.59-07	\N	4967	2017-10-17 08:16:23.59-07	\N	574	8638	\N	1
3529	3	51	USD	120000	Aaron's and WWCode ATL	\N	2017-07-05 14:32:58.43-07	2017-07-05 14:32:58.502-07	\N	\N	2017-07-05 14:32:58.43-07	******	132	9804	\N	1
5372	3	300	USD	175500	SV Hackathon - Tableau 	\N	2017-10-10 09:57:28.656-07	2017-11-02 14:23:27.044-07	\N	\N	2017-10-10 09:57:28.724-07	******	\N	9804	\N	\N
6267	3	517	USD	162956	Manila Hackathon Eventbrite Ticket Sales 	\N	2017-12-01 16:56:06.491-08	2017-12-01 16:56:06.516-08	\N	8392	\N	\N	\N	9804	\N	1
6268	3	522	CAD	58500	Ticket Sales - WWCode Presents Brenda Jin, Roo Harrigan & Jen Long at Slack	\N	2017-12-01 16:59:24.817-08	2017-12-01 16:59:25.111-08	\N	8392	\N	\N	\N	9804	\N	1
5902	3	282	MXN	44426	Network Development	\N	2016-11-29 14:29:22.958-08	2016-11-29 14:29:22.958-08	\N	\N	2016-11-29 14:29:22.958-08	\N	\N	9804	\N	\N
5903	3	282	MXN	310535	Network Budget Balance Pre Open Collective	\N	2016-11-29 14:29:22.958-08	2016-11-29 14:29:22.958-08	\N	\N	2016-11-29 14:29:22.958-08	\N	\N	9804	\N	\N
6269	3	522	CAD	10350	Ticket Sales - Expand Your Insights at Vision Critical (Eventbrite)	\N	2017-12-01 17:00:04.383-08	2017-12-01 17:00:04.676-08	\N	8392	\N	\N	\N	9804	\N	1
3947	3	12	USD	47824	Leader Development - Angel's travel to attend WWCode Regional Leadership Event Seattle	\N	2017-08-03 18:06:25.756-07	2017-08-03 18:06:25.869-07	\N	\N	2017-08-03 18:06:25.756-07	******	499	9804	\N	1
6270	3	522	CAD	40600	Ticket Sales - Build Your First Cryptocurrency	\N	2017-12-01 17:00:23.723-08	2017-12-01 17:00:23.908-08	\N	8392	\N	\N	\N	9804	\N	1
3895	1325	273	USD	1000	Monthly donation to WWCode Greenville	2888	2017-07-31 21:46:24.729-07	2017-07-31 21:46:30.307-07	\N	3951	2017-07-31 21:46:30.307-07	\N	\N	3210	\N	1
5492	30	301	EUR	2500	Donation to WWCode Berlin (Backers)	\N	2017-10-17 08:36:24.666-07	2017-10-17 08:36:33.618-07	\N	4972	2017-10-17 08:36:33.618-07	\N	574	2385	\N	1
4243	3	271	USD	20000	Q1 Events Budget Bonus	\N	2017-08-31 13:05:56.491-07	2017-08-31 13:05:56.571-07	\N	\N	2017-08-31 13:05:56.491-07	******	997	9804	\N	1
4245	3	518	USD	20000	Q1 Activity Budget Bonus!	\N	2017-08-31 13:15:21.221-07	2017-08-31 13:15:21.293-07	\N	\N	2017-08-31 13:15:21.293-07	******	\N	9804	\N	1
4248	3	513	USD	20000	Q1 Activity Budget Bonus	\N	2017-08-31 13:18:30.587-07	2017-08-31 13:18:30.665-07	\N	\N	2017-08-31 13:18:30.664-07	******	\N	9804	\N	1
4251	3	285	USD	20000	Q1 Activity Budget Bonus	\N	2017-08-31 13:20:41.215-07	2017-08-31 13:20:41.41-07	\N	\N	2017-08-31 13:20:41.215-07	******	1000	9804	\N	1
4277	3	48	USD	20000	Q1 Activity Budget Bonus	\N	2017-08-31 17:51:11.342-07	2017-08-31 17:51:11.466-07	\N	\N	2017-08-31 17:51:11.342-07	******	1027	9804	\N	1
5371	3	300	USD	87750	SV Hackathon - VMware 	\N	2017-10-10 09:57:08.189-07	2017-11-02 14:23:27.026-07	\N	\N	2017-10-10 09:57:08.237-07	******	\N	9804	\N	\N
5914	3	524	EUR	46474	Donation from Codegram/JG Cumming	\N	2017-11-08 15:20:18.755-08	2017-11-08 15:20:18.836-08	\N	\N	2017-11-08 15:20:18.836-08	******	\N	9814	\N	\N
5370	3	300	USD	43875	SV Hackathon - Financial Engines	\N	2017-10-10 09:56:40.95-07	2017-11-02 14:23:27.006-07	\N	\N	2017-10-10 09:56:41.026-07	******	\N	9804	\N	\N
4856	3	518	USD	3919	Transfer from Global	\N	2017-09-29 14:39:47.987-07	2017-09-29 14:39:48.095-07	\N	\N	2017-09-29 14:39:48.094-07	******	\N	9804	\N	1
5516	3	12	USD	37500	GitHub Sponsorship for Hackathon	\N	2017-10-18 07:31:37.052-07	2017-11-02 14:23:27.176-07	\N	\N	2017-10-18 07:31:37.116-07	******	\N	9804	\N	\N
5517	3	51	USD	7500	GitHub Sponsorship for Atlanta Hacakthon	\N	2017-10-18 07:32:06.958-07	2017-10-18 07:32:07.042-07	\N	\N	2017-10-18 07:32:07.042-07	******	\N	9804	\N	\N
2696	3	12	USD	75000	Zapier - Global Development	\N	2017-05-03 10:44:10.796-07	2017-05-03 10:44:10.856-07	\N	\N	2017-05-03 10:44:10.796-07	******	499	9804	\N	1
3409	3	12	USD	147000	Radix We Rise ATL sponsorship - global and fees	\N	2017-06-27 07:53:30.543-07	2017-06-27 07:53:30.682-07	\N	\N	2017-06-27 07:53:30.543-07	******	499	9804	\N	1
3941	3	12	USD	26527	Leadership Development - Transfer from WWCode Seattle	\N	2017-08-03 12:40:40.884-07	2017-08-03 12:40:41.348-07	\N	\N	2017-08-03 12:40:40.884-07	******	499	9804	\N	1
4240	3	12	USD	20000	Q1 Activity Budget Bonus	\N	2017-08-31 12:51:05.012-07	2017-08-31 12:51:05.09-07	\N	\N	2017-08-31 12:51:05.012-07	******	499	9804	\N	1
4666	7542	12	USD	3000	Donation to Women Who Code Atlanta	\N	2017-09-19 18:48:29.811-07	2017-09-19 18:48:32.993-07	\N	4675	2017-09-19 18:48:29.811-07	\N	499	5599	\N	1
3956	3	12	USD	48840	Leader Development - Alicia's travel to attend WWCode Regional Leadership Event Seattle	\N	2017-08-04 11:25:57.6-07	2017-08-04 11:25:57.691-07	\N	\N	2017-08-04 11:25:57.6-07	******	499	9804	\N	1
4242	3	278	GBP	15469	Q1 Events Budget Bonus	\N	2017-08-31 13:00:04.051-07	2017-08-31 13:00:04.152-07	\N	\N	2017-08-31 13:00:04.051-07	******	566	9804	\N	1
4246	3	259	USD	20000	Q1 Activity Budget Bonus	\N	2017-08-31 13:16:19.282-07	2017-08-31 13:16:19.37-07	\N	\N	2017-08-31 13:16:19.282-07	******	855	9804	\N	1
4249	3	291	CAD	183633	Budget Bonus 	\N	2017-08-31 13:19:28.244-07	2017-08-31 13:19:28.338-07	\N	\N	2017-08-31 13:19:28.244-07	******	527	9804	\N	1
5623	3	300	USD	100000	Samsung Sponsorship for Hackathon	\N	2017-10-23 19:51:43.801-07	2017-11-02 14:23:27.272-07	\N	\N	2017-10-23 19:51:43.86-07	******	\N	9804	\N	\N
4250	3	241	USD	20000	Q1 Activity Budget Bonus	\N	2017-08-31 13:19:30.28-07	2017-08-31 13:19:30.371-07	\N	\N	2017-08-31 13:19:30.28-07	******	864	9804	\N	1
4264	3	260	USD	20000	Q1 Events Budget Bonus	\N	2017-08-31 14:02:09.683-07	2017-08-31 14:02:09.8-07	\N	\N	2017-08-31 14:02:09.683-07	******	1021	9804	\N	1
5624	3	521	USD	20000	Budget Bonus from Global	\N	2017-10-23 22:07:33.789-07	2017-11-02 14:23:27.29-07	\N	\N	2017-10-23 22:07:33.913-07	******	\N	9804	\N	\N
4866	3	14	USD	55800	EventBrite	\N	2017-09-30 08:14:22.345-07	2017-09-30 08:14:22.444-07	\N	\N	2017-09-30 08:14:22.345-07	******	1339	9804	\N	1
6093	3	48	USD	50000	GitLab Diversity Sponsorship	\N	2017-11-20 16:33:27.332-08	2017-11-20 16:33:27.359-08	2017-11-26 16:00:00-08	8392	\N	\N	\N	\N	\N	1
2212	3	286	USD	100000	Leadership Development: Google I/O Travel grant for Karina M.	\N	2017-03-31 15:32:34.085-07	2017-03-31 15:32:34.135-07	\N	\N	2017-03-31 15:32:34.085-07	******	953	9804	\N	1
4241	3	272	USD	20000	Q1 Activity Budget Bonus	\N	2017-08-31 12:52:10.468-07	2017-08-31 12:52:10.545-07	\N	\N	2017-08-31 12:52:10.468-07	******	1051	9804	\N	1
4258	3	290	USD	20000	Q1 Events Budget Bonus	\N	2017-08-31 13:38:09.028-07	2017-08-31 13:38:09.149-07	\N	\N	2017-08-31 13:38:09.028-07	******	995	9804	\N	1
4272	3	266	AUD	25098	Q1 Activity Budget Bonus	\N	2017-08-31 17:35:45.851-07	2017-08-31 17:35:45.951-07	\N	\N	2017-08-31 17:35:45.851-07	******	854	9804	\N	1
4852	3	286	USD	7124	From Global for Fees	\N	2017-09-29 14:15:29.56-07	2017-09-29 14:15:29.651-07	\N	\N	2017-09-29 14:15:29.56-07	******	953	9804	\N	1
3064	3	14	USD	50000	Google I/O Stipend	\N	2017-06-05 08:11:40.38-07	2017-06-05 08:11:40.527-07	\N	\N	2017-06-05 08:11:40.38-07	******	1339	9804	\N	1
3065	3	48	USD	100000	Google I/O Stipend	\N	2017-06-05 08:14:45.295-07	2017-06-05 08:14:45.413-07	\N	\N	2017-06-05 08:14:45.295-07	******	1027	9804	\N	1
4269	3	273	USD	20000	Q1 Activity Budget Bonus	\N	2017-08-31 17:31:05.858-07	2017-08-31 17:31:05.986-07	\N	\N	2017-08-31 17:31:05.858-07	******	1044	9804	\N	1
4260	3	14	USD	20000	Q1 Events Budget Bonus	\N	2017-08-31 13:40:15.203-07	2017-08-31 13:40:15.353-07	\N	\N	2017-08-31 13:40:15.203-07	******	1339	9804	\N	1
2204	3	2	USD	50000	Google I/O Travel Grant: Patricia C. 	\N	2017-03-31 10:17:51.642-07	2017-03-31 10:17:51.712-07	\N	\N	2017-03-31 10:17:51.642-07	******	1316	9804	\N	1
2520	3	3	USD	40000	Google I/O Travel Expense	\N	2017-04-19 11:26:01.156-07	2017-04-19 11:26:01.247-07	\N	\N	2017-04-19 11:26:01.156-07	******	1437	9804	\N	1
6300	3	517	USD	45000	GitLab Diversity Sponsorship	\N	2017-12-04 14:05:23.8-08	2017-12-04 14:05:23.827-08	\N	8392	\N	\N	\N	9804	\N	1
5773	3	48	USD	90013	Donation from Michael Pryor	\N	2017-10-31 15:10:54.68-07	2017-10-31 15:10:54.68-07	\N	\N	\N	******	\N	9814	\N	\N
4119	3	4	USD	30000	Thanks Capital One iOS summit	\N	2017-08-18 14:09:49.732-07	2017-08-18 14:09:49.832-07	\N	\N	2017-08-18 14:09:49.732-07	******	1428	9804	\N	1
5399	3	12	USD	37500	GitLab Atlanta Diversity Sponsorship	\N	2017-10-11 15:05:08.652-07	2017-11-02 14:23:27.094-07	\N	\N	2017-10-11 15:05:08.863-07	******	\N	9804	\N	\N
4262	3	3	USD	244485	Budget Bonus 	\N	2017-08-31 13:45:23.655-07	2017-08-31 13:45:23.73-07	\N	\N	2017-08-31 13:45:23.655-07	******	1437	9804	\N	1
5774	3	48	USD	90013	Donation from Michael Pryor	\N	2017-10-31 15:11:03.919-07	2017-10-31 15:11:03.919-07	\N	\N	\N	******	\N	9814	\N	\N
5776	3	48	USD	90013	Donation from Michael Pryor	\N	2017-10-31 15:13:01.898-07	2017-10-31 15:13:01.898-07	\N	\N	\N	******	\N	9814	\N	\N
5400	3	51	USD	7500	GitLab Atlanta Diversity Sponsorship	\N	2017-10-11 15:09:08.94-07	2017-10-11 15:09:09.051-07	\N	\N	2017-10-11 15:09:09.051-07	******	\N	9804	\N	\N
5775	3	48	USD	90013	Donation from Michael Pryor	\N	2017-10-31 15:13:00.243-07	2017-10-31 15:13:00.243-07	\N	\N	\N	******	\N	9814	\N	\N
13	30	12	USD	1000	Donation to WWCode Atlanta	\N	2016-04-01 07:32:16.445-07	2017-02-02 07:06:14.763-08	\N	39	\N	\N	\N	2385	\N	1
5631	8512	516	USD	300	Monthly donation to Women Who Code Huntsville	3802	2017-10-24 11:04:44.316-07	2017-10-24 11:04:53.749-07	\N	5832	2017-10-24 11:04:53.749-07	\N	\N	9451	\N	1
4120	3	3	USD	30000	Thanks Capital One iOS summit	\N	2017-08-18 14:13:18.36-07	2017-08-18 14:13:18.458-07	\N	\N	2017-08-18 14:13:18.36-07	******	1437	9804	\N	1
4854	3	47	USD	52230	Leadership Conference Stipend 	\N	2017-09-29 14:22:34.438-07	2017-09-29 14:22:34.642-07	\N	\N	2017-09-29 14:22:34.438-07	******	1743	9804	\N	1
5777	3	48	USD	90013	Donation from Michael Pryor	\N	2017-10-31 15:14:45.292-07	2017-10-31 15:14:45.292-07	\N	\N	\N	******	\N	9814	\N	\N
3296	3	47	USD	20000	Budget bonus: Q1 Activity	\N	2017-06-21 10:11:10.151-07	2017-06-21 10:11:10.234-07	\N	\N	2017-06-21 10:11:10.151-07	******	1743	9804	\N	1
5779	3	48	USD	90013	Donation from Michael Pryor	\N	2017-10-31 18:12:48.005-07	2017-10-31 18:12:48.005-07	\N	\N	\N	******	\N	9814	\N	\N
5780	3	48	USD	90013	Donation from Michael Pryor	\N	2017-10-31 18:12:59.129-07	2017-10-31 18:12:59.129-07	\N	\N	\N	******	\N	9814	\N	\N
6193	3	517	USD	93391	2017 Hackathon Ticket Sales 	\N	2017-11-27 18:32:46.613-08	2017-11-27 18:32:46.641-08	\N	8392	\N	\N	\N	9804	\N	1
15	108	2	USD	30000	Donation to WWCode Austin	\N	2016-04-01 07:32:16.447-07	2017-02-02 07:06:14.785-08	\N	71	2016-04-01 07:32:16.447-07	\N	1316	8253	\N	1
101	8	14	USD	100	Recurring subscription	8	2016-04-01 07:32:16.701-07	2016-04-01 07:32:16.701-07	2016-04-07 07:32:16.701-07	\N	\N	\N	\N	8638	\N	1
87	2	10	USD	500	Recurring subscription	1	2016-04-01 07:32:16.648-07	2016-04-01 07:32:16.648-07	2016-04-07 07:32:16.648-07	\N	\N	\N	\N	1729	\N	1
100	30	13	USD	100	Recurring subscription	3	2016-04-01 07:32:16.697-07	2016-04-01 07:32:16.697-07	2016-04-07 07:32:16.691-07	\N	\N	\N	\N	2385	\N	1
99	30	13	USD	100	Recurring subscription	7	2016-04-01 07:32:16.691-07	2016-04-01 07:32:16.691-07	2016-04-07 07:32:16.691-07	\N	\N	\N	\N	2385	\N	1
68	80	10	MXN	500	Monthly donation to wwcode mexico city	4	2016-04-01 07:32:16.557-07	2017-02-02 07:06:15.653-08	\N	42	\N	\N	\N	4356	\N	1
72	2	13	USD	100	Monthly donation to wwcode washington dc	2	2016-04-01 07:32:16.577-07	2017-02-02 07:06:15.583-08	\N	46	\N	\N	\N	1729	\N	1
71	8	14	USD	100	Monthly donation to wwcode seattle	8	2016-04-01 07:32:16.574-07	2017-02-02 07:06:15.567-08	\N	45	\N	\N	\N	8638	\N	1
69	30	13	USD	100	Monthly donation to wwcode washington dc	7	2016-04-01 07:32:16.561-07	2017-02-02 07:06:15.552-08	\N	43	\N	\N	\N	2385	\N	1
67	30	14	USD	100	Monthly donation to wwcode seattle	6	2016-04-01 07:32:16.552-07	2017-02-02 07:06:15.538-08	\N	41	\N	\N	\N	2385	\N	1
5781	3	48	USD	90013	Donation from Michael Pryor	\N	2017-10-31 18:45:48.287-07	2017-10-31 18:45:48.287-07	\N	\N	\N	******	\N	9814	\N	\N
95	126	13	USD	100	Monthly donation to wwcode washington dc	33	2016-04-01 07:32:16.673-07	2017-02-02 07:06:15.838-08	\N	93	\N	\N	\N	4228	\N	1
246	392	2	USD	50000	Donation to WWCode Austin	\N	2016-05-19 12:24:42.786-07	2017-02-02 07:06:17.118-08	\N	288	2016-05-19 12:24:42.786-07	\N	1316	1568	\N	1
316	555	13	USD	100000	Donation to WWCode Washington DC	\N	2016-06-06 17:53:47.064-07	2017-02-02 07:06:18.126-08	\N	381	2016-06-06 17:53:47.064-07	\N	492	1848	\N	1
312	551	2	USD	150000	Donation to WWCode Austin	\N	2016-06-06 12:04:36.791-07	2017-02-02 07:06:18.114-08	\N	377	2016-06-06 12:04:36.791-07	\N	1316	1442	\N	1
364	646	2	USD	75000	Donation to WWCode Austin	\N	2016-06-22 13:09:45.975-07	2017-02-02 07:06:18.866-08	\N	435	2016-06-22 13:09:45.975-07	\N	1316	7263	\N	1
360	642	4	USD	100	Donation to WWCode San Francisco	\N	2016-06-21 09:05:00.946-07	2017-02-02 07:06:18.844-08	\N	431	\N	\N	\N	3533	\N	1
359	642	12	USD	100	Donation to WWCode Atlanta	\N	2016-06-21 09:02:55.605-07	2017-02-02 07:06:18.833-08	\N	430	\N	\N	\N	3533	\N	1
498	896	4	USD	10000	Monthly donation to wwcode san francisco	378	2016-08-03 10:47:17.188-07	2017-02-02 07:06:20.1-08	\N	571	2016-08-03 10:47:17.188-07	\N	1428	8290	\N	1
647	1158	241	USD	1000	Monthly donation to wwcode taipei	496	2016-09-09 20:42:49.15-07	2016-10-14 13:08:32.241-07	\N	731	2016-09-09 20:42:51.443-07	\N	\N	6067	\N	1
6196	3	48	USD	45000	GitLab Diversity Sponsorship	\N	2017-11-28 00:08:19.874-08	2017-11-28 00:08:19.902-08	\N	8392	\N	\N	\N	9804	\N	1
808	1438	2	USD	12500	Donation to WWCode Austin	\N	2016-10-06 11:36:35.208-07	2016-10-06 11:36:39.093-07	\N	880	2016-10-06 11:36:35.208-07	\N	1316	8045	\N	1
812	1446	241	USD	2500	Donation to WWCode Taipei	\N	2016-10-07 09:49:14.682-07	2016-10-07 09:49:20.396-07	\N	884	2016-10-07 09:49:14.682-07	\N	864	5180	\N	1
6197	3	51	USD	7500	GitLab Diversity Sponsorship (Portland)	\N	2017-11-28 00:42:42.179-08	2017-11-28 00:42:42.258-08	\N	8392	\N	\N	\N	9804	\N	1
6198	3	51	USD	15000	Mozilla Sponsorship (Portland) 	\N	2017-11-28 00:43:29.153-08	2017-11-28 00:43:29.18-08	\N	8392	\N	\N	\N	9804	\N	1
6199	3	51	USD	75000	Dice Hackathon Sponsorship (Atlanta) 	\N	2017-11-28 00:46:52.547-08	2017-11-28 00:46:52.574-08	\N	8392	\N	\N	\N	9804	\N	1
1167	1890	2	USD	4000	Donation to WWCode Austin	\N	2016-11-28 07:33:12.038-08	2016-11-28 07:33:15.883-08	\N	1249	2016-11-28 07:33:12.038-08	\N	1316	6014	\N	1
5809	3	12	USD	375000	Dice Hackathon Sponsorship - ATL	\N	2017-11-01 22:06:32.681-07	2017-11-01 22:06:32.762-07	\N	\N	2017-11-01 22:06:32.762-07	******	\N	9814	\N	\N
1215	1957	2	USD	20000	Donation to WWCode Austin	\N	2016-11-30 08:11:39.696-08	2016-11-30 08:11:42.626-08	\N	1296	2016-11-30 08:11:39.696-08	\N	1316	4960	\N	1
1388	2220	259	USD	2500	Donation to WWCode Birmingham	\N	2016-12-18 17:41:26.702-08	2016-12-18 17:41:29.227-08	\N	1471	2016-12-18 17:41:26.702-08	\N	855	1831	\N	1
1389	2220	259	USD	2500	Donation to WWCode Birmingham	\N	2016-12-18 17:41:58.846-08	2016-12-18 17:42:01.434-08	2016-12-27 16:00:00-08	1472	2016-12-18 17:41:58.846-08	\N	855	1831	\N	1
1466	2416	2	USD	20000	Donation to WWCode Austin	\N	2017-01-03 12:59:34.554-08	2017-01-03 12:59:38.801-08	\N	1553	2017-01-03 12:59:34.554-08	\N	1316	3538	\N	1
1557	2594	48	USD	10000	Donation to WWCode Twin Cities	\N	2017-01-18 05:54:47.782-08	2017-01-18 05:54:51.04-08	\N	1647	2017-01-18 05:54:47.782-08	\N	1027	3116	\N	1
1537	2561	48	USD	50000	Donation to WWCode Twin Cities	\N	2017-01-16 10:03:53.812-08	2017-01-16 10:03:57.019-08	\N	1622	2017-01-16 10:03:53.812-08	\N	1027	8146	\N	1
1531	2549	270	USD	1000	Monthly donation to WWCode Chicago	1238	2017-01-14 09:11:39.405-08	2017-01-14 09:11:43.298-08	\N	1616	2017-01-14 09:11:43.297-08	\N	\N	7262	\N	1
1712	2906	271	USD	2500	Monthly donation to WWCode Dallas	1366	2017-02-01 09:30:44.044-08	2017-02-01 09:30:50.454-08	\N	1804	2017-02-01 09:30:44.044-08	\N	997	4881	\N	1
1709	2898	48	USD	22500	Donation to WWCode Twin Cities	\N	2017-02-01 07:16:17.78-08	2017-02-01 07:16:22.469-08	\N	1801	2017-02-01 07:16:17.78-08	\N	1027	2232	\N	1
3069	3	12	USD	300000	Microsoft - Global	\N	2017-06-05 09:03:34.432-07	2017-06-05 09:03:34.599-07	\N	\N	2017-06-05 09:03:34.432-07	******	499	9804	\N	1
1935	3301	522	CAD	30000	Donation to Women Who Code Vancouver	\N	2017-02-27 16:25:15.618-08	2017-02-27 16:25:20.42-08	\N	2030	2017-02-27 16:25:20.419-08	\N	\N	4726	\N	1
2003	3442	259	USD	6000	Donation to WWCode Birmingham	\N	2017-03-09 10:29:52.29-08	2017-03-09 10:29:55.868-08	\N	2104	2017-03-09 10:29:52.29-08	\N	855	7809	\N	1
2151	3	12	USD	50000	Leadership Development: Google i/o grant for Alicia C.	\N	2017-03-27 10:10:04.532-07	2017-03-27 10:10:04.637-07	\N	\N	2017-03-27 10:10:04.532-07	******	499	9804	\N	1
2215	3	286	USD	7500	PayPal Fees for Google I/O transfer	\N	2017-03-31 15:52:45.044-07	2017-03-31 15:52:45.089-07	\N	\N	2017-03-31 15:52:45.044-07	******	953	9804	\N	1
2332	3999	2	USD	20000	Donation to WWCode Austin	\N	2017-04-04 12:51:02.781-07	2017-04-04 12:51:04.976-07	\N	2438	2017-04-04 12:51:02.781-07	\N	1316	2977	\N	1
3070	3	51	USD	60000	Microsoft via WWCode Atlanta	\N	2017-06-05 09:04:56.812-07	2017-06-05 09:04:56.936-07	\N	\N	2017-06-05 09:04:56.812-07	******	132	9804	\N	1
2393	3	516	USD	20000	Global Development	\N	2017-04-07 05:25:51.051-07	2017-04-07 05:25:51.101-07	\N	\N	2017-04-07 05:25:51.1-07	******	\N	9804	\N	1
2421	4153	13	USD	25000	Donation to WWCode Washington DC	\N	2017-04-10 18:09:47.558-07	2017-04-10 18:09:50.716-07	\N	2535	2017-04-10 18:09:47.558-07	\N	492	7368	\N	1
2430	4173	13	USD	2500	Donation to WWCode Washington DC	\N	2017-04-11 19:05:32.82-07	2017-04-11 19:05:36.109-07	\N	2546	2017-04-11 19:05:32.82-07	\N	492	4475	\N	1
2507	3	195	USD	1400	PayPal Fees for Google I/O	\N	2017-04-18 17:31:31.884-07	2017-04-18 17:31:31.962-07	\N	\N	2017-04-18 17:31:31.961-07	******	\N	9804	\N	1
2506	3	12	USD	1480	PayPal Fees Google I/O Ticket	\N	2017-04-18 17:20:11.451-07	2017-04-18 17:20:11.557-07	\N	\N	2017-04-18 17:20:11.552-07	******	\N	9804	\N	1
2489	3	511	MXN	2200	PayPal Fees	\N	2017-04-17 15:35:54.945-07	2017-04-17 15:35:55.035-07	\N	\N	2017-04-17 15:35:55.034-07	******	\N	9804	\N	1
2488	3	511	MXN	18800	Leadership Development: Director travel stipend to attend CONNECT 2017	\N	2017-04-17 15:35:06.028-07	2017-04-17 15:35:06.109-07	\N	\N	2017-04-17 15:35:06.109-07	******	\N	9804	\N	1
2475	3	278	GBP	4250	PayPal Fees	\N	2017-04-17 14:06:54.729-07	2017-04-17 14:06:54.818-07	\N	\N	2017-04-17 14:06:54.729-07	******	566	9804	\N	1
2473	3	517	USD	5000	PayPal Fees	\N	2017-04-17 13:41:53.536-07	2017-04-17 13:41:53.62-07	\N	\N	2017-04-17 13:41:53.619-07	******	\N	9804	\N	1
2472	3	517	USD	100000	Director Travel Stipend CONNECT	\N	2017-04-17 13:41:37.54-07	2017-04-17 13:41:37.67-07	\N	\N	2017-04-17 13:41:37.669-07	******	\N	9804	\N	1
2486	3	278	GBP	41000	Leadership Development: Director Stipend to attend NY Stock Exchange Bell Ringing	\N	2017-04-17 15:31:52.609-07	2017-04-17 15:31:52.754-07	\N	\N	2017-04-17 15:31:52.609-07	******	566	9804	\N	1
2487	3	511	MXN	25000	Leadership Development: Director Travel Stipend to attend CONNECT 2017	\N	2017-04-17 15:34:32.173-07	2017-04-17 15:34:32.292-07	\N	\N	2017-04-17 15:34:32.289-07	******	\N	9804	\N	1
2519	3	2	USD	1480	PayPal Fee for Google I/O Ticket	\N	2017-04-19 11:18:17.942-07	2017-04-19 11:18:19.333-07	\N	\N	2017-04-19 11:18:19.333-07	******	\N	9804	\N	1
2521	3	3	USD	1190	PayPal Fees for Google I/O	\N	2017-04-19 11:26:58.952-07	2017-04-19 11:26:59.01-07	\N	\N	2017-04-19 11:26:59.009-07	******	\N	9804	\N	1
2522	3	59	USD	610	PayPal Fees for Google I/O	\N	2017-04-19 11:35:02.98-07	2017-04-19 11:35:03.062-07	\N	\N	2017-04-19 11:35:03.062-07	******	\N	9804	\N	1
2649	3	13	USD	154800	iOS Dev Camp 2016 (Capital One)	\N	2017-05-01 11:02:20.457-07	2017-05-01 11:02:20.53-07	\N	\N	2017-05-01 11:02:20.457-07	******	492	9804	\N	1
2636	3419	516	USD	200	Monthly donation to Women Who Code Huntsville	2031	2017-04-30 18:40:26.938-07	2017-04-30 18:40:31.729-07	\N	2749	2017-04-30 18:40:31.727-07	\N	\N	3898	\N	1
2644	4550	516	USD	500	Monthly donation to Women Who Code Huntsville	2039	2017-05-01 10:13:32.223-07	2017-05-01 10:13:36.337-07	\N	2757	2017-05-01 10:13:32.223-07	\N	989	1788	\N	1
2710	3	276	USD	2175	In honour of Maya Johnston	\N	2017-05-04 09:21:53.626-07	2017-05-04 09:21:53.703-07	\N	\N	2017-05-04 09:21:53.702-07	******	\N	9804	\N	1
2702	3	259	USD	2175	Catherine L. - fees and Global development	\N	2017-05-03 17:12:19.758-07	2017-05-03 17:12:19.828-07	\N	\N	2017-05-03 17:12:19.827-07	******	\N	9804	\N	1
2697	3	51	USD	15000	Zapier + WWCode Atlanta	\N	2017-05-03 10:44:48.667-07	2017-05-03 10:44:48.731-07	\N	\N	2017-05-03 10:44:48.667-07	******	132	9804	\N	1
2755	4720	2	USD	84000	Donation to WWCode Austin	\N	2017-05-09 11:14:19.702-07	2017-05-09 11:14:23.386-07	\N	2860	2017-05-09 11:14:19.702-07	\N	1316	1586	\N	1
2750	4711	517	USD	1000	Monthly donation to Women Who Code Manila	2103	2017-05-08 22:59:11.956-07	2017-05-08 22:59:17.596-07	\N	2855	2017-05-08 22:59:11.956-07	\N	510	3178	\N	1
2817	4834	14	USD	20000	Donation to WWCode Seattle	\N	2017-05-15 05:07:56.843-07	2017-05-15 05:07:59.734-07	\N	2922	2017-05-15 05:07:56.843-07	\N	1339	2984	\N	1
2783	4749	522	CAD	1000	Donation to Women Who Code Vancouver	\N	2017-05-10 16:45:43.437-07	2017-05-10 16:45:46.821-07	\N	2888	2017-05-10 16:45:46.821-07	\N	\N	2804	\N	1
5807	3	48	USD	90013	Donation from Michael Pryor	\N	2017-11-01 17:44:14.948-07	2017-11-01 17:44:15.023-07	\N	\N	2017-11-01 17:44:15.022-07	******	\N	9814	\N	\N
3112	3	297	AUD	100	Lucy B - conversion, fees, and global	\N	2017-06-07 10:55:10.883-07	2017-06-07 10:55:10.938-07	\N	\N	2017-06-07 10:55:10.937-07	******	\N	9804	\N	1
3094	3	297	AUD	287	Lucy B - conversion and fees	\N	2017-06-06 17:33:07.718-07	2017-06-06 17:33:08.034-07	\N	\N	2017-06-06 17:33:08.033-07	******	\N	9804	\N	1
3107	5267	13	USD	14328	Donation to WWCode Washington DC	\N	2017-06-07 09:24:53.561-07	2017-06-07 09:24:56.42-07	\N	3217	2017-06-07 09:24:53.561-07	\N	492	2300	\N	1
3204	3825	517	USD	10000	Monthly donation to Women Who Code Manila	2393	2017-06-13 18:22:49.826-07	2017-06-13 18:22:54.372-07	\N	3297	2017-06-13 18:22:49.826-07	\N	511	4527	\N	1
3156	3	51	USD	50000	Google I/O from WTM	\N	2017-06-09 09:02:51.359-07	2017-06-09 09:02:51.535-07	\N	\N	2017-06-09 09:02:51.359-07	******	132	9804	\N	1
3153	3	301	EUR	2405	Leadership Development	\N	2017-06-09 07:33:06.595-07	2017-06-09 07:33:06.662-07	\N	\N	2017-06-09 07:33:06.661-07	******	\N	9804	\N	1
5810	3	51	USD	75000	Dice Hackathon Sponsorship - ATL	\N	2017-11-01 22:08:19.667-07	2017-11-01 22:08:19.75-07	\N	\N	2017-11-01 22:08:19.75-07	******	\N	9804	\N	\N
5811	3	522	CAD	4344	Vision Critical Event Funds (PayPal) 	\N	2017-11-01 22:13:45.045-07	2017-11-01 22:13:45.117-07	\N	\N	2017-11-01 22:13:45.117-07	******	\N	9814	\N	\N
3157	3	51	USD	180000	Google I/O from WTM	\N	2017-06-09 09:03:43.999-07	2017-06-09 09:03:44.133-07	\N	\N	2017-06-09 09:03:43.999-07	******	132	9804	\N	1
3208	3	520	USD	500000	Sony Founding Sponsorship	\N	2017-06-14 10:42:40.166-07	2017-06-14 10:42:40.352-07	\N	\N	2017-06-14 10:42:40.351-07	******	\N	9804	\N	1
3268	3	12	USD	150000	Mailchimp We Rise Sponsorship - Global	\N	2017-06-19 07:22:39.747-07	2017-06-19 07:22:39.852-07	\N	\N	2017-06-19 07:22:39.747-07	******	499	9804	\N	1
5812	3	12	USD	177000	ATL Hackathon EventBrite Sales 	\N	2017-11-01 22:15:54.766-07	2017-11-01 22:15:54.811-07	\N	\N	2017-11-01 22:15:54.811-07	******	\N	9814	\N	\N
3269	3	51	USD	30000	Mailchimp from ATL We Rise Sponsorship	\N	2017-06-19 07:23:28.61-07	2017-06-19 07:23:28.679-07	\N	\N	2017-06-19 07:23:28.61-07	******	132	9804	\N	1
3297	3	511	MXN	1024	PayPal fees	\N	2017-06-21 10:21:02.315-07	2017-06-21 10:21:02.439-07	\N	\N	2017-06-21 10:21:02.439-07	******	\N	9804	\N	1
5813	3	51	USD	35400	ATL Hackathon EventBrite Sales	\N	2017-11-01 22:17:04.23-07	2017-11-01 22:17:04.274-07	\N	\N	2017-11-01 22:17:04.274-07	******	\N	9804	\N	\N
3413	3	12	USD	2192963	We Rise Conference	\N	2017-06-27 08:55:12.158-07	2017-06-27 08:55:12.296-07	\N	\N	2017-06-27 08:55:12.158-07	******	499	9804	\N	1
3414	3	51	USD	438593	We Rise conference Atlanta	\N	2017-06-27 08:56:59.041-07	2017-06-27 08:56:59.176-07	\N	\N	2017-06-27 08:56:59.041-07	******	132	9804	\N	1
3471	3	12	USD	428179	Budget Bonus from Global Development Fund	\N	2017-06-30 14:34:16.35-07	2017-06-30 14:34:16.43-07	\N	\N	2017-06-30 14:34:16.35-07	******	499	9804	\N	1
3525	3	12	USD	432000	We Rise Salesforce sponsorship - global and fees	\N	2017-07-05 14:28:24.659-07	2017-07-05 14:28:24.738-07	\N	\N	2017-07-05 14:28:24.659-07	******	499	9804	\N	1
3564	3	301	EUR	22198	Leadership Development- Barcelona	\N	2017-07-07 11:20:30.034-07	2017-07-07 11:20:30.101-07	\N	\N	2017-07-07 11:20:30.034-07	******	574	9804	\N	1
3485	5256	430	USD	2000	Donation to WWCode Kyiv	\N	2017-07-03 05:00:46.6-07	2017-07-03 05:00:50.071-07	\N	3566	2017-07-03 05:00:50.07-07	\N	\N	8319	\N	1
3586	5939	51	USD	10000	Donation to Women Who Code	\N	2017-07-08 12:45:50.811-07	2017-07-08 12:45:54.447-07	\N	3663	2017-07-08 12:45:50.811-07	\N	132	4707	\N	1
3609	3	511	MXN	111850	Transportation for CONNECT	\N	2017-07-10 08:18:53.127-07	2017-07-10 08:18:53.192-07	\N	\N	2017-07-10 08:18:53.191-07	******	\N	9804	\N	1
3717	6100	2	USD	10000	Donation to WWCode Austin	\N	2017-07-16 20:18:20.874-07	2017-07-16 20:18:23.8-07	\N	3779	2017-07-16 20:18:20.874-07	\N	1316	4802	\N	1
3758	896	272	USD	10000	Donation to WWCode East Bay	\N	2017-07-19 14:21:42.428-07	2017-07-19 14:21:45.627-07	\N	3818	2017-07-19 14:21:42.428-07	\N	1051	8290	\N	1
3909	3	12	USD	600000	Turner Donation for WWCode ATL - We Rise 	\N	2017-08-01 15:54:28.808-07	2017-08-01 15:54:28.886-07	\N	\N	2017-08-01 15:54:28.808-07	******	499	9804	\N	1
3974	3	510	USD	1991	Donations via Meetup	\N	2017-08-07 19:27:36.295-07	2017-08-07 19:27:36.576-07	\N	\N	2017-08-07 19:27:36.576-07	******	\N	9804	\N	1
4051	6604	59	USD	100000	Donation to WWCode Portland	\N	2017-08-14 14:46:21.07-07	2017-08-14 14:46:25.081-07	\N	4101	2017-08-14 14:46:21.07-07	\N	662	7701	\N	1
4116	3	13	USD	30000	Budget Bonus - Thanks Capital One iOS summit	\N	2017-08-18 14:04:44.676-07	2017-08-18 14:04:44.774-07	\N	\N	2017-08-18 14:04:44.676-07	******	492	9804	\N	1
4094	6656	12	USD	3000	Donation to Women Who Code Atlanta	\N	2017-08-15 18:57:31.083-07	2017-08-15 18:57:34.388-07	\N	4144	2017-08-15 18:57:31.083-07	\N	499	3919	\N	1
4161	3	13	USD	20000	Q1 Events Budget Bonus	\N	2017-08-24 13:17:28.454-07	2017-08-24 13:17:28.652-07	\N	\N	2017-08-24 13:17:28.454-07	******	492	9804	\N	1
4235	3	524	EUR	16799	Q1 - Budget Bonus 	\N	2017-08-31 08:54:33.515-07	2017-08-31 08:54:33.602-07	\N	\N	2017-08-31 08:54:33.602-07	******	\N	9804	\N	1
4237	3	15	USD	20000	Q1 Activity Budget Bonus	\N	2017-08-31 12:46:25.945-07	2017-08-31 12:46:26.055-07	\N	\N	2017-08-31 12:46:25.945-07	******	489	9804	\N	1
4238	3	517	USD	20000	Q1 Activity Budget Bonus	\N	2017-08-31 12:47:20.018-07	2017-08-31 12:47:20.186-07	\N	\N	2017-08-31 12:47:20.184-07	******	\N	9804	\N	1
4256	3	512	USD	20000	Q1 Events Budget Bonus	\N	2017-08-31 13:35:14.87-07	2017-08-31 13:35:14.987-07	\N	\N	2017-08-31 13:35:14.986-07	******	\N	9804	\N	1
4276	3	523	EUR	16796	Q1 Activity Budget Bonus	\N	2017-08-31 17:49:37.16-07	2017-08-31 17:49:37.251-07	\N	\N	2017-08-31 17:49:37.251-07	******	\N	9804	\N	1
4273	3	280	USD	20000	Q1 Activity Budget Bonus	\N	2017-08-31 17:43:14.876-07	2017-08-31 17:43:15.046-07	\N	\N	2017-08-31 17:43:14.876-07	******	967	9804	\N	1
4270	3	524	EUR	16796	Q1 Activity Budget Bonus	\N	2017-08-31 17:32:49.363-07	2017-08-31 17:32:49.441-07	\N	\N	2017-08-31 17:32:49.441-07	******	\N	9804	\N	1
4268	3	519	USD	20000	Q1 Activity Budget Bonus	\N	2017-08-31 17:19:59.133-07	2017-08-31 17:19:59.311-07	\N	\N	2017-08-31 17:19:59.31-07	******	\N	9804	\N	1
4259	3	510	USD	20000	Q1 Events Budget Bonus	\N	2017-08-31 13:39:11.63-07	2017-08-31 13:39:11.706-07	\N	\N	2017-08-31 13:39:11.706-07	******	\N	9804	\N	1
4257	3	516	USD	20000	Q1 Events Budget Bonus	\N	2017-08-31 13:36:23.348-07	2017-08-31 13:36:23.454-07	\N	\N	2017-08-31 13:36:23.454-07	******	\N	9804	\N	1
4253	3	47	USD	20000	Q1 Events Budget Bonus	\N	2017-08-31 13:31:48.19-07	2017-08-31 13:31:48.299-07	\N	\N	2017-08-31 13:31:48.19-07	******	1743	9804	\N	1
4255	3	522	CAD	24315	Q1 Events Budget Bonus	\N	2017-08-31 13:34:23.824-07	2017-08-31 13:34:23.995-07	\N	\N	2017-08-31 13:34:23.992-07	******	\N	9804	\N	1
4275	3	511	MXN	355406	Q1 Activity Budget Bonus	\N	2017-08-31 17:46:15.317-07	2017-08-31 17:46:15.414-07	\N	\N	2017-08-31 17:46:15.414-07	******	\N	9804	\N	1
4341	3	51	USD	500000	Plex	\N	2017-09-05 16:52:53.397-07	2017-09-05 16:52:53.532-07	\N	\N	2017-09-05 16:52:53.397-07	******	132	9804	\N	1
4397	7136	517	USD	500	Monthly donation to Women Who Code Manila	3229	2017-09-08 04:51:35.537-07	2017-09-08 04:51:40.872-07	\N	4403	2017-09-08 04:51:35.537-07	\N	510	3022	\N	1
4595	896	2	USD	10000	Donation to WWCode Austin	\N	2017-09-15 11:11:48.219-07	2017-09-15 11:11:51.991-07	\N	4602	2017-09-15 11:11:48.219-07	\N	1316	8290	\N	1
4663	7537	12	USD	3000	Donation to Women Who Code Atlanta	\N	2017-09-19 16:54:14.917-07	2017-09-19 16:54:18.279-07	\N	4672	2017-09-19 16:54:14.917-07	\N	499	2170	\N	1
2676	3	12	USD	300000	FullStory - Global Development	\N	2017-05-02 11:43:43.093-07	2017-05-02 11:43:43.175-07	\N	\N	2017-05-02 11:43:43.093-07	******	499	9804	\N	1
3216	3	51	USD	30000	Cardinal Solutions from ATL We Rise Sponsorship	\N	2017-06-14 11:25:02.76-07	2017-06-14 11:25:02.813-07	\N	\N	2017-06-14 11:25:02.76-07	******	132	9804	\N	1
3942	3	12	USD	39791	Leadership Development - Transfer from Global Development Fund	\N	2017-08-03 12:52:50.561-07	2017-08-03 12:52:50.726-07	\N	\N	2017-08-03 12:52:50.561-07	******	499	9804	\N	1
3113	3	59	USD	135000	Hackbright - Global	\N	2017-06-07 11:05:57.886-07	2017-06-07 11:05:57.948-07	2017-07-06 17:00:00-07	\N	2017-06-07 11:05:57.886-07	******	662	301	\N	1
4092	6653	12	USD	3000	Donation to Women Who Code Atlanta	\N	2017-08-15 17:24:33.077-07	2017-08-15 17:24:36.539-07	\N	4142	2017-08-15 17:24:33.077-07	\N	499	2086	\N	1
3282	3	12	USD	375000	Mozilla We Rise Sponsorship - Global	\N	2017-06-20 07:45:10.524-07	2017-06-20 07:45:10.624-07	\N	\N	2017-06-20 07:45:10.524-07	******	499	9804	\N	1
3526	3	12	USD	150000	We Rise Instrument Sponsorship - Global	\N	2017-07-05 14:30:50.159-07	2017-07-05 14:30:50.242-07	\N	\N	2017-07-05 14:30:50.159-07	******	499	9804	\N	1
3722	3	12	USD	37500	GitHub - Global	\N	2017-07-17 10:56:09.724-07	2017-07-17 10:56:09.858-07	\N	\N	2017-07-17 10:56:09.724-07	******	499	9804	\N	1
4164	3	59	USD	20000	Q1 Events Budget Bonus	\N	2017-08-24 17:03:58.407-07	2017-08-24 17:03:58.681-07	\N	\N	2017-08-24 17:03:58.407-07	******	662	9804	\N	1
4263	3	297	AUD	25098	Q1 Events Budget Bonus	\N	2017-08-31 13:46:44.422-07	2017-08-31 13:46:44.935-07	\N	\N	2017-08-31 13:46:44.422-07	******	567	9804	\N	1
2693	3	12	USD	150000	User Testing - Global Development	\N	2017-05-03 10:32:39.617-07	2017-05-03 10:32:39.663-07	\N	\N	2017-05-03 10:32:39.617-07	******	499	9804	\N	1
2677	3	51	USD	60000	Fullstory + WWCode Atlanta	\N	2017-05-02 11:45:44.196-07	2017-05-02 11:45:44.266-07	\N	\N	2017-05-02 11:45:44.196-07	******	132	9804	\N	1
3527	3	12	USD	600000	We Rise Aaron's sponsorship - global	\N	2017-07-05 14:31:31.378-07	2017-07-05 14:31:31.454-07	\N	\N	2017-07-05 14:31:31.378-07	******	499	9804	\N	1
2208	3	278	GBP	80500	Google I/O travel grant: Kanke I.	\N	2017-03-31 10:54:33.373-07	2017-03-31 10:54:33.566-07	\N	\N	2017-03-31 10:54:33.373-07	******	566	9804	\N	1
2474	3	278	GBP	85000	Travel Stipend for CONNECT	\N	2017-04-17 14:05:14.99-07	2017-04-17 14:05:15.087-07	\N	\N	2017-04-17 14:05:14.99-07	******	566	9804	\N	1
2741	3	301	EUR	16563	Regional Leadership Event: Sofia	\N	2017-05-08 08:30:18.503-07	2017-05-08 08:30:18.616-07	\N	\N	2017-05-08 08:30:18.503-07	******	574	9804	\N	1
2794	3	59	USD	90000	Adroit Resources - Global Development	\N	2017-05-11 09:41:16.673-07	2017-05-11 09:41:16.796-07	\N	\N	2017-05-11 09:41:16.673-07	******	662	9804	\N	1
3081	3	300	USD	75150	Self-driving cars	\N	2017-06-06 08:51:33.206-07	2017-06-06 08:51:33.294-07	\N	\N	2017-06-06 08:51:33.206-07	******	756	9804	\N	1
3214	3	12	USD	150000	Cardinal Solutions We Rise Sponsorship - Global	\N	2017-06-14 11:23:38.781-07	2017-06-14 11:23:39.028-07	\N	\N	2017-06-14 11:23:38.781-07	******	499	9804	\N	1
3337	3	12	USD	75000	BlueFletch - global	\N	2017-06-24 07:06:07.966-07	2017-06-24 07:06:08.082-07	\N	\N	2017-06-24 07:06:07.966-07	******	499	9804	\N	1
3448	3	59	USD	100000	Thanks to 4K 4Charity - AWS Elemental	\N	2017-06-29 13:06:41.104-07	2017-06-29 13:06:41.284-07	\N	\N	2017-06-29 13:06:41.104-07	******	662	9804	\N	1
3462	3	291	CAD	31875	WWCode Toronto support - Thanks Scotiabank!	\N	2017-06-30 10:01:01.117-07	2017-06-30 10:01:01.197-07	\N	\N	2017-06-30 10:01:01.117-07	******	527	9804	\N	1
3943	3	59	USD	39791	Leadership Development: Transfer from Global Development Fund	\N	2017-08-03 12:59:49.625-07	2017-08-03 12:59:49.877-07	\N	\N	2017-08-03 12:59:49.625-07	******	662	9804	\N	1
4261	3	289	USD	20000	Q1 Events Budget Bonus	\N	2017-08-31 13:42:53.979-07	2017-08-31 13:42:54.088-07	\N	\N	2017-08-31 13:42:53.979-07	******	528	9804	\N	1
4267	3	301	EUR	16793	Q1 Activity Budget Bonus	\N	2017-08-31 17:18:23.47-07	2017-08-31 17:18:23.564-07	\N	\N	2017-08-31 17:18:23.47-07	******	574	9804	\N	1
2470	3	267	GBP	4000	PayPal Fees to transfer Google I/O stipend	\N	2017-04-17 12:31:52.832-07	2017-04-17 12:31:52.941-07	2017-06-04 17:00:00-07	\N	2017-04-17 12:31:52.832-07	******	846	10	\N	1
4093	5616	12	USD	3000	Donation to Women Who Code Atlanta	\N	2017-08-15 17:32:21.981-07	2017-08-15 17:32:25.441-07	\N	4143	2017-08-15 17:32:21.981-07	\N	499	3440	\N	1
4667	7543	12	USD	3000	Donation to Women Who Code Atlanta	\N	2017-09-19 18:51:02.78-07	2017-09-19 18:51:06.157-07	\N	4676	2017-09-19 18:51:02.78-07	\N	499	3056	\N	1
2152	3	59	USD	20000	Google I/O travel grant: Kezia W. 	\N	2017-03-27 10:45:17.489-07	2017-03-27 10:45:17.596-07	\N	\N	2017-03-27 10:45:17.489-07	******	662	9804	\N	1
2153	3	277	USD	100000	Leadership Development: Google I/O travel grant: Chee Yim G.	\N	2017-03-27 10:52:38.07-07	2017-03-27 10:52:38.138-07	\N	\N	2017-03-27 10:52:38.07-07	******	575	9804	\N	1
2154	3	277	USD	100000	Leadership Development: Google I/O Travel Grant: Lydia L.	\N	2017-03-27 10:53:48.436-07	2017-03-27 10:53:48.659-07	\N	\N	2017-03-27 10:53:48.436-07	******	575	9804	\N	1
2209	3	278	GBP	39800	Google I/O travel grant: Anastasia D. 	\N	2017-03-31 11:01:48.379-07	2017-03-31 11:01:48.43-07	\N	\N	2017-03-31 11:01:48.379-07	******	566	9804	\N	1
2217	3	291	CAD	50000	Google I/O Travel Grant: Evangelique L.	\N	2017-03-31 16:37:30.782-07	2017-03-31 16:37:30.831-07	\N	\N	2017-03-31 16:37:30.782-07	******	527	9804	\N	1
2471	3	277	USD	9000	PayPal fees to transfer Google I/O stipend	\N	2017-04-17 12:41:07.575-07	2017-04-17 12:41:07.676-07	\N	\N	2017-04-17 12:41:07.575-07	******	575	9804	\N	1
2503	3	278	GBP	3562	PayPal Fees for Google I/O travel stipend	\N	2017-04-18 12:41:30.217-07	2017-04-18 12:41:30.305-07	\N	\N	2017-04-18 12:41:30.217-07	******	566	9804	\N	1
3209	3	278	GBP	200000	eBay 	\N	2017-06-14 10:44:57.787-07	2017-06-14 10:44:57.914-07	\N	\N	2017-06-14 10:44:57.787-07	******	566	9804	\N	1
3271	3	59	USD	135000	Hackbright - global	\N	2017-06-19 07:53:50.675-07	2017-06-19 07:53:50.74-07	\N	\N	2017-06-19 07:53:50.675-07	******	662	9804	\N	1
3702	3	291	CAD	300000	Travel Stipend for CONNECT Conference	\N	2017-07-14 10:24:36.125-07	2017-07-14 10:24:36.395-07	\N	\N	2017-07-14 10:24:36.125-07	******	527	9804	\N	1
3919	3	284	USD	39074	Funds for Director/Leadership Meeting 	\N	2017-08-02 09:30:35.556-07	2017-08-02 09:30:36.022-07	\N	\N	2017-08-02 09:30:35.556-07	******	803	9804	\N	1
4162	3	300	USD	20000	Q1 Events Budget Bonus	\N	2017-08-24 16:13:59.478-07	2017-08-24 16:13:59.588-07	\N	\N	2017-08-24 16:13:59.478-07	******	756	9804	\N	1
4228	3	59	USD	28340	Reimbursement for Travel Expenses for Leadership Development 	\N	2017-08-30 17:45:12.197-07	2017-08-30 17:45:12.304-07	\N	\N	2017-08-30 17:45:12.197-07	******	662	9804	\N	1
4244	3	284	USD	20000	Q1 Activity Budget Bonus	\N	2017-08-31 13:14:12.954-07	2017-08-31 13:14:13.054-07	\N	\N	2017-08-31 13:14:12.954-07	******	803	9804	\N	1
4439	3	259	USD	72204	Hackathon Revenue 	\N	2017-09-11 09:28:57.199-07	2017-09-11 09:28:57.34-07	\N	\N	2017-09-11 09:28:57.199-07	******	855	9804	\N	1
4861	3	259	USD	80227	Magic City Hacks - EventBrite	\N	2017-09-29 17:22:19.853-07	2017-09-29 17:22:19.938-07	2017-10-01 17:00:00-07	\N	2017-09-29 17:22:19.853-07	******	855	10	\N	1
2214	3	286	USD	20000	Leadership Development: Conference support for Karina M. 	\N	2017-03-31 15:50:23.845-07	2017-03-31 15:50:23.931-07	2017-03-31 17:00:00-07	\N	2017-03-31 15:50:23.845-07	******	953	293	\N	1
2206	3	267	GBP	79600	Google I/O Travel Grant: Rabeb O. 	\N	2017-03-31 10:20:23.87-07	2017-03-31 10:20:23.928-07	\N	\N	2017-03-31 10:20:23.87-07	******	846	9804	\N	1
2477	3	270	USD	100000	Network Development: Attend CapOne WIT 2017 Kickoff to announce partnership for re-launch	\N	2017-04-17 15:09:42.506-07	2017-04-17 15:09:42.582-07	\N	\N	2017-04-17 15:09:42.506-07	******	1006	9804	\N	1
2490	3	430	USD	100000	Google I/O Travel Grant: Yelyzaveta L.	\N	2017-04-17 15:40:40.287-07	2017-04-17 15:40:40.376-07	\N	\N	2017-04-17 15:40:40.287-07	******	858	9804	\N	1
3286	3	269	USD	6188	VMWare foundation Donation	\N	2017-06-20 11:19:09.086-07	2017-06-20 11:19:09.201-07	\N	\N	2017-06-20 11:19:09.086-07	******	833	9804	\N	1
3311	3	2	USD	270000	Google Fiber Hackathon sponsorship - Global	\N	2017-06-22 09:09:52.609-07	2017-06-22 09:09:52.694-07	\N	\N	2017-06-22 09:09:52.609-07	******	1316	9804	\N	1
4117	3	270	USD	30000	Thanks Capital One iOS summit	\N	2017-08-18 14:06:59.373-07	2017-08-18 14:06:59.461-07	\N	\N	2017-08-18 14:06:59.373-07	******	1006	9804	\N	1
4134	3	48	USD	22117	Eventbrite Donation 	\N	2017-08-21 12:56:31.822-07	2017-08-21 12:56:31.956-07	\N	\N	2017-08-21 12:56:31.822-07	******	1027	9804	\N	1
4163	3	4	USD	20000	Q1 Events Budget Bonus	\N	2017-08-24 17:00:14.416-07	2017-08-24 17:00:14.542-07	\N	\N	2017-08-24 17:00:14.416-07	******	1428	9804	\N	1
4175	3	286	USD	85319	LAWCC Event Stipend 	\N	2017-08-25 12:26:47.435-07	2017-08-25 12:26:47.924-07	\N	\N	2017-08-25 12:26:47.435-07	******	953	9804	\N	1
4189	3	300	USD	40500	Eventbrite - Interview prep at Tableau 	\N	2017-08-28 15:37:54.536-07	2017-08-28 15:37:54.727-07	\N	\N	2017-08-28 15:37:54.536-07	******	756	9804	\N	1
4236	3	279	USD	20000	Q1 Events Budget Bonus	\N	2017-08-31 12:38:24.265-07	2017-08-31 12:38:24.339-07	\N	\N	2017-08-31 12:38:24.265-07	******	1007	9804	\N	1
4239	3	294	USD	20000	Q1 Activity Budget Bonus	\N	2017-08-31 12:49:43.014-07	2017-08-31 12:49:43.098-07	\N	\N	2017-08-31 12:49:43.014-07	******	1012	9804	\N	1
4252	3	2	USD	20000	Q1 Events Budget Bonus	\N	2017-08-31 13:30:48.796-07	2017-08-31 13:30:48.888-07	\N	\N	2017-08-31 13:30:48.796-07	******	1316	9804	\N	1
2662	3	3	USD	2930	PayPal fees for Google I/O	\N	2017-05-01 17:33:45.604-07	2017-05-01 17:33:45.819-07	\N	\N	2017-05-01 17:33:45.604-07	******	1437	9804	\N	1
3285	3	47	USD	6188	VMWare foundation Donation	\N	2017-06-20 11:18:05.996-07	2017-06-20 11:18:06.086-07	\N	\N	2017-06-20 11:18:05.996-07	******	1743	9804	\N	1
3827	3	47	USD	50000	Director Development- Speaking Engagement	\N	2017-07-26 13:56:44.447-07	2017-07-26 13:56:44.602-07	\N	\N	2017-07-26 13:56:44.447-07	******	1743	9804	\N	1
4247	3	3	USD	250000	Budget Bonus 	\N	2017-08-31 13:18:02.039-07	2017-08-31 13:18:02.133-07	\N	\N	2017-08-31 13:18:02.039-07	******	1437	9804	\N	1
4254	3	3	USD	20000	Q1 Events Budget Bonus	\N	2017-08-31 13:33:33.298-07	2017-08-31 13:33:33.389-07	\N	\N	2017-08-31 13:33:33.298-07	******	1437	9804	\N	1
4271	3	195	USD	20000	Q1 Activity Budget Bonus	\N	2017-08-31 17:34:30.853-07	2017-08-31 17:34:30.991-07	\N	\N	2017-08-31 17:34:30.853-07	******	1493	9804	\N	1
\.


                                                                                                                                                                                                                                                                                                                                                                          4003.dat                                                                                            0000600 0004000 0002000 00000133165 13212311737 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        11	*****@paypal.com	*****	*****	paypal	\N	2015-11-30 10:25:48.501-08	2015-12-03 15:53:17.763-08	\N	2015-12-03 15:53:17.762-08	7	\N	278e1d07-39d6-e81d-f9ed-7c8edc09ec65	5788	2017-10-06 06:21:41.149-07	\N	f	\N
160	*****	*****	*****	stripe	\N	2016-04-01 08:09:24.215-07	2016-04-01 08:09:25.585-07	\N	\N	2	\N	c938e9d0-6fd1-4f81-a3f7-32663daf71fa	1729	2017-10-06 06:21:16.962-07	\N	f	\N
42	*****	*****	*****	stripe	\N	2016-02-02 08:52:00.333-08	2016-02-02 08:52:00.333-08	\N	\N	80	\N	b20e5c3e-e337-3eb6-f597-b286a1c98da8	4356	2017-10-06 06:21:32.177-07	\N	f	\N
27	*****	*****	*****	stripe	\N	2016-01-06 16:55:36.615-08	2016-01-06 16:55:36.615-08	\N	\N	2	\N	c7bc3e24-269c-cb2d-1a00-f02933c7f2d6	1729	2017-10-06 06:21:16.962-07	\N	f	\N
34	*****	*****	*****	stripe	\N	2016-01-18 15:54:03.69-08	2016-01-18 15:54:03.69-08	\N	\N	2	\N	82870d1a-08ad-6387-3706-7cdba98824f8	1729	2017-10-06 06:21:16.962-07	\N	f	\N
68	*****	*****	*****	stripe	\N	2016-02-16 16:12:43.167-08	2016-02-16 16:12:43.165-08	\N	\N	2	\N	bfd8eeb7-49c4-2310-aa1d-b31dc538d36d	1729	2017-10-06 06:21:16.962-07	\N	f	\N
12	*****@paypal.com	*****	*****	paypal	\N	2015-12-03 15:53:17.772-08	2015-12-03 15:54:56.087-08	2015-12-03 15:54:56.084-08	\N	7	\N	298bff81-fd7b-1603-0ac4-d123444a8c4d	5788	2017-10-06 06:21:41.149-07	\N	f	\N
19	*****@paypal.com	*****	*****	paypal	\N	2015-12-16 01:42:57.058-08	2015-12-16 10:22:05.853-08	\N	2015-12-16 10:22:05.842-08	2	\N	3fb7436f-0823-2506-8940-bfaf03ef6f47	1729	2017-10-06 06:21:16.962-07	\N	f	\N
51	*****	*****	*****	stripe	\N	2016-02-09 20:12:33.556-08	2016-02-09 20:12:33.556-08	\N	\N	30	\N	fec7a2ff-febf-5697-934c-dba95d9e5b6b	2385	2017-10-06 06:21:20.655-07	\N	f	\N
64	*****	*****	*****	stripe	\N	2016-02-15 10:46:04.238-08	2016-02-15 10:46:04.238-08	\N	\N	7	\N	7bfa0fdd-2092-0df0-6ce5-3081e7c836cb	5788	2017-10-06 06:21:41.149-07	\N	f	\N
45	*****	*****	*****	stripe	\N	2016-02-02 13:46:42.678-08	2016-02-02 13:46:42.678-08	\N	\N	8	\N	17fe8f43-6f38-2e0a-e174-40b715dc7227	8638	2017-10-06 06:21:59.38-07	\N	f	\N
43	*****	*****	*****	stripe	\N	2016-02-02 09:04:53.229-08	2016-02-02 09:04:53.229-08	\N	\N	30	\N	2d76a821-1030-d044-5d35-7a6ae7be6725	2385	2017-10-06 06:21:20.655-07	\N	f	\N
41	*****	*****	*****	stripe	\N	2016-02-02 08:36:35.761-08	2016-02-02 08:36:35.761-08	\N	\N	30	\N	ca64cf47-da09-8792-9a74-d3f97a167bb2	2385	2017-10-06 06:21:20.655-07	\N	f	\N
30	*****@paypal.com	*****	*****	paypal	\N	2016-01-12 09:53:19.259-08	2016-01-12 09:53:20.842-08	\N	2016-01-12 09:53:20.841-08	2	\N	23f70d45-68d0-88a1-4d82-3e5471855058	1729	2017-10-06 06:21:16.962-07	\N	f	\N
31	*****@paypal.com	*****	*****	paypal	\N	2016-01-12 09:53:20.88-08	2016-01-12 09:54:22.364-08	\N	2016-01-12 09:54:22.343-08	2	\N	27e23096-8ba0-670c-0d70-77b08bb9c839	1729	2017-10-06 06:21:16.962-07	\N	f	\N
119	*****@paypal.com	*****	*****	paypal	\N	2016-03-11 13:34:11.535-08	2016-03-25 21:12:54.174-07	\N	2016-03-25 21:12:54.171-07	2	\N	96c88f45-65f0-b0f9-c911-c1d1fd5d83e3	1729	2017-10-06 06:21:16.962-07	\N	f	\N
80	*****	*****	*****	stripe	\N	2016-02-25 15:45:02.363-08	2016-02-25 15:45:02.363-08	\N	\N	30	\N	2f1a44d5-533f-4c5a-cecd-ae519e57d7ec	2385	2017-10-06 06:21:20.655-07	\N	f	\N
105	*****@paypal.com	*****	*****	paypal	\N	2016-03-05 10:48:06.494-08	2016-03-10 08:53:49.77-08	\N	2016-03-10 08:53:49.769-08	2	\N	c3507577-8f04-728c-286d-c981206c8b6f	1729	2017-10-06 06:21:16.962-07	\N	f	\N
153	*****@paypal.com	*****	*****	paypal	\N	2016-03-25 21:12:54.185-07	2016-03-25 21:12:54.98-07	\N	\N	2	\N	6c7dcfe3-143f-043b-f4d7-d2f5937a90cf	1729	2017-10-06 06:21:16.962-07	\N	f	\N
124	*****	*****	*****	stripe	\N	2016-03-17 08:29:28.675-07	2016-03-17 08:29:28.674-07	\N	\N	8	\N	47cefaa2-3730-94d8-1200-ac552bd2cb24	8638	2017-10-06 06:21:59.38-07	\N	f	\N
110	*****	*****	*****	stripe	\N	2016-03-07 19:35:50.332-08	2016-03-07 19:35:50.332-08	\N	\N	8	\N	c39b9032-424b-07a6-cfa1-f884515d770f	8638	2017-10-06 06:21:59.38-07	\N	f	\N
109	*****	*****	*****	stripe	\N	2016-03-07 18:43:27.661-08	2016-03-07 18:43:27.661-08	\N	\N	2	\N	89a158e5-b676-07db-1b28-a16e2b628be1	1729	2017-10-06 06:21:16.962-07	\N	f	\N
203	*****	*****	*****	stripe	\N	2016-04-25 07:42:01.738-07	2016-04-25 07:42:02.272-07	\N	\N	30	\N	cdfcfcd6-7d69-85e4-3e95-44e8c66db235	2385	2017-10-06 06:21:20.655-07	\N	f	\N
44	*****	*****	*****	stripe	\N	2016-02-02 09:09:19.757-08	2016-02-02 09:09:19.757-08	\N	\N	30	\N	263ac67c-4591-23ec-91c7-9c2dc502053b	2385	2017-10-06 06:21:20.655-07	\N	f	\N
39	*****	*****	*****	stripe	\N	2016-01-29 14:23:51.784-08	2016-01-29 14:23:51.784-08	\N	\N	30	\N	d21074df-55fa-f2b7-b61c-ecbd8ad491a7	2385	2017-10-06 06:21:20.655-07	\N	f	\N
93	*****	*****	*****	stripe	\N	2016-03-01 20:41:57.377-08	2016-03-01 20:41:57.377-08	\N	\N	126	\N	d8374bd6-4eb8-ab53-53fd-b088766053b0	4228	2017-10-06 06:21:31.322-07	\N	f	\N
71	*****	*****	*****	stripe	\N	2016-02-18 11:54:06.513-08	2016-02-18 11:54:06.513-08	\N	\N	108	\N	7b4e14fb-0c98-4025-d962-029d143693fa	8253	2017-10-06 06:21:56.85-07	\N	f	\N
176	*****	*****	*****	stripe	\N	2016-04-14 11:12:55.955-07	2016-04-14 11:12:56.555-07	\N	\N	30	\N	6943a8b9-ddc5-e287-a837-a4de53aba7d5	2385	2017-10-06 06:21:20.655-07	\N	f	\N
587	*****	*****	*****	stripe	\N	2016-08-04 14:49:06.957-07	2016-08-04 14:49:07.534-07	\N	\N	8	\N	4d533529-2f3e-d74c-cc5d-cca05ed84e17	8638	2017-10-06 06:21:59.38-07	\N	f	\N
323	*****	*****	*****	stripe	\N	2016-05-26 17:52:12.759-07	2016-05-26 17:52:14.148-07	\N	\N	30	\N	c75d634f-b112-7eb0-7d0a-6365b98109ec	2385	2017-10-06 06:21:20.655-07	\N	f	\N
377	*****	*****	*****	stripe	\N	2016-06-06 12:04:34.62-07	2016-06-06 12:04:35.385-07	\N	\N	551	\N	e1284358-55c7-a47b-9d59-50ee2d97fab1	1442	2017-10-06 06:21:15.258-07	\N	f	\N
381	*****	*****	*****	stripe	\N	2016-06-06 17:53:45.068-07	2016-06-06 17:53:45.674-07	\N	\N	555	\N	ea7cb885-446f-1708-e2af-89fe348c0720	1848	2017-10-06 06:21:17.618-07	\N	f	\N
430	*****	*****	*****	stripe	\N	2016-06-21 09:02:53.255-07	2016-06-21 09:02:53.912-07	\N	\N	642	\N	112021dd-7914-0cef-0f54-6df87888f6b4	3533	2017-10-06 06:21:27.157-07	\N	f	\N
431	*****	*****	*****	stripe	\N	2016-06-21 09:04:57.958-07	2016-06-21 09:04:59.511-07	\N	\N	642	\N	0d117158-43bf-1184-25f0-c420120c78a4	3533	2017-10-06 06:21:27.157-07	\N	f	\N
461	*****	*****	*****	stripe	\N	2016-07-01 15:31:42.782-07	2016-07-01 15:31:43.38-07	\N	\N	686	\N	47817701-a46b-a1b3-aa9e-022572570fbb	6616	2017-10-06 06:21:46.25-07	\N	f	\N
435	*****	*****	*****	stripe	\N	2016-06-22 13:09:44.066-07	2016-06-22 13:09:44.651-07	\N	\N	646	\N	158e56b0-2a21-029b-deec-9d1a7168801e	7263	2017-10-06 06:21:50.444-07	\N	f	\N
507	*****	*****	*****	stripe	\N	2016-07-12 14:19:35.579-07	2016-07-12 14:19:36.177-07	\N	\N	30	\N	729053ee-f866-09f3-b777-1c83711c13a3	2385	2017-10-06 06:21:20.655-07	\N	f	\N
567	*****	*****	*****	stripe	\N	2016-08-02 21:54:45.226-07	2016-08-02 21:54:46.256-07	\N	\N	2	\N	d0b7320c-5d0e-4630-4f0d-211a98c5213c	1729	2017-10-06 06:21:16.962-07	\N	f	\N
572	*****	*****	*****	stripe	\N	2016-08-03 12:30:20.399-07	2016-08-03 12:30:20.964-07	\N	\N	30	\N	ea9ae80b-13c0-4c9b-3ea8-0022ebf8a268	2385	2017-10-06 06:21:20.655-07	\N	f	\N
571	*****	*****	*****	stripe	\N	2016-08-03 10:47:13.706-07	2016-08-03 10:47:14.326-07	\N	\N	896	\N	bc0fadad-5277-8d2c-e82a-4e542de916c7	8290	2017-10-06 06:21:57.079-07	\N	f	\N
703	*****	*****	*****	stripe	\N	2016-08-31 11:22:18.085-07	2016-08-31 11:22:28.874-07	\N	\N	30	\N	6ee3e97f-72d0-17b0-92bf-5494fefdd57c	2385	2017-10-06 06:21:20.655-07	\N	f	\N
288	*****	*****	*****	stripe	\N	2016-05-19 12:24:40.781-07	2016-05-19 12:24:41.33-07	\N	\N	392	\N	06688aa2-fd98-c6e4-a0c9-23565aef0cac	1568	2017-10-06 06:21:15.959-07	\N	f	\N
252	*****	*****	*****	stripe	\N	2016-05-10 10:19:56.78-07	2016-05-10 10:19:58.837-07	\N	\N	2	\N	1739f9f1-918e-4884-3a43-e529d2bbdf95	1729	2017-10-06 06:21:16.962-07	\N	f	\N
701	*****	*****	*****	stripe	\N	2016-08-31 01:34:48.855-07	2016-08-31 01:34:49.606-07	\N	\N	8	\N	4feb5782-20fb-ad10-d93a-27b8c63045de	8638	2017-10-06 06:21:59.38-07	\N	f	\N
715	*****	*****	*****	stripe	\N	2016-09-05 09:25:43.529-07	2016-09-05 09:25:44.192-07	\N	\N	30	\N	8786f1e3-fa41-56aa-7c72-ad5ac4d75af0	2385	2017-10-06 06:21:20.655-07	\N	f	\N
731	*****	*****	*****	stripe	\N	2016-09-09 20:42:49.13-07	2016-09-09 20:42:49.63-07	\N	\N	1158	\N	c9da01d6-4889-2104-2b4a-3d46e568e801	6067	2017-10-06 06:21:42.842-07	\N	f	\N
880	*****	*****	*****	stripe	\N	2016-10-06 11:36:35.196-07	2016-10-06 11:36:35.794-07	\N	\N	1438	\N	8a3ae5b5-374e-67e8-2bb9-f509501a6a8f	8045	2017-10-06 06:21:55.455-07	\N	f	\N
789	*****	*****	*****	stripe	\N	2016-09-22 11:56:45.915-07	2016-09-22 11:56:47.116-07	\N	\N	8	\N	9356d19e-945a-e506-9e7d-3f5b7062a72b	8638	2017-10-06 06:21:59.38-07	\N	f	\N
911	*****	*****	*****	stripe	\N	2016-10-15 08:47:38.174-07	2016-10-15 08:47:38.802-07	\N	\N	8	\N	fce4b4dd-515e-8a83-68de-a4b50381d18f	8638	2017-10-06 06:21:59.38-07	\N	f	\N
884	*****	*****	*****	stripe	\N	2016-10-07 09:49:14.672-07	2016-10-07 09:49:15.283-07	\N	\N	1446	\N	a3284e01-b25a-6d9c-96d4-7ab9522da032	5180	2017-10-06 06:21:37.45-07	\N	f	\N
885	*****	*****	*****	stripe	\N	2016-10-07 13:46:31.454-07	2016-10-07 13:46:32.168-07	\N	\N	8	\N	3440c5a6-df0f-9860-e75b-a33d3fec4016	8638	2017-10-06 06:21:59.38-07	\N	f	\N
1040	*****	*****	*****	stripe	\N	2016-10-31 06:27:24.403-07	2016-10-31 06:27:25.268-07	\N	\N	2	\N	31914b65-a0d8-55b9-397a-2a6279bd802a	1729	2017-10-06 06:21:16.962-07	\N	f	\N
1106	*****	*****	*****	stripe	\N	2016-11-02 15:49:22.021-07	2016-11-02 15:49:23.61-07	\N	\N	2	\N	04b6f617-80dd-7280-9ddb-575b3198b6d8	1729	2017-10-06 06:21:16.962-07	\N	f	\N
1111	*****	*****	*****	stripe	\N	2016-11-03 08:52:11.942-07	2016-11-03 08:52:12.638-07	\N	\N	8	\N	219bfeea-0968-cb4a-4cc0-1f294724c8fb	8638	2017-10-06 06:21:59.38-07	\N	f	\N
1249	*****	*****	*****	stripe	\N	2016-11-28 07:33:12.012-08	2016-11-28 07:33:12.766-08	\N	\N	1890	\N	1f5f9941-69ae-5c4b-4241-0f68676cbf64	6014	2017-10-06 06:21:42.511-07	\N	f	\N
1296	*****	*****	*****	stripe	\N	2016-11-30 08:11:39.675-08	2016-11-30 08:11:40.34-08	\N	\N	1957	\N	b345ddfd-18d7-a4af-697e-d39b163ca573	4960	2017-10-06 06:21:36.059-07	\N	f	\N
1348	*****	*****	*****	stripe	\N	2016-12-02 11:17:05.459-08	2016-12-02 11:17:06.168-08	\N	\N	8	\N	2867578b-711e-8c5d-4b7d-e4c8d96be7cd	8638	2017-10-06 06:21:59.38-07	\N	f	\N
1472	*****	*****	*****	stripe	\N	2016-12-18 17:41:58.818-08	2016-12-18 17:41:59.328-08	\N	\N	2220	\N	eef06874-d2f5-56a3-71ea-c792457de924	1831	2017-10-06 06:21:17.518-07	\N	f	\N
1553	*****	*****	*****	stripe	\N	2017-01-03 12:59:34.532-08	2017-01-03 12:59:35.653-08	\N	\N	2416	\N	72f667fc-1cf3-a16f-b171-ca0b4e212c31	3538	2017-10-06 06:21:27.168-07	\N	f	\N
8451	*****	*****	*****	stripe	\N	2017-11-16 19:13:47.776-08	2017-11-16 19:13:54.856-08	2017-11-16 19:13:54.855-08	\N	142	\N	9725aee8-a9c3-5db2-a2f1-f78c52d8c0d4	8492	\N	\N	f	USD
1616	*****	*****	*****	stripe	\N	2017-01-14 09:11:39.386-08	2017-01-14 09:11:39.965-08	\N	\N	2549	\N	9cbcb8dd-4a1f-e401-d0f6-d7122379ca25	7262	2017-10-06 06:21:50.445-07	\N	f	\N
1622	*****	*****	*****	stripe	\N	2017-01-16 10:03:53.804-08	2017-01-16 10:03:54.509-08	\N	\N	2561	\N	88208d23-834f-2647-0f95-06a2d41f1332	8146	2017-10-06 06:21:56.163-07	\N	f	\N
1701	*****	*****	*****	stripe	\N	2017-01-24 05:28:17.965-08	2017-01-24 05:28:21.097-08	\N	\N	2	\N	69b0d29e-7d06-26c8-31f7-ff97d58adb77	1729	2017-10-06 06:21:16.962-07	\N	f	\N
1645	*****	*****	*****	stripe	\N	2017-01-18 05:51:43.462-08	2017-01-18 05:51:44.621-08	\N	\N	2594	\N	60ccb727-f679-cd22-aefc-80c5702d3630	3116	2017-10-06 06:21:24.758-07	\N	f	\N
1742	*****	*****	*****	stripe	\N	2017-01-28 15:51:03.682-08	2017-01-28 15:51:05.032-08	\N	\N	2	\N	0d75c0ae-ecfe-fa63-5331-b1cd2b1bcd6c	1729	2017-10-06 06:21:16.962-07	\N	f	\N
1793	*****	*****	*****	stripe	\N	2017-01-31 07:51:34.575-08	2017-01-31 07:51:36.336-08	\N	\N	1325	\N	a262e938-a253-42d3-006d-e6c0e8316653	3210	2017-10-06 06:21:25.303-07	\N	f	\N
1744	*****	*****	*****	stripe	\N	2017-01-28 16:05:21.392-08	2017-01-28 16:05:21.978-08	\N	\N	8	\N	c085fdc2-f92c-185a-7168-d1dcf2ac103a	8638	2017-10-06 06:21:59.38-07	\N	f	\N
1801	*****	*****	*****	stripe	\N	2017-02-01 07:16:17.747-08	2017-02-01 07:16:18.471-08	\N	\N	2898	\N	2f8a8cd2-994b-8cc0-a85c-f278b2cdfefa	2232	2017-10-06 06:21:19.813-07	\N	f	\N
1811	*****	*****	*****	stripe	\N	2017-02-01 13:53:00.461-08	2017-02-01 13:53:01.901-08	\N	\N	30	\N	015dbdef-1042-c586-1839-6abe6c09dbeb	2385	2017-10-06 06:21:20.655-07	\N	f	\N
1986	*****	*****	*****	stripe	\N	2017-02-22 10:25:00.347-08	2017-02-22 10:25:00.347-08	\N	\N	2	\N	9e2cf7be-1208-512f-e8b0-2ecd2b6bdf71	1729	2017-10-06 06:21:16.962-07	\N	f	\N
2071	*****	*****	*****	stripe	\N	2017-03-04 08:55:18.286-08	2017-03-04 08:55:19.53-08	\N	\N	2	\N	11849421-e3df-3689-2f20-1f7baac933a3	1729	2017-10-06 06:21:16.962-07	\N	f	\N
2074	*****	*****	*****	stripe	\N	2017-03-04 21:40:45.496-08	2017-03-04 21:40:48.337-08	\N	\N	2	\N	c58bce76-6510-d458-0025-910f61f1713d	1729	2017-10-06 06:21:16.962-07	\N	f	\N
2208	*****	*****	*****	stripe	\N	2017-03-21 20:28:09.493-07	2017-03-21 20:28:11.234-07	\N	\N	2	\N	8bbcf553-3cbc-60fd-7850-fcbf1e98997c	1729	2017-10-06 06:21:16.962-07	\N	f	\N
2246	*****	*****	*****	stripe	\N	2017-03-25 07:33:48.263-07	2017-03-25 07:33:51.315-07	\N	\N	2	\N	a2e463de-c9fa-7ffa-246f-14cdb46e31f6	1729	2017-10-06 06:21:16.962-07	\N	f	\N
2247	*****	*****	*****	stripe	\N	2017-03-25 08:36:50.843-07	2017-03-25 08:36:53.712-07	\N	\N	2	\N	47ecb35f-11cd-9d82-687b-504afbe5acdf	1729	2017-10-06 06:21:16.962-07	\N	f	\N
7547	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.216-08	\N	\N	\N	\N	\N	bfcd8047-a6d9-f967-d77e-f0d8d6bd1899	522	\N	\N	t	CAD
2535	*****	*****	*****	stripe	\N	2017-04-10 18:09:47.541-07	2017-04-10 18:09:48.354-07	\N	\N	4153	\N	d4dbb6f5-cd82-806c-8bb1-395d59c8b01c	7368	2017-10-06 06:21:51.079-07	\N	f	\N
2546	*****	*****	*****	stripe	\N	2017-04-11 19:05:32.807-07	2017-04-11 19:05:33.502-07	\N	\N	4173	\N	f1eeaa94-c15d-8b15-65a4-72eb52f947d9	4475	2017-10-06 06:21:32.972-07	\N	f	\N
2589	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 07:29:51.502-07	2017-04-17 07:29:51.502-07	\N	2017-04-17 12:34:05.252-07	3	2018-04-17 07:29:50.969-07	95afe318-ed6f-ed09-cda3-7f5f67345e0a	9804	2017-10-06 06:21:12.319-07	\N	f	\N
2592	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 12:32:22.818-07	2017-04-17 12:32:22.818-07	\N	2017-04-17 12:34:05.253-07	3	2018-04-17 12:32:22.311-07	a2158b5c-2222-06fc-27fc-c648d5b6f3c7	9804	2017-10-06 06:21:12.319-07	\N	f	\N
2593	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 12:32:25.362-07	2017-04-17 12:32:25.362-07	\N	2017-04-17 12:34:05.254-07	3	2018-04-17 12:32:24.902-07	aecc1c3c-08ac-14b4-3644-5262fa8fca90	9804	2017-10-06 06:21:12.319-07	\N	f	\N
2595	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 12:33:26.483-07	2017-04-17 12:33:26.483-07	\N	2017-04-17 12:34:05.255-07	3	2018-04-17 12:33:26.015-07	783f4a10-04c8-adef-63a8-7583ecf953cb	9804	2017-10-06 06:21:12.319-07	\N	f	\N
2659	*****	*****	*****	stripe	\N	2017-04-20 14:31:48-07	2017-04-20 14:31:49.294-07	\N	\N	8	\N	a0b9ce99-6b56-54c9-fd6a-477a11adf383	8638	2017-10-06 06:21:59.38-07	\N	f	\N
2757	*****	*****	*****	stripe	\N	2017-05-01 10:13:32.205-07	2017-05-01 10:13:32.817-07	\N	\N	4550	\N	64ff8dbf-197d-c42c-7323-a9fc733470a7	1788	2017-10-06 06:21:17.292-07	\N	f	\N
2749	*****	*****	*****	stripe	\N	2017-04-30 18:40:26.919-07	2017-04-30 18:40:28.231-07	\N	\N	3419	\N	b3bc57d4-06ca-56e2-8f61-20d3694c9d1a	3898	2017-10-06 06:21:29.309-07	\N	f	\N
2776	*****	*****	*****	stripe	\N	2017-05-02 02:28:50.274-07	2017-05-02 02:28:53.588-07	\N	\N	2	\N	1455ee06-bb57-9e0d-434e-3ce90f0fdaf1	1729	2017-10-06 06:21:16.962-07	\N	f	\N
2860	*****	*****	*****	stripe	\N	2017-05-09 11:14:19.686-07	2017-05-09 11:14:21.05-07	\N	\N	4720	\N	ea443d65-326e-9e8d-f6c8-f48ff6521e2a	1586	2017-10-06 06:21:16.056-07	\N	f	\N
2888	*****	*****	*****	stripe	\N	2017-05-10 16:45:43.414-07	2017-05-10 16:45:44.785-07	\N	\N	4749	\N	d433c064-4fc1-3e0d-f9ef-c83997873fbb	2804	2017-10-06 06:21:22.994-07	\N	f	\N
2922	*****	*****	*****	stripe	\N	2017-05-15 05:07:56.825-07	2017-05-15 05:07:57.556-07	\N	\N	4834	\N	18ceee82-6d15-5ed1-918e-09ecc1e7cd62	2984	2017-10-06 06:21:24.011-07	\N	f	\N
3246	*****@paypal.com	*****	*****	paypal	\N	2017-06-09 07:30:30.144-07	2017-06-09 07:30:30.144-07	\N	\N	3	2018-06-09 07:30:29.53-07	441f1f52-7dda-7a6e-7c2d-6cd1c4fd62ad	9804	2017-10-06 06:21:12.319-07	\N	f	\N
3211	*****	*****	*****	stripe	\N	2017-06-07 03:44:36.677-07	2017-06-07 03:44:37.305-07	\N	\N	5256	\N	fda0e91e-2368-5264-cd84-5f518f53a1dc	8319	2017-10-06 06:21:57.253-07	\N	f	\N
3297	*****	*****	*****	stripe	\N	2017-06-13 18:22:49.791-07	2017-06-13 18:22:50.502-07	\N	\N	3825	\N	abd04477-50c7-47de-49d6-7962dedd83f9	4527	2017-10-06 06:21:33.301-07	\N	f	\N
3566	*****	*****	*****	stripe	\N	2017-07-03 05:00:46.547-07	2017-07-03 05:00:47.55-07	\N	\N	5256	\N	93c0f09e-f821-a1b5-4255-d729480ef766	8319	2017-10-06 06:21:57.253-07	\N	f	\N
3663	*****	*****	*****	stripe	\N	2017-07-08 12:45:50.791-07	2017-07-08 12:45:52.091-07	\N	\N	5939	\N	2eaf3893-eac0-23df-eabf-127244692dcb	4707	2017-10-06 06:21:34.399-07	\N	f	\N
3779	*****	*****	*****	stripe	\N	2017-07-16 20:18:20.858-07	2017-07-16 20:18:21.562-07	\N	\N	6100	\N	98820a3c-1b3d-a132-aa55-633486741bf6	4802	2017-10-06 06:21:34.997-07	\N	f	\N
3818	*****	*****	*****	stripe	\N	2017-07-19 14:21:42.406-07	2017-07-19 14:21:43.045-07	\N	\N	896	\N	2bab7313-3384-d163-05a5-a92f7d302366	8290	2017-10-06 06:21:57.079-07	\N	f	\N
3951	*****	*****	*****	stripe	\N	2017-07-31 21:46:24.689-07	2017-07-31 21:46:26.407-07	\N	\N	1325	\N	1ebef7ae-0564-b7b8-18a5-8a745b31e558	3210	2017-10-06 06:21:25.303-07	\N	f	\N
7545	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.216-08	\N	\N	\N	\N	\N	a60b15c7-647b-f843-47ca-380d70c2e975	516	\N	\N	t	USD
7584	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.222-08	\N	\N	\N	\N	\N	18fed5ce-2e0e-6bfb-7e27-390956760d65	259	\N	\N	t	USD
4144	*****	*****	*****	stripe	\N	2017-08-15 18:57:31.062-07	2017-08-15 18:57:31.796-07	\N	\N	6656	\N	5ac7ad6a-4cf7-1a19-c9d3-bc125d1a87c8	3919	2017-10-06 06:21:29.446-07	\N	f	\N
4101	*****	*****	*****	stripe	\N	2017-08-14 14:46:21.008-07	2017-08-14 14:46:22.04-07	\N	\N	6604	\N	4c94699a-3ab3-784c-22f8-dd8b99e716fa	7701	2017-10-06 06:21:53.25-07	\N	f	\N
7537	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.215-08	\N	\N	\N	\N	\N	1bff3b92-604b-2201-f71a-076950838848	279	\N	\N	t	USD
7519	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.212-08	\N	\N	\N	\N	\N	0ec4339a-7dc3-f3a3-4b44-54eed1aee298	272	\N	\N	t	USD
7571	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.22-08	\N	\N	\N	\N	\N	7cd3a1da-f608-17a2-257b-6de751f2b3b1	293	\N	\N	t	CAD
7608	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.225-08	\N	\N	\N	\N	\N	7823474f-7fb6-d928-7f9c-cb7f154b80b8	284	\N	\N	t	USD
7527	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.214-08	\N	\N	\N	\N	\N	1b10bb89-9617-7e10-f19a-15867c0709be	48	\N	\N	t	USD
7583	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.221-08	\N	\N	\N	\N	\N	e0568972-b728-01da-0849-0d3b651007ea	241	\N	\N	t	USD
7407	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.197-08	\N	\N	\N	\N	\N	dee31f68-24dc-58df-9617-f9bf21fed908	299	\N	\N	t	MXN
7546	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.216-08	\N	\N	\N	\N	\N	d0041b0b-d718-f8b5-aeff-94ab1d7e37de	290	\N	\N	t	USD
7701	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.241-08	\N	\N	\N	\N	\N	f5a4117b-7cb5-e5c8-c20a-821a634aa092	289	\N	\N	t	USD
7868	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.272-08	\N	\N	\N	\N	\N	58c89ed5-f854-347e-7cab-f4f66b569fcd	15	\N	\N	t	USD
4411	*****	*****	*****	stripe	\N	2017-09-08 14:45:25.17-07	2017-09-08 14:45:28.319-07	\N	\N	2	\N	f532adb3-d5d6-882c-67bd-4aa3b717299d	1729	2017-10-06 06:21:16.962-07	\N	f	\N
7923	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.286-08	\N	\N	\N	\N	\N	6fbb5c5f-0d45-ad57-b0cf-8fd78b8bb252	430	\N	\N	t	USD
7972	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.295-08	\N	\N	\N	\N	\N	c8fdba3e-b95d-ea8d-0eee-7d02b7b37d63	519	\N	\N	t	USD
8090	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.322-08	\N	\N	\N	\N	\N	2e258287-e2f5-bfe5-b8d5-4e92b13e1384	264	\N	\N	t	GBP
7828	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.265-08	\N	\N	\N	\N	\N	ebb4afb0-a755-c835-d93a-d56e556de394	51	\N	\N	t	USD
7880	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.274-08	\N	\N	\N	\N	\N	318582ba-728a-f246-06cd-27817db24004	291	\N	\N	t	CAD
7913	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.284-08	\N	\N	\N	\N	\N	514ec427-73cb-5fda-9e5c-5ba2c37ab405	261	\N	\N	t	USD
7927	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.287-08	\N	\N	\N	\N	\N	7a7d2f30-b3a5-cb00-d4b2-62b47689e0ff	515	\N	\N	t	USD
7946	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.291-08	\N	\N	\N	\N	\N	7a6eed8e-a81a-d46e-5b08-b661f8a687a9	512	\N	\N	t	USD
7955	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.292-08	\N	\N	\N	\N	\N	8bac2cdd-4b55-5753-e04a-92a8f66e93e1	511	\N	\N	t	MXN
7910	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.283-08	\N	\N	\N	\N	\N	858905fd-2a01-2813-939c-a5134f6a1692	523	\N	\N	t	EUR
7916	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.284-08	\N	\N	\N	\N	\N	bb47452e-2d87-3c6a-df65-081ead74ebeb	269	\N	\N	t	USD
7920	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.285-08	\N	\N	\N	\N	\N	4d2a3c9b-c2b5-ac11-7327-7d6e8133cb87	265	\N	\N	t	USD
7942	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.29-08	\N	\N	\N	\N	\N	deb56f84-dd91-48f9-ca9d-b4f92af9ab87	294	\N	\N	t	USD
7995	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.308-08	\N	\N	\N	\N	\N	1582524e-81af-b57b-ddfd-d2a4dd9a49e3	510	\N	\N	t	USD
4672	*****	*****	*****	stripe	\N	2017-09-19 16:54:14.906-07	2017-09-19 16:54:15.629-07	\N	\N	7537	\N	58255d22-b5ce-b30f-83f4-4d03d12b42d8	2170	2017-10-06 06:21:19.454-07	\N	f	\N
8183	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.341-08	\N	\N	\N	\N	\N	e409310e-0865-35ad-33a7-52daa74e1f84	525	\N	\N	t	USD
8189	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.342-08	\N	\N	\N	\N	\N	bbd1c25e-3b85-e3ad-a196-6d11ca1c204e	3	\N	\N	t	USD
8193	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.342-08	\N	\N	\N	\N	\N	f7eed6e8-45c8-cc9e-a8d3-ccd9e8c5c544	520	\N	\N	t	USD
8204	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.344-08	\N	\N	\N	\N	\N	f83a95f6-ef83-b035-3d78-99acc6695722	524	\N	\N	t	EUR
8392	*****	*****	*****	opencollective	\N	2017-11-15 13:56:01.03-08	\N	\N	\N	\N	\N	2c06b173-013e-c1cf-5f38-e5f614a0c336	9804	\N	\N	t	USD
8186	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.341-08	\N	\N	\N	\N	\N	4998c8c2-1fea-37cd-c96c-245295706837	47	\N	\N	t	USD
8192	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.342-08	\N	\N	\N	\N	\N	7355f9f0-2d90-f5ac-9c55-f7f4a385bc1b	2	\N	\N	t	USD
8196	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.343-08	\N	\N	\N	\N	\N	d670bc51-252a-cde8-fbe3-5d8dc02e7c14	283	\N	\N	t	EUR
8207	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.345-08	\N	\N	\N	\N	\N	3782798c-1e57-ddaa-b365-bed84082b931	13	\N	\N	t	USD
8211	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.346-08	\N	\N	\N	\N	\N	f1e322a9-f03f-c034-1b40-2e90f4158f8b	281	\N	\N	t	AUD
8216	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.347-08	\N	\N	\N	\N	\N	26c3f593-5a2b-e4c8-2757-b32626c2cefb	263	\N	\N	t	USD
8220	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.348-08	\N	\N	\N	\N	\N	b94ba728-e1fd-46d4-6680-acfe1de089f9	295	\N	\N	t	USD
8226	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.349-08	\N	\N	\N	\N	\N	dfaa8908-521b-1d62-d87d-3a64541e3926	286	\N	\N	t	USD
4675	*****	*****	*****	stripe	\N	2017-09-19 18:48:29.798-07	2017-09-19 18:48:30.544-07	\N	\N	7542	\N	4b5bcc16-4388-9300-7335-d124e7dc62f4	5599	2017-10-06 06:21:39.999-07	\N	f	\N
4761	*****	*****	*****	stripe	\N	2017-09-23 08:30:44.213-07	2017-09-23 08:30:47.166-07	\N	\N	2	\N	1bac1c9a-413d-9618-05fc-c2e4c3fd3389	1729	2017-10-06 06:21:16.962-07	\N	f	\N
8187	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.341-08	\N	\N	\N	\N	\N	0d2076ec-979c-079a-eba4-4062ac81b2b0	282	\N	\N	t	MXN
8191	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.342-08	\N	\N	\N	\N	\N	b6f5a7ac-ca66-41c7-1d4d-3456115a3b90	14	\N	\N	t	USD
8197	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.343-08	\N	\N	\N	\N	\N	8e59acda-b18e-4899-f3c5-c2e717976a79	276	\N	\N	t	USD
8201	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.343-08	\N	\N	\N	\N	\N	193b7647-84b8-666a-992a-94699d9c74fb	10	\N	\N	t	MXN
8206	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.345-08	\N	\N	\N	\N	\N	934f828d-b390-1913-491c-0f041842065c	517	\N	\N	t	USD
8212	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.346-08	\N	\N	\N	\N	\N	cfe24529-149b-fc2e-26f4-7712ae7f0af1	274	\N	\N	t	USD
8217	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.348-08	\N	\N	\N	\N	\N	d8870185-8a4f-8706-500d-9670aaa04d93	521	\N	\N	t	USD
8223	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.349-08	\N	\N	\N	\N	\N	a025babd-4651-18ef-2d5e-c6806477bbeb	285	\N	\N	t	USD
8227	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.349-08	\N	\N	\N	\N	\N	060149a1-5ff0-9b86-f187-2624d9b89fa4	273	\N	\N	t	USD
8190	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.342-08	\N	\N	\N	\N	\N	4366dca4-aece-9381-71f3-08cf8ca0f890	4	\N	\N	t	USD
8195	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.343-08	\N	\N	\N	\N	\N	540904bc-b3f8-e395-715a-c30e34423211	292	\N	\N	t	USD
8200	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.343-08	\N	\N	\N	\N	\N	57502018-777c-b67e-8d85-c3dde7eaad3d	267	\N	\N	t	GBP
8205	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.344-08	\N	\N	\N	\N	\N	b69b531b-88b4-d7cb-1263-9fad0107ad96	277	\N	\N	t	USD
8210	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.346-08	\N	\N	\N	\N	\N	2ef84118-3769-32c3-d70b-39e42a38afdb	278	\N	\N	t	GBP
8215	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.347-08	\N	\N	\N	\N	\N	94918770-111b-4e07-9c39-c7aedf58bbfa	298	\N	\N	t	EUR
8221	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.348-08	\N	\N	\N	\N	\N	eeeac28b-a056-1d16-5018-fc8d39e43f87	280	\N	\N	t	USD
8225	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.349-08	\N	\N	\N	\N	\N	cc4d3e88-c194-6bb9-d884-353361ecc044	260	\N	\N	t	USD
4790	*****	*****	*****	stripe	\N	2017-09-25 12:41:50.213-07	2017-09-25 12:41:52.381-07	\N	\N	2	\N	a0a8a11e-5fcc-6f66-4360-d228bcfece6c	1729	2017-10-06 06:21:16.962-07	\N	f	\N
8342	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.367-08	2017-11-27 10:24:50.286-08	\N	\N	\N	\N	ad641b25-d118-88a6-3727-f2a1d0bf7595	59	2017-11-27 10:24:50.286-08	\N	t	USD
4897	*****	*****	*****	stripe	\N	2017-10-02 04:59:54.062-07	2017-10-02 04:59:56.817-07	\N	\N	2	\N	f5878ca9-5a13-a1e8-5f4e-c75e22cee9e6	1729	2017-10-06 06:21:16.962-07	\N	f	\N
26	*****@paypal.com	*****	*****	paypal	\N	2015-12-18 12:07:43.76-08	2016-05-26 08:38:39.069-07	2015-12-18 13:52:39.247-08	2016-05-26 08:38:39.068-07	3	\N	7aa912c4-9000-64cb-4fa8-10affdec104e	9804	2017-10-06 06:21:12.319-07	\N	f	\N
971	*****@paypal.com	*****	*****	paypal	\N	2016-10-22 03:52:05.33-07	2016-10-22 03:52:05.881-07	\N	2016-10-27 14:01:07.137-07	3	\N	8d905921-940d-00ae-a0c6-ca2829c80b61	9804	2017-10-06 06:21:12.319-07	\N	f	\N
8646	*****	*****	*****	stripe	\N	2017-11-28 13:30:13.869-08	2017-11-29 05:34:28.33-08	2017-11-28 13:30:22.028-08	\N	9296	\N	4f2e8ff0-9546-a690-538b-1aa65845c481	10660	\N	\N	f	USD
9	*****@paypal.com	*****	*****	paypal	\N	2015-11-23 10:13:00.576-08	2015-12-15 19:05:25.484-08	2015-11-30 09:00:17.828-08	2015-12-15 19:05:25.484-08	2	\N	6c2734ac-dda8-fa6a-abaa-d7ec026db3f1	1729	2017-10-06 06:21:16.962-07	\N	f	\N
18	*****@paypal.com	*****	*****	paypal	\N	2015-12-16 01:42:53.531-08	2015-12-16 01:42:57.019-08	\N	2015-12-16 01:42:57.018-08	2	\N	6d0ceb8b-ce43-ca8a-ed97-40f3d3037f69	1729	2017-10-06 06:21:16.962-07	\N	f	\N
17	*****@paypal.com	*****	*****	paypal	\N	2015-12-15 19:05:01.805-08	2015-12-16 10:22:39.715-08	2015-12-15 19:05:25.467-08	2015-12-16 10:22:39.714-08	2	\N	2a214f81-2880-60ba-499b-7389bc902173	1729	2017-10-06 06:21:16.962-07	\N	f	\N
24	*****@paypal.com	*****	*****	paypal	\N	2015-12-16 10:28:34.146-08	2015-12-16 10:28:36.228-08	\N	2015-12-16 10:28:36.227-08	2	\N	790c6141-322d-fceb-37e9-61e1d79a8a9f	1729	2017-10-06 06:21:16.962-07	\N	f	\N
35	*****@paypal.com	*****	*****	paypal	\N	2016-01-21 22:24:39.343-08	2016-01-23 10:23:58.964-08	2016-01-21 22:25:25.199-08	2016-01-23 10:23:58.964-08	2	\N	8d9ac656-54c6-c22d-5938-b58065a87e48	1729	2017-10-06 06:21:16.962-07	\N	f	\N
36	*****@paypal.com	*****	*****	paypal	\N	2016-01-23 10:23:35.682-08	2016-03-10 08:54:14.551-08	2016-01-23 10:23:58.941-08	2016-03-10 08:54:14.542-08	2	\N	0fc83e8e-19a9-bb4e-2019-c6f21e260579	1729	2017-10-06 06:21:16.962-07	\N	f	\N
117	*****@paypal.com	*****	*****	paypal	\N	2016-03-10 08:53:49.777-08	2016-03-10 08:54:14.484-08	2016-03-10 08:54:14.479-08	\N	2	\N	3dcfd0da-a07a-3b3a-7c37-570d535204e7	1729	2017-10-06 06:21:16.962-07	\N	f	\N
46	*****	*****	*****	stripe	\N	2016-02-02 15:09:03.515-08	2016-02-02 15:09:03.515-08	\N	\N	2	\N	141679e0-e06e-5fed-528a-85322f90452c	1729	2017-10-06 06:21:16.962-07	\N	f	\N
494	*****	*****	*****	stripe	\N	2016-07-08 09:25:56.621-07	2016-07-08 09:25:58.207-07	\N	\N	2	\N	0e51b31b-6525-6ade-ef87-032eabeae4d4	1729	2017-10-06 06:21:16.962-07	\N	f	\N
495	*****	*****	*****	stripe	\N	2016-07-08 10:24:14.577-07	2016-07-08 10:24:15.71-07	\N	\N	2	\N	2bbfa1d0-cb29-1794-64f4-2aba5b23639e	1729	2017-10-06 06:21:16.962-07	\N	f	\N
524	*****	*****	*****	stripe	\N	2016-07-18 14:00:51.641-07	2016-07-18 14:00:52.921-07	\N	\N	2	\N	6ec5aaeb-b292-59bc-6aaf-35e7d55a0967	1729	2017-10-06 06:21:16.962-07	\N	f	\N
4403	*****	*****	*****	stripe	\N	2017-09-08 04:51:35.517-07	2017-09-08 04:51:36.157-07	\N	\N	7136	\N	b541a6ba-ac84-e00b-acab-398c6ca45425	3022	2017-10-06 06:21:24.235-07	\N	f	\N
1647	*****	*****	*****	stripe	\N	2017-01-18 05:54:47.775-08	2017-01-18 05:54:48.732-08	\N	\N	2594	\N	5c563b88-72ba-67f8-092e-fc75b1f5aee3	3116	2017-10-06 06:21:24.758-07	\N	f	\N
2855	*****	*****	*****	stripe	\N	2017-05-08 22:59:11.913-07	2017-05-08 22:59:13.104-07	\N	\N	4711	\N	3d8f7aca-0253-4064-2464-4b7d327619f8	3178	2017-10-06 06:21:25.102-07	\N	f	\N
432	*****	*****	*****	stripe	\N	2016-06-21 09:06:02.746-07	2016-06-21 09:06:03.475-07	\N	\N	642	\N	43c002ac-9f5a-b5d6-d7a5-830675be6c4a	3533	2017-10-06 06:21:27.157-07	\N	f	\N
4143	*****	*****	*****	stripe	\N	2017-08-15 17:32:21.969-07	2017-08-15 17:32:22.732-07	\N	\N	5616	\N	153ddddf-9e6a-b77e-2a26-3463c3a2765a	3440	2017-10-06 06:21:26.61-07	\N	f	\N
1804	*****	*****	*****	stripe	\N	2017-02-01 09:30:44.023-08	2017-02-01 09:30:45.232-08	\N	\N	2906	\N	e518790a-d4f4-9248-64ba-bfcabff47975	4881	2017-10-06 06:21:35.529-07	\N	f	\N
2104	*****	*****	*****	stripe	\N	2017-03-09 10:29:52.21-08	2017-03-09 10:29:53.195-08	\N	\N	3442	\N	66763436-954f-8df6-862a-bf131015e265	7809	2017-10-06 06:21:53.936-07	\N	f	\N
159	*****	*****	*****	stripe	\N	2016-04-01 07:33:31.759-07	2016-04-01 07:33:32.893-07	\N	\N	8	\N	6ef7a94e-4546-263c-05e3-c60bf7a1038d	8638	2017-10-06 06:21:59.38-07	\N	f	\N
773	*****	*****	*****	stripe	\N	2016-09-20 13:58:49.788-07	2016-09-20 13:58:50.526-07	\N	\N	1244	\N	08b19f53-a530-8c78-c61f-e9f5b6cedbf3	4301	2017-10-06 06:21:31.768-07	\N	f	\N
1262	*****	*****	*****	stripe	\N	2016-11-29 10:35:19.012-08	2016-11-29 10:35:20.055-08	\N	\N	2	\N	fddcb0ee-441d-f84f-96a6-1850edcc6ebf	1729	2017-10-06 06:21:16.962-07	\N	f	\N
1471	*****	*****	*****	stripe	\N	2016-12-18 17:41:26.69-08	2016-12-18 17:41:27.187-08	\N	\N	2220	\N	c6b99ff6-1dbe-d104-1dfb-a6ca738f58c8	1831	2017-10-06 06:21:17.518-07	\N	f	\N
2091	*****	*****	*****	stripe	\N	2017-03-07 13:36:22.758-08	2017-03-07 13:36:23.955-08	\N	\N	8	\N	93c3cd9f-4226-d610-e528-6ec3ca174821	8638	2017-10-06 06:21:59.38-07	\N	f	\N
2030	*****	*****	*****	stripe	\N	2017-02-27 16:25:15.595-08	2017-02-27 16:25:16.385-08	\N	\N	3301	\N	170c3ccb-be7b-4168-94a4-3e000ec2f2ad	4726	2017-10-06 06:21:34.531-07	\N	f	\N
2438	*****	*****	*****	stripe	\N	2017-04-04 12:51:02.77-07	2017-04-04 12:51:03.349-07	\N	\N	3999	\N	2180bff2-1db1-2210-a77d-cda924abfc67	2977	2017-10-06 06:21:23.976-07	\N	f	\N
4967	*****	*****	*****	stripe	\N	2017-10-06 06:38:03.592-07	2017-10-17 08:16:23.597-07	2017-10-17 08:16:23.597-07	\N	8	\N	05ff5572-10da-e6d5-605d-2bf663a9cf09	8638	\N	\N	f	USD
2847	*****	*****	*****	stripe	\N	2017-05-08 13:06:11.209-07	2017-05-08 13:06:11.921-07	\N	\N	8	\N	8f05e6f8-8c35-33a2-809c-75b63cdd728a	8638	2017-10-06 06:21:59.38-07	\N	f	\N
4142	*****	*****	*****	stripe	\N	2017-08-15 17:24:33.056-07	2017-08-15 17:24:33.762-07	\N	\N	6653	\N	02ff124f-5239-e3e8-c400-fec3f2497428	2086	2017-10-06 06:21:18.992-07	\N	f	\N
3217	*****	*****	*****	stripe	\N	2017-06-07 09:24:53.551-07	2017-06-07 09:24:54.216-07	\N	\N	5267	\N	dc000454-6d90-88c6-73e2-68bdb68fb9c6	2300	2017-10-06 06:21:20.208-07	\N	f	\N
1646	*****	*****	*****	stripe	\N	2017-01-18 05:53:28.297-08	2017-01-18 05:53:29.29-08	\N	\N	2594	\N	3d3cae26-387c-6f4c-0c8c-81d000fb81a9	3116	2017-10-06 06:21:24.758-07	\N	f	\N
320	*****@paypal.com	*****	*****	paypal	\N	2016-05-26 08:37:59.825-07	2016-05-26 08:38:38.996-07	2016-05-26 08:38:38.994-07	2016-08-03 14:40:05.198-07	3	\N	0fa69d50-a6dd-4baa-378c-c57ba5703b9e	9804	2017-10-06 06:21:12.319-07	\N	f	\N
25	*****@paypal.com	*****	*****	paypal	\N	2015-12-16 10:28:36.264-08	2016-01-12 09:52:16.325-08	2015-12-16 10:29:24.829-08	2016-01-12 09:52:16.323-08	2	\N	e2ee06d0-5c9d-390b-7fe4-f445d23a756e	1729	2017-10-06 06:21:16.962-07	\N	f	\N
4676	*****	*****	*****	stripe	\N	2017-09-19 18:51:02.771-07	2017-09-19 18:51:03.417-07	\N	\N	7543	\N	81048547-20ac-6537-c1d5-67c837384ca8	3056	2017-10-06 06:21:24.417-07	\N	f	\N
23	*****@paypal.com	*****	*****	paypal	\N	2015-12-16 10:22:06.064-08	2015-12-16 10:29:24.85-08	2015-12-16 10:22:39.681-08	2015-12-16 10:29:24.848-08	2	\N	c978f2b9-2f34-ba53-daee-d4b06fe718d2	1729	2017-10-06 06:21:16.962-07	\N	f	\N
32	*****@paypal.com	*****	*****	paypal	\N	2016-01-12 09:54:22.442-08	2016-01-21 22:25:25.222-08	2016-01-12 09:54:45.399-08	2016-01-21 22:25:25.222-08	2	\N	c8db0f0d-98e9-7fc3-ade5-9f6491985291	1729	2017-10-06 06:21:16.962-07	\N	f	\N
29	*****@paypal.com	*****	*****	paypal	\N	2016-01-12 09:51:35.761-08	2016-01-12 09:54:45.421-08	2016-01-12 09:52:16.235-08	2016-01-12 09:54:45.421-08	2	\N	3a1bc1ff-a2a7-0ea5-b639-e7db9485f907	1729	2017-10-06 06:21:16.962-07	\N	f	\N
385	*****	*****	*****	stripe	\N	2016-06-09 10:28:10.609-07	2016-06-09 10:28:11.319-07	\N	\N	8	\N	8d3da34f-96e4-fdd8-5944-bed1e03ae90e	8638	2017-10-06 06:21:59.38-07	\N	f	\N
4602	*****	*****	*****	stripe	\N	2017-09-15 11:11:48.207-07	2017-09-15 11:11:49.029-07	\N	\N	896	\N	67bd77ae-5164-195a-ac89-c5646c56c482	8290	2017-10-06 06:21:57.079-07	\N	f	\N
90	*****	*****	*****	stripe	\N	2016-02-29 17:35:13.096-08	2016-02-29 17:35:13.096-08	\N	\N	8	\N	79e00f97-e63b-7036-0cba-b07249f82e5b	8638	2017-10-06 06:21:59.38-07	\N	f	\N
189	*****@paypal.com	*****	*****	paypal	\N	2016-04-20 07:14:38.754-07	2016-04-20 07:15:18.774-07	2016-04-20 07:15:18.772-07	\N	8	\N	732b2b65-e203-c943-b751-6a85a5a0c4ad	8638	2017-10-06 06:21:59.38-07	\N	f	\N
1044	*****@paypal.com	*****	*****	paypal	\N	2016-10-31 14:33:13-07	2016-10-31 14:34:17.306-07	2016-10-31 14:34:17.306-07	2016-11-03 12:34:26.577-07	3	\N	0a6edb08-b0dd-fb67-f774-71a45791de05	9804	2017-10-06 06:21:12.319-07	\N	f	\N
1115	*****@paypal.com	*****	*****	paypal	\N	2016-11-03 12:33:52.773-07	2016-11-03 12:34:26.403-07	2016-11-03 12:34:26.402-07	2016-11-03 12:41:28.484-07	3	\N	6d6313b6-2198-a91d-2405-6323625a3938	9804	2017-10-06 06:21:12.319-07	\N	f	\N
4972	*****	*****	*****	stripe	\N	2017-10-06 10:46:32.257-07	2017-10-17 08:36:33.623-07	2017-10-17 08:36:33.623-07	\N	30	\N	7cf80f46-f6af-1957-8ea4-5791daf1b6ae	2385	\N	\N	f	USD
2180	*****@paypal.com	*****	*****	paypal	\N	2017-03-17 08:34:13.62-07	2017-03-22 13:58:30.022-07	2017-03-22 13:58:30.021-07	2017-03-22 13:59:49.26-07	3	2018-03-17 08:34:13.106-07	91e8bc3a-df6b-c20a-64af-0064a1c5226b	9804	2017-10-06 06:21:12.319-07	\N	f	\N
2597	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 14:08:47.699-07	2017-04-17 14:08:47.699-07	\N	2017-04-17 14:17:31.148-07	3	2018-04-17 14:08:47.299-07	5999648d-82ae-385d-1d65-e5029d31fcd7	9804	2017-10-06 06:21:12.319-07	\N	f	\N
1190	*****@paypal.com	*****	*****	paypal	\N	2016-11-18 13:02:28.687-08	2016-11-18 13:02:50.197-08	2016-11-18 13:02:50.193-08	2016-11-18 13:03:32.325-08	3	\N	bc4dd22a-2529-df10-fbd8-bcaeaf9cfabb	9804	2017-10-06 06:21:12.319-07	\N	f	\N
2560	*****@paypal.com	*****	*****	paypal	\N	2017-04-13 13:50:41.094-07	2017-04-13 13:57:22.555-07	2017-04-13 13:57:22.534-07	2017-04-17 12:34:05.25-07	3	2018-04-13 13:50:40.609-07	e5c48729-e73c-3763-7baf-b5b6ffe33ef9	9804	2017-10-06 06:21:12.319-07	\N	f	\N
573	*****@paypal.com	*****	*****	paypal	\N	2016-08-03 14:38:52.082-07	2016-08-03 14:40:05.094-07	2016-08-03 14:40:05.093-07	2016-10-27 14:02:50.674-07	3	\N	97314625-9259-1f79-cdd8-022b7f8cecb1	9804	2017-10-06 06:21:12.319-07	\N	f	\N
1189	*****@paypal.com	*****	*****	paypal	\N	2016-11-18 13:00:56.092-08	2016-11-18 13:01:23.091-08	2016-11-18 13:01:23.091-08	2016-11-18 13:02:50.88-08	3	\N	f742a675-7134-0776-ac29-ae2176bfd16c	9804	2017-10-06 06:21:12.319-07	\N	f	\N
8007	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.31-08	\N	\N	\N	\N	\N	7aabfa4e-76a7-8376-866a-a3f0002084fe	268	\N	\N	t	USD
2149	*****@paypal.com	*****	*****	paypal	\N	2017-03-14 10:47:32.51-07	2017-03-17 08:34:02.314-07	2017-03-17 08:34:02.314-07	2017-03-17 08:34:41.542-07	3	2018-03-14 10:47:32.043-07	9e9b3978-5040-8916-5d63-e3ffadf1da78	9804	2017-10-06 06:21:12.319-07	\N	f	\N
2266	*****@paypal.com	*****	*****	paypal	\N	2017-03-27 10:46:21.637-07	2017-03-27 10:54:36.2-07	2017-03-27 10:54:36.199-07	2017-03-27 10:55:03.518-07	3	2018-03-27 10:46:21.041-07	c850ded6-fe9f-79d3-ec67-576913fbf211	9804	2017-10-06 06:21:12.319-07	\N	f	\N
1191	*****@paypal.com	*****	*****	paypal	\N	2016-11-18 13:03:06.664-08	2016-11-18 13:03:32.285-08	2016-11-18 13:03:32.285-08	2016-12-20 08:50:13.592-08	3	\N	d26d7449-f49c-a859-d69c-b8c9f9964eb5	9804	2017-10-06 06:21:12.319-07	\N	f	\N
2218	*****@paypal.com	*****	*****	paypal	\N	2017-03-22 13:58:36.077-07	2017-03-27 09:00:11.768-07	2017-03-27 09:00:11.767-07	2017-03-27 09:01:06.921-07	3	2018-03-22 13:58:35.533-07	687ec9de-1865-b54d-fa51-48257be68ed3	9804	2017-10-06 06:21:12.319-07	\N	f	\N
2561	*****@paypal.com	*****	*****	paypal	\N	2017-04-13 13:52:22.989-07	2017-04-13 13:52:22.989-07	\N	2017-04-13 13:57:22.804-07	3	2018-04-13 13:52:22.424-07	6bcfe655-5c6e-e915-51f9-e6ac98bdc7a8	9804	2017-10-06 06:21:12.319-07	\N	f	\N
2602	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 14:16:50.566-07	2017-04-17 14:17:30.886-07	2017-04-17 14:17:30.886-07	\N	3	2018-04-17 14:16:49.999-07	77930389-92e3-1519-debd-15d605822a43	9804	2017-10-06 06:21:12.319-07	\N	f	\N
2264	*****@paypal.com	*****	*****	paypal	\N	2017-03-27 08:58:40.001-07	2017-03-27 08:58:40.001-07	\N	2017-03-27 09:01:06.923-07	3	2018-03-27 08:58:39.313-07	9114f9cf-9878-e3f3-0598-0f6c9a33d27b	9804	2017-10-06 06:21:12.319-07	\N	f	\N
7704	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.242-08	\N	\N	\N	\N	\N	6de86661-8454-ba81-b378-c9d0e100f42a	288	\N	\N	t	USD
8513	*****@paypal.com	*****	*****	paypal	\N	2017-11-20 13:10:05.857-08	2017-11-20 13:27:17.668-08	2017-11-20 13:27:17.668-08	\N	3	2018-11-20 13:10:05.234-08	bf315ce5-e8f7-4498-5c0d-6ff1cd381390	9804	\N	\N	f	USD
8038	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.314-08	\N	\N	\N	\N	\N	e48e2053-c8e9-0d0d-7d05-f613f1ede077	262	\N	\N	t	USD
5832	*****	*****	*****	stripe	\N	2017-10-24 11:04:44.331-07	2017-10-24 11:04:53.754-07	2017-10-24 11:04:53.754-07	\N	8512	\N	18232c46-6e76-c9c8-8a3a-b780b5b0c586	9451	\N	\N	f	USD
8184	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.341-08	\N	\N	\N	\N	\N	73e4236c-31a9-e486-6f07-992d46256052	518	\N	\N	t	USD
5861	*****	*****	*****	stripe	\N	2017-10-24 22:19:36.336-07	2017-10-24 22:19:36.336-07	\N	\N	2	\N	39a8e205-d9cc-293d-205f-c0b4dd1817e1	1729	\N	\N	t	USD
8533	*****	*****	*****	stripe	\N	2017-11-21 02:46:25.438-08	2017-11-21 02:46:32.112-08	2017-11-21 02:46:32.112-08	\N	9152	\N	f2dc6a56-e2f5-d4af-7f29-7d049813f964	10465	\N	\N	f	USD
8188	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.341-08	\N	\N	\N	\N	\N	84a8b038-b862-58fc-b059-5e133b4338eb	275	\N	\N	t	USD
8194	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.343-08	\N	\N	\N	\N	\N	0a9782f9-33ba-eff0-5f43-9c56740ef685	270	\N	\N	t	USD
8198	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.343-08	\N	\N	\N	\N	\N	d1319265-9f88-8dc7-6808-f0c14a1bcb5d	266	\N	\N	t	AUD
8690	*****	*****	*****	stripe	\N	2017-12-01 04:14:08.907-08	2017-12-01 04:19:24.487-08	2017-12-01 04:19:24.487-08	\N	2594	\N	4cf21be6-ceca-6d0a-e3db-c0249e9bffcb	3116	\N	\N	f	USD
8203	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.344-08	\N	\N	\N	\N	\N	5e890b09-2c1f-b7e6-f3fd-f27fb5391967	301	\N	\N	t	EUR
8209	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.345-08	\N	\N	\N	\N	\N	d80e4f98-922c-d134-e8d9-134b4f5bdb54	195	\N	\N	t	USD
1043	*****@paypal.com	*****	*****	paypal	\N	2016-10-31 14:12:07.923-07	2016-10-31 14:12:53.002-07	2016-10-31 14:12:53.002-07	2016-10-31 14:34:17.33-07	3	\N	a066d9ea-2eae-8018-cca1-281868feefdb	9804	2017-10-06 06:21:12.319-07	\N	f	\N
1024	*****@paypal.com	*****	*****	paypal	\N	2016-10-27 14:01:07.153-07	2016-10-27 14:02:50.617-07	2016-10-27 14:02:50.616-07	2016-10-31 14:08:26.464-07	3	\N	9c84084b-d83f-ce4c-f61e-41dfd732c2bb	9804	2017-10-06 06:21:12.319-07	\N	f	\N
1042	*****@paypal.com	*****	*****	paypal	\N	2016-10-31 14:04:38.968-07	2016-10-31 14:08:26.416-07	2016-10-31 14:08:26.414-07	2016-10-31 14:12:53.305-07	3	\N	fb2ee761-116d-95e4-c6f9-f0494c3cc762	9804	2017-10-06 06:21:12.319-07	\N	f	\N
1114	*****@paypal.com	*****	*****	paypal	\N	2016-11-03 12:32:01.482-07	2016-11-03 12:32:02.116-07	\N	2016-11-03 12:33:52.634-07	3	\N	f31b9435-4c0c-7321-c7e3-d9c5ac083a4d	9804	2017-10-06 06:21:12.319-07	\N	f	\N
1116	*****@paypal.com	*****	*****	paypal	\N	2016-11-03 12:35:14.952-07	2016-11-03 12:35:15.487-07	\N	2016-11-03 12:39:59.781-07	3	\N	892c89f2-a99a-6481-96e5-004ba00f2f5b	9804	2017-10-06 06:21:12.319-07	\N	f	\N
1117	*****@paypal.com	*****	*****	paypal	\N	2016-11-03 12:39:59.972-07	2016-11-03 12:41:28.432-07	2016-11-03 12:41:28.432-07	2016-11-18 13:01:23.135-08	3	\N	3ff260fe-1f4a-b538-4d48-edb52de25c8f	9804	2017-10-06 06:21:12.319-07	\N	f	\N
2265	*****@paypal.com	*****	*****	paypal	\N	2017-03-27 09:00:15.115-07	2017-03-27 10:46:18.273-07	2017-03-27 10:46:18.272-07	2017-03-27 10:46:43.247-07	3	2018-03-27 09:00:14.596-07	f64df896-7282-6e4e-755d-8b2e554c7143	9804	2017-10-06 06:21:12.319-07	\N	f	\N
2267	*****@paypal.com	*****	*****	paypal	\N	2017-03-27 10:54:38.499-07	2017-03-31 10:54:59.737-07	2017-03-31 10:54:59.736-07	2017-03-31 10:57:17.587-07	3	2018-03-27 10:54:37.975-07	658e55ca-17f9-424b-c0e1-012d340ae278	9804	2017-10-06 06:21:12.319-07	\N	f	\N
2318	*****@paypal.com	*****	*****	paypal	\N	2017-03-31 10:55:08.767-07	2017-03-31 15:33:10.929-07	2017-03-31 15:33:10.928-07	2017-03-31 15:33:37.928-07	3	2018-03-31 10:55:08.252-07	c7430510-b969-8e37-b9f0-b41e709d18a1	9804	2017-10-06 06:21:12.319-07	\N	f	\N
2321	*****@paypal.com	*****	*****	paypal	\N	2017-03-31 15:33:13.922-07	2017-03-31 15:33:37.801-07	2017-03-31 15:33:37.801-07	2017-04-13 13:57:22.795-07	3	2018-03-31 15:33:13.429-07	72340104-9bdc-eca6-b803-05418cc0633d	9804	2017-10-06 06:21:12.319-07	\N	f	\N
2596	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 14:03:48.29-07	2017-04-17 14:03:48.29-07	\N	2017-04-17 14:17:31.145-07	3	2018-04-17 14:03:47.645-07	c2b8e7f0-dccc-a32a-a881-f8e453c5f6ff	9804	2017-10-06 06:21:12.319-07	\N	f	\N
2599	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 14:14:29.551-07	2017-04-17 14:14:29.551-07	\N	2017-04-17 14:17:31.151-07	3	2018-04-17 14:14:29.12-07	b45522d7-5d7e-a7fd-5226-29a0751cd43f	9804	2017-10-06 06:21:12.319-07	\N	f	\N
2600	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 14:15:56.101-07	2017-04-17 14:15:56.101-07	\N	2017-04-17 14:17:31.153-07	3	2018-04-17 14:15:55.67-07	7ae70bce-a67b-c4e2-a18a-bb8daaef5273	9804	2017-10-06 06:21:12.319-07	\N	f	\N
2601	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 14:15:58.306-07	2017-04-17 14:15:58.306-07	\N	2017-04-17 14:17:31.155-07	3	2018-04-17 14:15:57.816-07	d373c18e-863d-a56e-72be-4c186bc7d17d	9804	2017-10-06 06:21:12.319-07	\N	f	\N
2594	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 12:33:22.594-07	2017-04-17 14:16:44.162-07	2017-04-17 14:16:44.162-07	2017-04-17 14:17:31.156-07	3	2018-04-17 12:33:22.134-07	e71eaf19-4219-6a4c-5240-a19671bc11f9	9804	2017-10-06 06:21:12.319-07	\N	f	\N
2846	*****@paypal.com	*****	*****	paypal	\N	2017-05-08 08:30:40.035-07	2017-05-08 08:30:40.035-07	\N	\N	3	2018-05-08 08:30:39.371-07	465a71ee-1af0-d818-b3d5-4c591997fe0a	9804	2017-10-06 06:21:12.319-07	\N	f	\N
1476	*****@paypal.com	*****	*****	paypal	\N	2016-12-20 08:45:05.334-08	2016-12-20 10:53:04.678-08	2016-12-20 10:53:04.677-08	2017-01-25 10:43:43.363-08	3	\N	d5cbc5b3-76fb-84d7-792b-eac3a380480e	9804	2017-10-06 06:21:12.319-07	\N	f	\N
1718	*****@paypal.com	*****	*****	paypal	\N	2017-01-25 10:42:33.289-08	2017-01-25 10:43:43.316-08	2017-01-25 10:43:43.315-08	2017-02-10 12:19:25.564-08	3	\N	4bc9f6d5-fb55-6255-2813-fdff73074b3d	9804	2017-10-06 06:21:12.319-07	\N	f	\N
1893	*****@paypal.com	*****	*****	paypal	\N	2017-02-10 12:18:58.618-08	2017-03-14 10:47:25.438-07	2017-03-14 10:47:25.433-07	2017-03-14 10:48:00.117-07	3	\N	03abd18f-b0f6-dddd-669b-9c27ea142ada	9804	2017-10-06 06:21:12.319-07	\N	f	\N
3888	*****@paypal.com	*****	*****	paypal	\N	2017-07-26 11:46:20.89-07	2017-07-26 11:46:20.89-07	\N	\N	3	2018-07-26 11:46:20.251-07	a29b4ce7-231b-24df-ad14-ba804c9b2105	9804	2017-10-06 06:21:12.319-07	\N	f	\N
7577	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.221-08	\N	\N	\N	\N	\N	4a516a3c-e35b-24d1-da64-642774288f23	584	\N	\N	t	GBP
8208	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.345-08	\N	\N	\N	\N	\N	a5c110d9-0981-42cf-57f1-fd08c8f9dd29	12	\N	\N	t	USD
8213	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.346-08	\N	\N	\N	\N	\N	f53df47c-812f-3910-be20-c546a53dd836	297	\N	\N	t	AUD
8218	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.348-08	\N	\N	\N	\N	\N	d3855ad6-65db-9fb9-10d5-95e59a8aa836	271	\N	\N	t	USD
8222	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.348-08	\N	\N	\N	\N	\N	11fa539a-a6a7-daf3-6f7e-850e83f4cc31	287	\N	\N	t	USD
8228	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.349-08	\N	\N	\N	\N	\N	41f2cce9-71ae-1172-46f3-1a86f3b77b15	513	\N	\N	t	USD
8202	*****	*****	*****	opencollective	\N	2017-11-15 13:56:00.344-08	2017-11-28 07:38:02.372-08	\N	\N	\N	\N	63e271bb-c396-0e9b-41fa-4ef442132c91	300	2017-11-28 07:38:02.372-08	\N	t	USD
8400	*****	*****	*****	opencollective	\N	2017-11-15 13:56:01.03-08	\N	\N	\N	\N	\N	8675058b-ab31-8b9f-97b9-ab8f93424d2b	8638	\N	\N	t	USD
\.


                                                                                                                                                                                                                                                                                                                                                                                                           4019.dat                                                                                            0000600 0004000 0002000 00000011062 13212311737 0014247 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        00-stripemanaged-model.js
01-transaction-model.js
02-group-model.js
03-card-model.js
04-application-model.js
05-user-model.js
06-paykey-model.js
07-activity-model.js
08-usergroup-model.js
09-application-group-model.js
10-transaction-model-relations.js
11-activity-model-relation.js
12-card-model-relation.js
20151030150110-addpaypalfield.js
20151208112311-add_group_public_flag.js
20151209114845-add_email_to_stripe_managed_account.js
20151221110406-add_stripesubscriptionid_to_transaction.js
20151230143257-add-longdescription-logo-video-image-expensePolicy-to-Group-migration.js
20151230150937-rename-membership_type-to-membershipType-migration.js
20151230160803-add_group_slug.js
20160105163703-add_transaction_payment_method.js
20160108134935-merge-name-field-and-add-website-and-twitter-handle-migration.js
20160108145839-updating-longDescription-datatype-migration.js
20160109164217-addVAT-migration.js
20160111104412-switch-expensepolicy-to-be-larger-migration.js
20160112093010-reshape_stripe_managed_account.js
20160113172636-add_stripe_accountid_to_user.js
20160113172933-replace-usergroup-role.js
20160115105814-add-website-twitter-to-group.js
20160119121646-add-pending-subscription.js
20160121133658-subscriptions-migration.js
20160128142427-add_reset_token_to_user.js
20160211190935-add-group-tiers.js
20160216121153-add-interval-to-transaction.js
20160218164134-add-new-constraint-to-UserGroups.js
20160219151355-add-usergroup-id.js
201602242300-add-vendor.js
20160225133109-rename-subscriptions-to-notifications.js
20160226153046-subscription-remodel.js
20160226154559-transactions-subscription-reshape.js
20160309143800-notifications-webhook.js
20160311090652-connected-account-migration.js
20160311113816-transaction-paranoid-migration.js
20160321114955-transaction-data.js
20160322231916-rename-card-to-paymentmethod-migration.js
20160323121731-rename-CardId-to-PaymentsMethodId-in-Transactions-migration.js
20160323133617-add-donations-table-migration.js
20160323152724-add-fields-to-transactions-migration.js
20160402120725-add-fee-fields-to-transactions-migration.js
20160405133705-add-burnrate-and-mission-to-group.js
201604150000-add-backgroundImage.js
201604150000-add-referer-to-users.js
20160415194252-add-netAmountInGroupCurrency-to-Transactions-migration.js
20160416141204-add-hostCommissionPercent-migration.js
20160505173300-add-connected-account-group-id.js
20160511222234-group-settings-and-whyjoin.js
20160519162112-make-group.slug-unique-migration.js
20160520153932-remove-user.email-unique-constraint-migration.js
20160602124940-group-data.js
20160608001600-add-expenses-table.js
20160610103923-add-payoutmethod-to-expense-migration.js
20160616161932-group-tags-and-supercollective-field-migration.js
20160610161454-add-users-description-organization.js
20160613174610-temporal-migration.js
20160713221132-user-add-longDescription.js
20160716003148-users-add-mission.js
20160802180635-add-paymentmethod-to-donation.js
20160815115600-add-sessions-table.js
20160822191515-processedAt-in-Donation-migration.js
20160918000000-users-add-firstname.js
20161007172819-lastEditedBy-in-Groups-migration.js
20161007175650-add-grouphistories-migration.js
20161012000000-comments.js
20161117000000-users-add-billingAddress.js
20161204000000-add-index.js
20161205175944-increase-group-mission-length-migration.js
201701040000-group-isActive.js
20170116163901-create-Event-migration.js
20170116170650-create-Tier-migration.js
20170116190354-create-Response-migration.js
20170124210251-New-fields-Event-Tier-Response-migration.js
20170125005855-Add-Lat-Long-in-Event-migration.js
20170127211709-remove-unused-transaction-fields-migration.js
20170127223729-change-amounts-to-ints-migration.js
20170209212119-add-response-to-migration.js
20170220000000-transactions-add-uuid.js
20170228184811-add-fields-to-PaymentMethod-migration.js
201703150000-add-timezone-events.js
20170310165323-add-notes-to-donations-migration.js
201704100000-updateTiers.js
20170525000000-event-addIndex.js
201706030000-add-HostId.js
201707080000-add-tiers-maxQuantityPerUser.js
201706300000-addTransactionDonationIndex.js
201707100000-add-tiers-to-group.js
201707120000-updatePaymentMethod.js
201707140000-GroupToCollective.js
201709020000-AddPaymentMethodData.js
201709110000-DoubleEntry.js
20171007190000-PopulateOrderFromCollectiveId.js
201710090000-TierDescription.js
20171018154610-create-org-members.js
20171024163252-host-cleanup.js
20171101205214-migrate-orders.js
20171107192725-slug-apply.js
201711140000-HostExpenses.js
201711160000-OC-PaymentMethodsUUID.js
20171124152627-require-slug.js
201712010000-createAttendees.js
201712060001-addCompany.js
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                              4020.dat                                                                                            0000600 0004000 0002000 00000000005 13212311737 0014232 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4021.dat                                                                                            0000600 0004000 0002000 00000005715 13212311737 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        6	100	USD	month	f	\N	*****	2016-02-02 08:36:36-08	2016-06-01 17:00:00-07	2016-02-29 17:07:14.394-08	2016-02-29 17:07:14.394-08	\N
7	100	USD	month	f	\N	*****	2016-02-02 09:04:54-08	2016-06-01 17:00:00-07	2016-02-29 17:07:14.807-08	2016-02-29 17:07:14.807-08	\N
3	100	USD	month	f	\N	*****	2016-02-02 09:09:20-08	2016-06-01 17:00:00-07	2016-02-29 17:07:13.303-08	2016-02-29 17:07:13.303-08	\N
8	100	USD	month	f	\N	*****	2016-02-02 13:46:43-08	2016-06-01 17:00:00-07	2016-02-29 17:07:15.151-08	2016-02-29 17:07:15.151-08	\N
2	100	USD	month	f	\N	*****	2016-02-02 15:09:04-08	2016-06-01 17:00:00-07	2016-02-29 17:07:12.938-08	2016-02-29 17:07:12.938-08	\N
16	100	MXN	month	f	\N	*****	2016-02-15 10:46:05-08	\N	2016-02-29 17:07:18.292-08	2016-02-29 17:07:18.292-08	\N
4	500	MXN	month	f	\N	*****	2016-02-02 08:52:01-08	\N	2016-02-29 17:07:13.684-08	2016-02-29 17:07:13.684-08	\N
1366	2500	USD	month	t	\N	*****	2017-02-01 09:30:50.219-08	\N	2017-02-01 09:30:44.034-08	2017-02-01 09:30:50.219-08	\N
286	1000	USD	month	f	\N	*****	2016-07-01 15:38:36.9-07	2017-11-02 14:57:33.596-07	2016-07-01 15:31:45.99-07	2017-11-02 14:57:33.596-07	\N
2039	500	USD	month	t	\N	*****	2017-05-01 10:13:36.243-07	\N	2017-05-01 10:13:32.216-07	2017-05-01 10:13:36.243-07	\N
530	0	USD	month	f	\N	*****	2016-09-20 13:59:00.661-07	2017-01-16 07:00:35.909-08	2016-09-20 13:58:49.798-07	2017-01-16 07:00:35.909-08	\N
2888	1000	USD	month	t	\N	*****	2017-07-31 21:46:30.164-07	\N	2017-07-31 21:46:24.717-07	2017-07-31 21:46:30.164-07	\N
2103	1000	USD	month	t	\N	*****	2017-05-08 22:59:17.481-07	\N	2017-05-08 22:59:11.936-07	2017-05-08 22:59:17.482-07	\N
2393	10000	USD	month	f	\N	*****	2017-06-13 18:22:54.283-07	2017-09-07 03:53:18.834-07	2017-06-13 18:22:49.816-07	2017-09-07 03:53:18.835-07	\N
1238	1000	USD	month	f	\N	*****	2017-01-14 09:12:00.516-08	2017-02-22 15:10:02.422-08	2017-01-14 09:11:39.397-08	2017-02-22 15:10:02.422-08	\N
224	100	USD	month	f	\N	*****	2016-06-09 10:28:30.06-07	2017-06-05 08:49:03.685-07	2016-06-09 10:28:13.943-07	2017-06-05 08:49:03.686-07	\N
3229	500	USD	month	t	\N	*****	2017-09-08 04:51:40.836-07	\N	2017-09-08 04:51:35.53-07	2017-09-08 04:51:40.836-07	\N
3802	300	USD	month	t	\N	*****	2017-10-24 11:04:53.722-07	\N	2017-10-24 11:04:44.368-07	2017-10-24 11:04:53.722-07	\N
4156	2500	USD	month	f	\N	*****	2017-12-01 04:14:54.626-08	2017-12-01 04:33:41.088-08	2017-12-01 04:14:48.628-08	2017-12-01 04:33:41.088-08	\N
1	500	USD	month	f	\N	*****	\N	\N	2016-02-29 17:07:12.45-08	2016-02-29 17:07:12.45-08	\N
496	1000	USD	month	t	\N	*****	2016-09-09 20:42:55.758-07	\N	2016-09-09 20:42:49.141-07	2016-09-09 20:42:55.759-07	\N
33	100	USD	month	f	\N	*****	2016-03-01 20:42:15.671-08	2016-06-01 17:00:00-07	2016-03-01 20:41:59.934-08	2016-03-01 20:42:15.673-08	\N
378	10000	USD	month	f	\N	*****	2016-08-03 10:47:24.609-07	2016-08-03 10:48:03.066-07	2016-08-03 10:47:17.197-07	2016-08-03 10:48:03.067-07	\N
2031	200	USD	month	t	\N	*****	2017-04-30 18:40:31.674-07	\N	2017-04-30 18:40:26.929-07	2017-04-30 18:40:31.674-07	\N
\.


                                                   4024.dat                                                                                            0000600 0004000 0002000 00000034175 13212311737 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        575	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:07.303-07	\N	\N	backers	\N	\N	TIER	277	\N	Become a backer	[2500,5000,10000]
1265	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-10-06 06:22:16.815-07	\N	\N	sponsors	\N	\N	TIER	519	month	\N	\N
132	donor	Become a donor and help us support all the local Women Who Code collectives	\N	USD	\N	\N	\N	\N	2017-10-06 06:22:01.812-07	\N	\N	donors	\N	\N	TIER	51	\N	\N	["other",100000,500000,1000000]
511	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-10-06 06:22:06.575-07	\N	\N	sponsors	\N	\N	TIER	517	month	\N	\N
510	backer	\N	500	USD	\N	\N	\N	\N	2017-10-06 06:22:06.575-07	\N	\N	backers	\N	\N	TIER	517	month	\N	\N
527	Backers	Support us with a donation and help us continue our activities.	2500	CAD	\N	\N	\N	\N	2017-10-06 06:22:06.838-07	\N	\N	backers	\N	\N	TIER	291	\N	Become a backer	[2500,5000,10000]
489	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:06.301-07	\N	\N	backers	\N	\N	TIER	15	\N	Become a backer	[2500,5000,10000]
528	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:06.849-07	\N	\N	backers	\N	\N	TIER	289	\N	Become a backer	[2500,5000,10000]
567	Backers	Support us with a donation and help us continue our activities.	2500	AUD	\N	\N	\N	\N	2017-10-06 06:22:07.174-07	\N	\N	backers	\N	\N	TIER	297	\N	Become a backer	[2500,5000,10000]
1027	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:13.648-07	\N	\N	backers	\N	\N	TIER	48	\N	Become a backer	[2500,5000,10000]
518	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:06.711-07	\N	\N	backers	\N	\N	TIER	288	\N	Become a backer	[2500,5000,10000]
492	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:06.415-07	\N	\N	backers	\N	\N	TIER	13	\N	Become a backer	[2500,5000,10000]
499	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:06.445-07	\N	\N	backers	\N	\N	TIER	12	\N	Become a backer	[2500,5000,10000]
566	Backers	Support us with a donation and help us continue our activities.	2500	GBP	\N	\N	\N	\N	2017-10-06 06:22:07.174-07	\N	\N	backers	\N	\N	TIER	278	\N	Become a backer	[2500,5000,10000]
547	Backers	Support us with a donation and help us continue our activities.	2500	AUD	\N	\N	\N	\N	2017-10-06 06:22:07.049-07	\N	\N	backers	\N	\N	TIER	281	\N	Become a backer	[2500,5000,10000]
574	Backers	Support us with a donation and help us continue our activities.	2500	EUR	\N	\N	\N	\N	2017-10-06 06:22:07.241-07	\N	\N	backers	\N	\N	TIER	301	\N	Become a backer	[2500,5000,10000]
576	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:07.321-07	\N	\N	backers	\N	\N	TIER	274	\N	Become a backer	[2500,5000,10000]
756	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:09.463-07	2017-11-28 07:38:02.28-08	\N	backers	\N	\N	TIER	300	\N	Become a backer	[2500,5000,10000]
749	Backers	Support us with a donation and help us continue our activities.	2500	EUR	\N	\N	\N	\N	2017-10-06 06:22:09.221-07	\N	\N	backers	\N	\N	TIER	298	\N	Become a backer	[2500,5000,10000]
833	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:10.787-07	\N	\N	backers	\N	\N	TIER	269	\N	Become a backer	[2500,5000,10000]
854	Backers	Support us with a donation and help us continue our activities.	2500	AUD	\N	\N	\N	\N	2017-10-06 06:22:11.001-07	\N	\N	backers	\N	\N	TIER	266	\N	Become a backer	[2500,5000,10000]
858	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:11.055-07	\N	\N	backers	\N	\N	TIER	430	\N	Become a backer	[2500,5000,10000]
888	backer	\N	500	GBP	\N	\N	\N	\N	2017-10-06 06:22:11.641-07	\N	\N	backers	\N	\N	TIER	584	month	\N	\N
803	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:10.295-07	\N	\N	backers	\N	\N	TIER	284	\N	Become a backer	[2500,5000,10000]
822	Backers	Support us with a donation and help us continue our activities.	50000	MXN	\N	\N	\N	\N	2017-10-06 06:22:10.602-07	\N	\N	backers	\N	\N	TIER	10	\N	Become a backer	[50000,100000,250000,500000,1000000]
846	Backers	Support us with a donation and help us continue our activities.	2500	GBP	\N	\N	\N	\N	2017-10-06 06:22:10.898-07	\N	\N	backers	\N	\N	TIER	267	\N	Become a backer	[2500,5000,10000]
855	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:11.004-07	\N	\N	backers	\N	\N	TIER	259	\N	Become a backer	[2500,5000,10000]
913	Backers	Support us with a donation and help us continue our activities.	2500	CAD	\N	\N	\N	\N	2017-10-06 06:22:11.814-07	\N	\N	backers	\N	\N	TIER	293	\N	Become a backer	[2500,5000,10000]
936	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:12.174-07	\N	\N	backers	\N	\N	TIER	261	\N	Become a backer	[2500,5000,10000]
950	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-10-06 06:22:12.244-07	\N	\N	sponsors	\N	\N	TIER	518	month	\N	\N
863	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:11.169-07	\N	\N	backers	\N	\N	TIER	265	\N	Become a backer	[2500,5000,10000]
889	sponsor	\N	10000	GBP	\N	\N	\N	\N	2017-10-06 06:22:11.641-07	\N	\N	sponsors	\N	\N	TIER	584	month	\N	\N
959	Backers	Support us with a donation and help us continue our activities.	2500	EUR	\N	\N	\N	\N	2017-10-06 06:22:12.363-07	\N	\N	backers	\N	\N	TIER	283	\N	Become a backer	[2500,5000,10000]
1264	backer	\N	500	USD	\N	\N	\N	\N	2017-10-06 06:22:16.815-07	\N	\N	backers	\N	\N	TIER	519	month	\N	\N
864	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:11.205-07	\N	\N	backers	\N	\N	TIER	241	\N	Become a backer	[2500,5000,10000]
885	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:11.618-07	\N	\N	backers	\N	\N	TIER	276	\N	Become a backer	[2500,5000,10000]
901	sponsor	\N	10000	EUR	\N	\N	\N	\N	2017-10-06 06:22:11.72-07	\N	\N	sponsors	\N	\N	TIER	523	month	\N	\N
906	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:11.747-07	\N	\N	backers	\N	\N	TIER	263	\N	Become a backer	[2500,5000,10000]
949	backer	\N	500	USD	\N	\N	\N	\N	2017-10-06 06:22:12.244-07	\N	\N	backers	\N	\N	TIER	518	month	\N	\N
967	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:12.397-07	\N	\N	backers	\N	\N	TIER	280	\N	Become a backer	[2500,5000,10000]
981	sponsor	\N	10000	CAD	\N	\N	\N	\N	2017-10-06 06:22:12.638-07	\N	\N	sponsors	\N	\N	TIER	522	month	\N	\N
992	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-10-06 06:22:12.835-07	\N	\N	sponsors	\N	\N	TIER	521	month	\N	\N
1021	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:13.615-07	\N	\N	backers	\N	\N	TIER	260	\N	Become a backer	[2500,5000,10000]
800	Backers	Support us with a donation and help us continue our activities.	2500	GBP	\N	\N	\N	\N	2017-10-06 06:22:10.2-07	2017-10-19 08:22:05.314-07	\N	backers	\N	\N	TIER	264	\N	Become a backer	[2500,5000,10000]
900	backer	\N	500	EUR	\N	\N	\N	\N	2017-10-06 06:22:11.72-07	\N	\N	backers	\N	\N	TIER	523	month	\N	\N
953	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:12.272-07	\N	\N	backers	\N	\N	TIER	286	\N	Become a backer	[2500,5000,10000]
989	backer	\N	500	USD	\N	\N	\N	\N	2017-10-06 06:22:12.769-07	\N	\N	backers	\N	\N	TIER	516	month	\N	\N
993	backer	\N	500	USD	\N	\N	\N	\N	2017-10-06 06:22:12.835-07	\N	\N	backers	\N	\N	TIER	515	month	\N	\N
997	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:12.921-07	\N	\N	backers	\N	\N	TIER	271	\N	Become a backer	[2500,5000,10000]
1001	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:13.045-07	\N	\N	backers	\N	\N	TIER	287	\N	Become a backer	[2500,5000,10000]
1007	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:13.347-07	\N	\N	backers	\N	\N	TIER	279	\N	Become a backer	[2500,5000,10000]
1044	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:13.919-07	\N	\N	backers	\N	\N	TIER	273	\N	Become a backer	[2500,5000,10000]
1098	backer	\N	200	EUR	\N	\N	\N	\N	2017-10-06 06:22:14.968-07	\N	\N	backers	\N	\N	TIER	524	month	\N	[200,1000,2500]
972	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:12.457-07	\N	\N	backers	\N	\N	TIER	295	\N	Become a backer	[2500,5000,10000]
980	backer	\N	500	CAD	\N	\N	\N	\N	2017-10-06 06:22:12.638-07	\N	\N	backers	\N	\N	TIER	522	month	\N	\N
991	backer	\N	500	USD	\N	\N	\N	\N	2017-10-06 06:22:12.835-07	\N	\N	backers	\N	\N	TIER	521	month	\N	\N
1000	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:13.044-07	\N	\N	backers	\N	\N	TIER	285	\N	Become a backer	[2500,5000,10000]
1026	Sponsors	Become a Sponsor and help us fulfill our mission to inspire women to excel in tech careers. See the description above for more info.	150000	USD	\N	\N	\N	\N	2017-10-06 06:22:13.648-07	\N	\N	sponsors	\N	\N	TIER	48	\N	Become a Sponsor	[150000,300000,500000]
1051	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:14.136-07	\N	\N	backers	\N	\N	TIER	272	\N	Become a backer	[2500,5000,10000]
1069	backer	\N	500	USD	\N	\N	\N	\N	2017-10-06 06:22:14.473-07	\N	\N	backers	\N	\N	TIER	513	month	\N	\N
982	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:12.642-07	\N	\N	backers	\N	\N	TIER	292	\N	Become a backer	[2500,5000,10000]
990	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-10-06 06:22:12.769-07	\N	\N	sponsors	\N	\N	TIER	516	month	\N	\N
1006	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:13.336-07	\N	\N	backers	\N	\N	TIER	270	\N	Become a backer	[2500,5000,10000]
1012	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:13.429-07	\N	\N	backers	\N	\N	TIER	294	\N	Become a backer	[2500,5000,10000]
1070	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-10-06 06:22:14.473-07	\N	\N	sponsors	\N	\N	TIER	513	month	\N	\N
1074	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-10-06 06:22:14.494-07	\N	\N	sponsors	\N	\N	TIER	512	month	\N	\N
1078	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-10-06 06:22:14.514-07	\N	\N	sponsors	\N	\N	TIER	520	month	\N	\N
1636	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:20.589-07	\N	\N	backers	\N	\N	TIER	275	\N	Become a backer	[2500,5000,10000]
994	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-10-06 06:22:12.835-07	\N	\N	sponsors	\N	\N	TIER	515	month	\N	\N
995	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:12.838-07	\N	\N	backers	\N	\N	TIER	290	\N	Become a backer	[2500,5000,10000]
1073	backer	\N	500	USD	\N	\N	\N	\N	2017-10-06 06:22:14.494-07	\N	\N	backers	\N	\N	TIER	512	month	\N	\N
1077	backer	\N	500	USD	\N	\N	\N	\N	2017-10-06 06:22:14.514-07	\N	\N	backers	\N	\N	TIER	520	month	\N	\N
1182	sponsor	\N	10000	MXN	\N	\N	\N	\N	2017-10-06 06:22:15.74-07	\N	\N	sponsors	\N	\N	TIER	511	month	\N	\N
1316	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:17.257-07	\N	\N	backers	\N	\N	TIER	2	\N	Become a backer	[2500,5000,10000]
1181	backer	\N	500	MXN	\N	\N	\N	\N	2017-10-06 06:22:15.739-07	\N	\N	backers	\N	\N	TIER	511	month	\N	\N
1402	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-10-06 06:22:18.401-07	\N	\N	sponsors	\N	\N	TIER	510	month	\N	\N
1428	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:18.676-07	\N	\N	backers	\N	\N	TIER	4	\N	Become a backer	[2500,5000,10000]
1401	backer	\N	500	USD	\N	\N	\N	\N	2017-10-06 06:22:18.401-07	\N	\N	backers	\N	\N	TIER	510	month	\N	\N
1430	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:18.677-07	\N	\N	backers	\N	\N	TIER	268	\N	Become a backer	[2500,5000,10000]
1493	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:19.308-07	\N	\N	backers	\N	\N	TIER	195	\N	Become a backer	[2500,5000,10000]
1339	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:17.542-07	\N	\N	backers	\N	\N	TIER	14	\N	Become a backer	[2500,5000,10000]
1437	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:18.739-07	\N	\N	backers	\N	\N	TIER	3	\N	Become a backer	[2500,5000,10000]
1584	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:20.187-07	\N	\N	backers	\N	\N	TIER	262	\N	Become a backer	[2500,5000,10000]
1631	backer	\N	500	USD	\N	\N	\N	\N	2017-10-06 06:22:20.492-07	\N	\N	backers	\N	\N	TIER	525	month	\N	\N
1633	Backers	Support us with a donation and help us continue our activities.	25000	MXN	\N	\N	\N	\N	2017-10-06 06:22:20.511-07	\N	\N	backers	\N	\N	TIER	282	\N	Become a backer	[25000,50000,100000]
1632	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-10-06 06:22:20.492-07	\N	\N	sponsors	\N	\N	TIER	525	month	\N	\N
1710	Backers	Support us with a donation and help us continue our activities.	25000	MXN	\N	\N	\N	\N	2017-10-06 06:22:21.062-07	\N	\N	backers	\N	\N	TIER	299	\N	Become a backer	[25000,50000,100000]
1743	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:21.328-07	\N	\N	backers	\N	\N	TIER	47	\N	Become a backer	[2500,5000,10000]
662	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-06 06:22:08.049-07	2017-11-27 10:24:50.224-08	\N	backers	\N	\N	TIER	59	\N	Become a backer	[2500,5000,10000]
\.


                                                                                                                                                                                                                                                                                                                                                                                                   4026.dat                                                                                            0000600 0004000 0002000 00000470142 13212311737 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        4395	CREDIT	Global Development for Meetup Fee	6000	MXN	2016-12-27 09:59:52.939-08	2016-12-27 09:59:53.047-08	10	3	\N	\N	\N	\N	\N	\N	\N	USD	0.0485049999999999995	291	6000	\N	b15b5253-8f2b-d6c2-d07d-dc5c6c449073	9804	9804	27229522-77b4-49e8-8663-d7c6b463a193
3204	CREDIT	$1000 Mozilla hackathon support - Global Development	90000	USD	2016-11-17 10:21:06.154-08	2016-11-17 10:21:07.268-08	59	3	\N	\N	\N	\N	\N	\N	\N	USD	1	90000	90000	\N	af98999b-3f99-39d3-aa9a-be6bf22dc75b	9804	9804	28c05525-d3fc-40b3-9037-873d9f068612
9738	CREDIT	\N	2175	USD	2017-05-04 09:21:53.684-07	2017-05-04 09:21:53.684-07	276	3	\N	\N	\N	2710	0	0	0	USD	1	2175	2175	\N	84c809db-3911-c3d8-0547-b025bce75143	9804	9804	2a051d82-6a83-4e18-af15-e47393ce0a78
228	DEBIT	Feb 4 hack night	-10284	USD	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.784-07	2	28	26	\N	\N	\N	\N	\N	\N	USD	1	-10284	-10284	53	195d823a-3eb0-6bbe-9a0c-b5100f56065a	6280	9804	78700900-0e4c-43a9-844d-6d169c4f1f1d
3863	DEBIT	European Leadership Development Workshop -- Transportation, Taxi	-4400	EUR	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	301	1378	\N	\N	\N	\N	\N	\N	\N	USD	1.07299999999999995	-4721	-4400	493	1a90f9a8-8596-00bc-2cde-e1650a367acf	5394	9804	81b93958-a10f-44e0-a28a-cf0ad72e070f
3955	CREDIT	Priyanka - IOT Hackathon donation - fees and global development 	2175	USD	2016-12-13 12:08:29.218-08	2016-12-13 12:08:29.464-08	59	3	\N	\N	\N	\N	\N	\N	\N	USD	1	2175	2175	\N	98793fba-49b6-d492-cb72-8d951b35df1f	9804	9804	58b40fc8-cd16-45f3-b8ee-0356e25e2b06
3207	CREDIT	$500 OpenGov hackathon support - transaction and global development	43500	USD	2016-11-17 10:36:48.896-08	2016-11-17 10:36:49.046-08	59	3	\N	\N	\N	\N	\N	\N	\N	USD	1	43500	43500	\N	9ff8a75d-7ddf-664a-25c4-eb5bff75d4c5	9804	9804	5d3d427c-cc2d-4eb4-b19e-abd6e3d2710a
4261	CREDIT	Global Development for Meetup Fee	5700	EUR	2016-12-23 09:13:39.369-08	2016-12-23 09:13:39.507-08	301	3	\N	\N	\N	\N	\N	\N	\N	USD	1.04459999999999997	5954	5700	\N	11bff7db-b8e8-ed72-3e41-d3692810587d	9804	9804	5d42fac1-575c-4058-b5bc-c82aaf41d3a3
2256	CREDIT	Network Development: Three Year Bonus:)	50000	USD	2016-10-04 14:52:32.839-07	2016-10-04 14:52:32.962-07	2	3	\N	\N	\N	\N	\N	\N	\N	USD	1	50000	50000	\N	b77c0373-d261-ea2c-8ca4-ed494bc87efe	9804	9804	5ff141a6-6160-4630-8070-0e2b00565534
2331	CREDIT	Network Development	15755	GBP	2016-10-07 07:03:54.031-07	2016-10-07 07:03:54.119-07	278	3	\N	\N	\N	\N	\N	\N	\N	USD	1.23290000000000011	19424	15755	\N	2ca98a60-e6f7-0622-445f-fe3d421bb112	9804	9804	60edafa5-43dd-4a23-99f1-b025d12023f4
2243	CREDIT	Donation via Meetup	2036	USD	2016-10-04 09:42:35.996-07	2016-10-04 09:42:36.119-07	300	3	\N	\N	\N	\N	\N	\N	\N	USD	1	2036	2036	\N	1f06d423-6abb-f538-20d7-1a1439d92d31	9804	9804	623e8569-1947-4fc1-959e-31a9f23c6e3b
3522	CREDIT	Erica S. donation - fees	450	USD	2016-11-29 14:12:36.336-08	2016-11-29 14:12:36.503-08	287	3	\N	\N	\N	\N	\N	\N	\N	USD	1	450	450	\N	6af28109-91af-79b2-ecc3-f2fa4b64c8a9	9804	9804	859d67db-3061-4556-b219-9a0d3624a3c7
3617	CREDIT	Global Development	20000	USD	2016-11-30 13:11:00.067-08	2016-11-30 13:11:00.307-08	294	3	\N	\N	\N	\N	\N	\N	\N	USD	1	20000	20000	\N	66f0f647-4da3-9d8b-5ba2-a1b3f7d76f9d	9804	9804	868e1335-81b7-42e3-9e2e-23f549531e1c
2231	CREDIT	Sponsorship: AT&T Hackathon Prize	1000000	USD	2016-10-04 08:40:37.72-07	2016-10-04 08:40:37.853-07	12	3	\N	\N	\N	\N	\N	\N	\N	USD	1	1000000	1000000	\N	65eb4d9e-d101-e0d5-f525-e07b293110e2	9804	9804	b7c8b547-266d-4bc9-ba26-33b0dbbc6900
4701	CREDIT	donation - fees and global development	798	USD	2017-01-05 06:48:24.355-08	2017-01-05 06:48:26.734-08	241	3	\N	\N	\N	\N	\N	\N	\N	USD	1	798	798	\N	07ddccc7-04d0-7843-755b-3ea6c4be749e	9804	9804	b9cd4c77-aac4-4718-ab6f-0ced27056497
2297	DEBIT	Stickers	-62984	USD	2016-10-06 08:49:20.942-07	2016-10-06 08:49:20.967-07	4	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-62984	-62984	\N	3236de98-d3d9-6170-041a-3f0ecad0e560	51	9804	accb0e16-1955-420d-b8cf-cddcba85bd66
2326	DEBIT	Conference stipend - Gen A.	-102409	GBP	2016-10-07 06:10:14.088-07	2016-10-07 06:10:14.841-07	278	3	\N	\N	\N	\N	\N	\N	\N	USD	1.23290000000000011	-126260	-102409	\N	c123b781-9327-1816-eee6-c13725e2d226	51	9804	bf0b2598-0fd6-4347-8595-6da2e0d90f31
331	DEBIT	Global Development	-10000	USD	2016-04-12 11:52:16.188-07	2017-11-02 14:23:27.94-07	59	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-10000	-10000	80	82500949-5dad-60e6-c203-aade4bb71870	9804	9804	c8dcaec5-9cd6-40ae-af08-ba2dfa39e09a
2233	DEBIT	Google I/O: Alicia Carr	-10000	USD	2016-10-04 08:44:35.988-07	2017-11-02 14:23:30.047-07	12	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-10000	-10000	387	e8486672-caa8-5474-b492-3d303b29713d	9804	9804	87ae08f0-4ada-40bc-9e3f-7d231aaf569c
2232	DEBIT	90/10 split: AT&T Sponsorship (April 2015)	-100000	USD	2016-10-04 08:44:28.558-07	2017-11-02 14:23:30.078-07	12	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-100000	-100000	389	d772e690-ba67-6b53-6cae-078ae7b031cd	9804	9804	79f44a93-58f0-4f5c-ac57-f7a46128a048
251	DEBIT	WwConnect Conference Set Up Day 1	-709	USD	2016-03-18 17:00:00-07	2016-06-14 11:14:21.805-07	14	31	26	\N	\N	\N	\N	\N	\N	USD	1	-709	-709	61	24d9d82f-5875-5337-3674-62d30dea283e	7538	9804	028b46fd-5161-452b-b59c-607e2232364a
2530	CREDIT	WWCode Director t-shirt	3649	USD	2016-10-17 13:50:42.245-07	2016-10-17 13:50:42.273-07	47	3	\N	\N	\N	\N	\N	\N	\N	USD	1	3649	3649	\N	7f10338a-2d90-e00b-b687-241583c4f398	9804	9804	ba3db141-40d7-491d-8558-0976c6bccd8f
4260	DEBIT	Meetup Fees	-6000	USD	2016-12-23 09:10:34.733-08	2017-11-02 14:23:31.601-07	265	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	619	191b79d4-14b3-de05-6bd5-8955289a56b3	9804	9804	bbc7356f-64b1-4cd3-8d25-8240ced149f1
2333	CREDIT	Hackathon Support Open Gov	45000	USD	2016-10-07 07:41:08.315-07	2016-10-07 07:41:08.391-07	300	3	\N	\N	\N	\N	\N	\N	\N	USD	1	45000	45000	\N	0d0aca6f-665c-ccc1-e5c9-aa17e8ffb45f	9804	9804	0be0109d-2aec-4859-99e5-23e5de1a068e
2337	CREDIT	Quotient Hackathon support	90000	USD	2016-10-07 12:52:59.206-07	2016-10-07 12:52:59.391-07	300	3	\N	\N	\N	\N	\N	\N	\N	USD	1	90000	90000	\N	0e2bdd67-79c5-d916-dcba-e106b230ff6a	9804	9804	f4ed0b38-768f-434c-88ef-02ba9b2a3751
2330	DEBIT	Network Budget pre Open Collective	-77659	GBP	2016-10-07 07:03:00.623-07	2016-10-07 07:03:00.89-07	278	3	\N	\N	\N	\N	\N	\N	\N	USD	1.23290000000000011	-95746	-77659	\N	40031079-4061-0f4a-d04f-aeaff1a092a0	51	9804	289b9c07-38b4-4e2d-8e76-b8f48d6fda9e
4252	CREDIT	Global Development for Meetup Fees	6000	USD	2016-12-23 08:54:04.928-08	2016-12-23 08:54:05.055-08	262	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	a6e14825-28df-11cb-b081-2bdbc700ccf0	9804	9804	0ead8536-260d-418d-a9f1-b1f3813d92a8
2413	CREDIT	Donation from Biotti	403	USD	2016-10-11 12:32:58.956-07	2016-10-11 12:32:59.265-07	301	3	\N	\N	\N	\N	\N	\N	\N	USD	1	403	403	\N	94c3bf3e-3d46-f9bf-c24a-cbf503a80a0e	9804	9804	0f1a90d4-66f0-4e73-b57c-3452865d8112
3523	CREDIT	Global Development	19100	USD	2016-11-29 14:17:18.389-08	2016-11-29 14:17:18.558-08	287	3	\N	\N	\N	\N	\N	\N	\N	USD	1	19100	19100	\N	90d8c116-d34a-def4-72ff-d6fb98cac674	9804	9804	bac2594a-4c23-4bd6-a11b-fbc42d2900bd
5027	CREDIT	WWCode t-shirt sales	1389	USD	2017-01-17 19:32:30.654-08	2017-01-17 19:32:30.825-08	15	3	\N	\N	\N	\N	\N	\N	\N	USD	1	1389	1389	\N	4e119e68-7685-ca6e-27ea-60a4f68d5cc1	9804	9804	bdbe6b38-559b-408b-9cfc-d00be820362b
7295	CREDIT	Paypal Fees for Travel Stipend	3000	USD	2017-03-20 08:38:54.453-07	2017-03-20 08:38:53.749-07	277	3	\N	\N	\N	\N	\N	\N	\N	USD	1	3000	3000	\N	a5c1fd04-6ffa-02f3-5417-f5f49eeef563	9804	9804	be4444b8-0a37-435c-bf9c-7313925c0b21
2420	CREDIT	Network Development (Thanks Zendesk)	16129	USD	2016-10-11 13:26:22.964-07	2016-10-11 13:26:23.172-07	298	3	\N	\N	\N	\N	\N	\N	\N	USD	1	16129	16129	\N	5222fc3b-99c8-c89c-6ae2-f0b6b833639d	9804	9804	be5d250e-5ee4-4ed2-afa9-24d303d94b68
9714	CREDIT	\N	2175	USD	2017-05-03 17:12:19.814-07	2017-05-03 17:12:19.814-07	259	3	\N	\N	\N	2702	0	0	0	USD	1	2175	2175	\N	58a1dd9b-0aaa-8e63-d599-f7faef9ebcb3	9804	9804	c016116d-d1b1-419c-a202-74a2ac178be1
4189	CREDIT	Global Development for Meetup fee	6000	USD	2016-12-21 10:49:53.054-08	2016-12-21 10:49:53.302-08	3	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	16084dfb-edab-5285-55ef-17d90a236f6b	9804	9804	eb5a0df4-25f4-4058-bfb1-fee8f4f8fba2
3527	CREDIT	Banner	2000	USD	2016-11-29 14:34:22.96-08	2016-11-29 14:34:23.085-08	47	3	\N	\N	\N	\N	\N	\N	\N	USD	1	2000	2000	\N	104a014f-06ba-71e7-c6a5-54fecdc9dd73	9804	9804	ebfd7fd3-8172-41a1-b580-84e8c6a7586e
333	CREDIT	From Deepa	1500	USD	2016-04-12 14:18:56.547-07	2016-04-16 13:40:58.847-07	4	3	\N	\N	\N	\N	\N	\N	\N	USD	1	1500	1500	\N	f8d3a02b-b7c9-dbcf-394f-a8436f3c7709	9804	9804	eea94c44-4402-48cf-b74f-75b45c469acd
2429	CREDIT	Network Development	19550	USD	2016-10-11 21:30:34.678-07	2016-10-11 21:30:34.772-07	295	3	\N	\N	\N	\N	\N	\N	\N	USD	1	19550	19550	\N	daad7f75-86b4-f6b7-8671-e2423a83f7ee	9804	9804	ef546423-7f95-4df2-8746-4dbec449c7d3
3599	DEBIT	Banner	-2000	USD	2016-11-30 10:40:24.258-08	2016-11-30 10:40:24.443-08	292	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-2000	-2000	\N	66434b10-c247-e5ae-ce61-5585985b3033	51	9804	3f2339e2-e098-459e-ac48-ab05bfba18f7
2431	CREDIT	Network Development (Thanks Atlassian) 	20000	USD	2016-10-11 22:06:05.058-07	2016-10-11 22:06:05.202-07	266	3	\N	\N	\N	\N	\N	\N	\N	USD	1	20000	20000	\N	f767c889-a64a-69bc-cc8d-df6e9620278b	9804	9804	f37b1512-069e-4b1a-b68b-31cec92ffbe5
3528	CREDIT	Regional Leadership Director Training 	13031	USD	2016-11-29 14:35:05.252-08	2016-11-29 14:35:05.379-08	47	3	\N	\N	\N	\N	\N	\N	\N	USD	1	13031	13031	\N	43e9ef86-b8a0-fa2d-c620-bcd14107cfee	9804	9804	f3fb2f86-09c2-4bee-9170-70ff0dadf9dd
8675	CREDIT	\N	1480	USD	2017-04-18 17:39:23.15-07	2017-04-18 17:39:23.15-07	14	3	\N	\N	\N	2508	0	0	0	USD	1	1480	1480	\N	2e06fa01-bd6b-0984-ff2d-6f075beae163	9804	9804	f4f52b45-5602-4c7f-b937-bf6276c92d63
4411	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 11:54:51.439-08	2016-12-27 11:54:51.679-08	4	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	e61fc85a-f1b5-c685-db80-dccb2ccc1305	9804	9804	f573a8dd-0f0f-4c42-be6a-1edd2f9ce841
864	DEBIT	Reimburse Caterina Paun for Program Expenses	-9995	USD	2016-02-24 16:00:00-08	2017-11-02 14:23:29.725-07	59	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-9995	-9995	224	4d9857d5-9a3e-3b77-a558-7a7f73f97719	9804	9804	2d2c982d-cefc-47f9-af12-715889f7a444
4384	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 09:24:55.371-08	2016-12-27 09:24:55.632-08	279	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	e5d607b2-1c4c-27a0-2aef-eb7eadabff49	9804	9804	1c86fe47-1147-4a37-b76f-3b8d76602b0a
4382	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 09:02:32.71-08	2016-12-27 09:02:32.843-08	277	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	713ac7a6-fd2b-45b5-8eef-7d32824eae1b	9804	9804	80205257-1938-4666-9b20-070accec6284
4380	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 08:58:32.613-08	2016-12-27 08:58:32.719-08	276	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	422c2aea-a401-ccfd-9cb6-aaa3c5ecfb8b	9804	9804	9094eecb-3150-47d5-b6ed-be688a1763b5
4374	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 08:48:52.922-08	2016-12-27 08:48:53-08	273	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	8d9e7c77-c0b3-e689-5263-680bd4c06f71	9804	9804	acd518f8-a1a9-4c1f-8fc5-a354f13b0070
4386	CREDIT	Global Development for Meetup Fee	4900	GBP	2016-12-27 09:32:02.798-08	2016-12-27 09:32:02.918-08	278	3	\N	\N	\N	\N	\N	\N	\N	USD	1.22449999999999992	6000	4900	\N	62e2eb6c-2031-77e3-cf08-3b8ed2b73364	9804	9804	c34b8b73-273f-4d07-8276-78f250d4544f
866	CREDIT	Nike Donation	50000	USD	2016-06-09 21:08:56.525-07	2016-06-09 21:08:56.991-07	59	3	\N	\N	\N	\N	\N	\N	\N	USD	1	50000	50000	\N	8fad6c1d-a5f4-19a7-144e-121d9d8a97c3	9804	9804	cd36e1b3-94bd-477f-ace5-e3dcdf25b737
3629	CREDIT	Global Development - Thanks VMWare	50000	USD	2016-11-30 13:34:00.324-08	2016-11-30 13:34:01.658-08	263	3	\N	\N	\N	\N	\N	\N	\N	USD	1	50000	50000	\N	117077b1-c779-0eec-3eb6-ef3b406b50ba	9804	9804	f008a3b5-7783-455d-b37a-d44792adf43b
8306	DEBIT	Stickers	-14630	USD	2017-04-07 05:58:45.517-07	2017-04-07 05:58:45.531-07	516	3419	2321	\N	\N	\N	\N	\N	454	USD	1	-14630	-15084	889	2a8e1791-4f3a-8877-54ae-5d697625e657	3898	9804	5636991b-ad2c-4e38-9ab7-1f8b77709c98
7296	DEBIT	To redeem travel stipend to Google I/O	-100000	USD	2017-03-20 08:39:23.328-07	2017-03-20 08:39:23.364-07	277	1332	2180	\N	\N	\N	\N	\N	4430	USD	1	-100000	-104430	924	d3897d34-cc89-617f-01f6-77381bb878d2	7243	9804	78dd2cff-3100-4259-bab9-d44ec938fc62
124	CREDIT	Donation to WWCode Washington DC	100	USD	2016-03-01 20:41:59.916-08	2016-04-16 13:40:58.728-07	13	126	93	\N	\N	95	5	10	33	USD	1	100	52	\N	0f57f00a-b705-5f2b-ceef-55136dd13645	4228	9804	410508cb-69d1-4a0f-98fe-b6b5b61c0fdf
3294	DEBIT	DIANA A. SCHOLARSHIP GOOGLE I/O	-25000	USD	2016-11-21 14:59:43.764-08	2017-11-02 14:23:30.301-07	272	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-25000	-25000	396	9af05325-54ab-092c-9f37-a348d5b9a4f8	9804	9804	ae5510b5-ab43-4028-a97b-a461ba347603
4400	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 10:33:56.275-08	2016-12-27 10:33:56.372-08	284	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	759a7dd8-be89-dd1c-9ed7-8f3eb7059f77	9804	9804	fa6d4bb5-c3c8-4bc4-a8e7-b886d8fb0589
4283	DEBIT	Meetup Fees	-6000	USD	2016-12-23 11:41:48.315-08	2017-11-02 14:23:31.837-07	269	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	627	1e193a24-741e-e5c1-c1dc-2043582e162c	9804	9804	6d7f459c-991f-4689-850e-7928e68a1fd7
4361	DEBIT	Meetup Fees	-6000	MXN	2016-12-27 08:12:26.224-08	2017-11-02 14:23:31.899-07	299	3	\N	\N	\N	\N	\N	\N	\N	USD	0.0485049999999999995	-291	-6000	632	adba9965-fc79-a933-099a-53769d9032da	9804	9804	30083b4f-81f4-442b-8b39-dc173bf74009
4364	DEBIT	Meetup Fees	-6000	USD	2016-12-27 08:16:27.082-08	2017-11-02 14:23:31.928-07	271	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	633	b875f7c8-66ac-b903-f16c-71ed030d33b2	9804	9804	c15fe685-955c-4dd4-8692-8ac2871d4094
4366	DEBIT	Meetup Fees	-6000	USD	2016-12-27 08:23:35.936-08	2017-11-02 14:23:31.957-07	13	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	634	3e87cac2-1217-6609-7031-c888c47308b6	9804	9804	a710a972-4827-44cc-934e-53e709b7c44a
4388	DEBIT	Meetup Fees	-4900	GBP	2016-12-27 09:34:46.469-08	2017-11-02 14:23:32.278-07	278	3	\N	\N	\N	\N	\N	\N	\N	USD	1.22449999999999992	-6000	-4900	647	0eac410c-dde6-46d9-71d8-8a5c35e494bb	9804	9804	bb0990f3-8967-4c33-ba66-ea79ab95f241
4390	DEBIT	Meetup Fees	-6000	USD	2016-12-27 09:49:39.83-08	2017-11-02 14:23:32.307-07	280	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	648	31dd030a-bffd-ed28-964f-4c1d876dd50d	9804	9804	fbd6d16d-a7d4-42c6-b6ed-986f7177e2ea
3598	CREDIT	Network Development	20000	USD	2016-11-30 10:40:15.233-08	2016-11-30 10:40:15.446-08	292	3	\N	\N	\N	\N	\N	\N	\N	USD	1	20000	20000	\N	1fa232f7-46c2-da70-8085-efcf0a61d977	9804	9804	21ffeb85-aa93-4724-9c54-dc84eadf8a96
4404	CREDIT	Global Development for Meetup Fees	6000	USD	2016-12-27 10:40:49.86-08	2016-12-27 10:40:49.921-08	286	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	477d8aca-dd6b-ca6b-124e-65b58f4d5339	9804	9804	24bf26bd-6e7b-4dc2-aa04-2aa5d069dadd
4257	CREDIT	Global Development for Meetup Fee	4900	GBP	2016-12-23 09:02:53.836-08	2016-12-23 09:02:53.991-08	264	3	\N	\N	\N	\N	\N	\N	\N	USD	1.2249000000000001	6002	4900	\N	fbe1804b-d331-a59a-8326-dc12610ab80e	9804	9804	254a7165-560f-4371-9c92-417fecc27d5b
5016	CREDIT	WWCode Boston t-shirt sales	1964	USD	2017-01-17 19:19:47.816-08	2017-01-17 19:19:48.024-08	195	3	\N	\N	\N	\N	\N	\N	\N	USD	1	1964	1964	\N	bcbd7cf7-3d26-47aa-10a1-09dd34644c1b	9804	9804	ac6801f1-4be6-4232-9e7b-a83cd2d34e32
5018	CREDIT	WWCode t-shirt sales	1599	USD	2017-01-17 19:21:50.791-08	2017-01-17 19:21:50.964-08	271	3	\N	\N	\N	\N	\N	\N	\N	USD	1	1599	1599	\N	dd6ad4cd-863e-d66a-12ba-bae2e60c6be9	9804	9804	d51b2f39-7d87-4908-8563-2c378c094974
252	DEBIT	Nike Dinner	-1000	USD	2016-03-17 17:00:00-07	2016-06-14 11:14:21.805-07	14	31	26	\N	\N	\N	\N	\N	\N	USD	1	-1000	-1000	62	8ad11c1e-9cf3-7f03-d6ba-4fec69ec87b9	7538	9804	70280c00-add4-4f43-8d09-278cee33295b
2815	DEBIT	Markers, pens, sticky notes (ATXDivHack)	-2108	USD	2016-10-31 14:13:19.592-07	2016-10-31 14:13:19.745-07	2	28	1043	\N	\N	\N	\N	\N	\N	USD	1	-2108	-2108	448	3f383711-9576-0e0d-c5c6-91ba7546d04e	6280	9804	ad4b3a5d-f20d-4f48-9bfb-c602b51b9d2e
2816	DEBIT	Drinks for Happy Hour (ATXDivHack)	-5518	USD	2016-10-31 14:13:39.794-07	2016-10-31 14:13:40.146-07	2	28	1043	\N	\N	\N	\N	\N	\N	USD	1	-5518	-5518	447	b86d440a-ba76-7f7b-6525-df2fd609895c	6280	9804	78819cb2-0fb2-4af1-886a-be26d0a43317
612	CREDIT	Women Techmaker WWCode Partnership Grant	120000	USD	2016-05-19 12:10:52.797-07	2016-05-19 12:10:54.053-07	12	3	\N	\N	\N	\N	\N	\N	\N	USD	1	120000	120000	\N	3163d9af-bf1b-95c1-35ee-eac043dd37cd	9804	9804	e33b39fb-82b2-468f-806a-45850693c250
9943	CREDIT	\N	90000	USD	2017-05-11 09:41:16.759-07	2017-05-11 09:41:16.759-07	59	3	\N	\N	\N	2794	0	0	0	USD	1	90000	90000	\N	4adab15e-9b4a-998f-4b44-d3134c1bca76	9804	9804	d8373359-ad58-4608-bc8a-57d8809b8a10
2341	CREDIT	Network Development (100%)	10000	USD	2016-10-07 13:05:13.011-07	2016-10-07 13:05:13.112-07	300	3	\N	\N	\N	\N	\N	\N	\N	USD	1	10000	10000	\N	654655ff-123f-8b44-a581-2435cb22332f	9804	9804	dababc71-b682-4645-9ed2-c7ba634d1d01
98	DEBIT	Libretas Hackathon	-1038000	MXN	2016-02-16 10:56:17.216-08	2016-06-14 11:14:21.738-07	10	7	\N	2016-06-14 11:14:22.435-07	\N	\N	\N	\N	\N	USD	0.053054999999999998	-55071	-1038000	33	4c28c687-617e-a74d-2bf5-49d311ded47f	5788	9804	9707866b-82fd-4d69-a29d-ce9f755e1cc8
3521	CREDIT	Erica S. donation - fees	450	USD	2016-11-29 14:11:37.922-08	2016-11-29 14:11:38.131-08	287	3	\N	\N	\N	\N	\N	\N	\N	USD	1	450	450	\N	7fd768da-5292-4b67-7366-50a4ca975047	9804	9804	dbc6137e-ba2a-4a0e-8c56-a45df31cb78d
3206	CREDIT	$3500 Course Hero Hackathon support - transaction & global development	304500	USD	2016-11-17 10:27:12.528-08	2016-11-17 10:27:12.742-08	59	3	\N	\N	\N	\N	\N	\N	\N	USD	1	304500	304500	\N	097d27f9-d2f8-b29c-27d9-102c430c780b	9804	9804	dda4d208-9c1c-4824-a1b6-562ab3d611d6
461	DEBIT	WWC Stickers	-7000	USD	2016-03-17 17:00:00-07	2016-06-14 11:14:21.998-07	15	68	\N	2016-06-14 11:14:22.481-07	\N	\N	\N	\N	\N	USD	1	-7000	-7000	138	f88c3b0e-e9c0-4b83-28cc-92004397f751	8203	9804	470b5ca9-4bb1-4f83-ac4a-0bc8e317efa6
3543	CREDIT	Donation via Meetup	775	USD	2016-11-29 15:39:08.069-08	2016-11-29 15:39:08.263-08	300	3	\N	\N	\N	\N	\N	\N	\N	USD	1	775	775	\N	ade3c0f1-76a1-855c-0dc7-bcd6f4a61971	9804	9804	dfd580fd-9af5-4a95-8edf-b07e1224a47b
1170	DEBIT	Global Development	-150	USD	2016-07-08 20:52:40.722-07	2017-11-02 14:23:28.096-07	4	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-150	-150	93	b9aa06f6-de52-06d3-41ad-782eaa9b5f86	9804	9804	4c863608-ce56-480b-ad1e-58ba09a33747
640	DEBIT	May 2 Lightning Talks	-8979	USD	2016-05-22 16:46:04.647-07	2016-06-14 11:14:22.092-07	2	28	26	\N	\N	\N	\N	\N	\N	USD	1	-8979	-8979	184	da411139-5435-c752-a447-d2ed583468f5	6280	9804	e2d725c6-1288-4a64-8283-2ede09b7dda4
639	DEBIT	April 4 Lightning Talks	-13315	USD	2016-05-22 16:46:04.647-07	2016-06-14 11:14:22.091-07	2	28	26	\N	\N	\N	\N	\N	\N	USD	1	-13315	-13315	183	eb09fae7-4d5f-7969-b269-da715cf2322c	6280	9804	3eaaf163-f38c-4ff9-bb72-76360d2ea6ce
674	DEBIT	CONFERENCE GRANT	-50000	USD	2016-05-10 17:00:00-07	2017-11-02 14:23:29.54-07	59	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-50000	-50000	196	2125c942-25d7-07e3-dd04-4de37ce99f20	9804	9804	5fa83ec7-c1f3-473d-a083-637ecd6d4fee
822	DEBIT	3/30/16 Python Gameathon prize - Udemy course	-2400	USD	2016-06-04 14:37:03.991-07	2016-06-14 11:14:22.155-07	2	28	320	\N	\N	\N	\N	\N	\N	USD	1	-2400	-2400	213	a6d9c730-d2ea-7914-52c8-ddef97c729ff	6280	9804	7bdc5ffb-a7a5-4181-8116-09b2d21780a1
641	DEBIT	05-21-16 AI workshop	-30000	USD	2016-05-22 17:26:36.061-07	2016-06-14 11:14:22.092-07	2	28	\N	2016-06-14 11:14:22.535-07	\N	\N	\N	\N	\N	USD	1	-30000	-30000	186	02c0cd41-8e86-f7e1-5df6-7521d96507d4	6280	9804	0d38a20f-de09-4aed-9f9b-79c50798a62b
9658	CREDIT	\N	300000	USD	2017-05-02 11:43:43.157-07	2017-05-02 11:43:43.157-07	12	3	\N	\N	\N	2676	0	0	0	USD	1	300000	300000	\N	196c7c2f-fa6b-e0d3-13a3-8f74975e249f	9804	9804	981d5157-448a-46e8-a805-bca411a657bf
9659	CREDIT	\N	60000	USD	2017-05-02 11:45:44.253-07	2017-05-02 11:45:44.253-07	51	3	\N	\N	\N	2677	0	0	0	USD	1	60000	60000	\N	2476fb33-48b1-bdaa-4f57-26c97517da6a	9804	9804	cba21a72-374c-4e3d-ba0f-9ee85b8889a6
1403	DEBIT	Transportation for Sandra and Cici to get to meeting location with core team members	-749	USD	2016-08-02 06:39:15.789-07	2016-08-02 06:39:15.797-07	14	31	320	\N	\N	\N	\N	\N	\N	USD	1	-749	-749	256	4a92fdb8-8588-03cf-be67-acfba0b4ba65	7538	9804	bb5b0530-db20-4c22-81ca-a27b64a31dcb
1587	DEBIT	STEM Toys for Coding with Kids Event	-8496	USD	2016-08-16 07:58:01.764-07	2016-08-16 07:58:01.789-07	48	142	573	\N	\N	\N	\N	\N	\N	USD	1	-8496	-8496	294	bb7e367e-035d-1561-9930-e7579ec3dd3e	8492	9804	bd051ed0-26c4-48d1-a97a-3bbf98734340
1588	DEBIT	STEM Toys for Coding with Kids Event	-10212	USD	2016-08-16 07:58:32.03-07	2016-08-16 07:58:32.041-07	48	142	573	\N	\N	\N	\N	\N	\N	USD	1	-10212	-10212	293	1a65c962-26ee-179f-bb79-10707e703a9e	8492	9804	86f73002-3d32-4da4-ae6f-9d3ad8c380c4
1042	CREDIT	Donation from MondoRobot & Avery Brewing Company: Hackathon Proceeds	320247	USD	2016-06-29 11:42:31.848-07	2016-06-29 11:42:32.517-07	15	3	\N	\N	\N	\N	\N	\N	\N	USD	1	320247	320247	\N	68b8e163-4c5b-6217-0a03-f324bdfa2b60	9804	9804	cacca948-5004-4814-8c72-558b20d75d08
1630	DEBIT	Dinner for last night's HackNight	-13526	USD	2016-08-19 13:58:34.342-07	2016-08-19 13:58:34.554-07	48	142	573	\N	\N	\N	\N	\N	\N	USD	1	-13526	-13526	319	6c006e9c-7fcd-bc58-4ff3-9a56310af199	8492	9804	fc26921b-78a9-406f-a00b-3d661c05ad5e
2237	CREDIT	Donation: Syema Ailia	2500	USD	2016-10-04 08:47:46.468-07	2016-10-04 08:47:46.624-07	12	3	\N	\N	\N	\N	\N	\N	\N	USD	1	2500	2500	\N	4d8a1e4a-ebfb-d465-7b1d-326067822564	9804	9804	ebff3e58-5199-4d30-a123-2a4876de9d47
2236	CREDIT	Donation: Beth Laing	5000	USD	2016-10-04 08:47:24.058-07	2016-10-04 08:47:24.175-07	12	3	\N	\N	\N	\N	\N	\N	\N	USD	1	5000	5000	\N	c183a30d-ff16-e2e4-6e68-bb7dd0d16b16	9804	9804	f12fdf5a-abf3-4f66-ac57-4f8f151d1f68
2242	CREDIT	Reverse duplicate transaction	500	USD	2016-10-04 09:12:26.671-07	2016-10-04 09:12:26.903-07	12	3	\N	\N	\N	\N	\N	\N	\N	USD	1	500	500	\N	4c7204c8-c4c8-1aa6-bb5f-041ece3c5f6c	9804	9804	a55cb828-4172-4978-baca-fb4254c02c8a
2230	CREDIT	Conference Grant: Google/IO Alicia Carr	10000	USD	2016-10-04 08:25:59.981-07	2016-10-04 08:26:00.186-07	12	3	\N	\N	\N	\N	\N	\N	\N	USD	1	10000	10000	\N	9df0054e-b82a-638d-7edd-47ae6b6193ce	9804	9804	aa510059-e07b-4500-b5d4-f319773acb4c
2234	CREDIT	Donations made via Meetup as of Jan 2016, less transaction fees	9212	USD	2016-10-04 08:46:17.845-07	2016-10-04 08:46:18.02-07	12	3	\N	\N	\N	\N	\N	\N	\N	USD	1	9212	9212	\N	8d93bea0-fbe3-1cfc-8613-abd6fa06ffe1	9804	9804	8ef34592-6bcf-426c-aea7-7b558d391ded
2239	DEBIT	90/10 split: Beth Laing	-500	USD	2016-10-04 09:06:09.85-07	2017-11-02 14:23:30.139-07	12	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-500	-500	391	158a3ad9-3e5f-6b11-facd-8a6c298d5887	9804	9804	510734d9-45eb-4049-aaee-12a7e11cabb3
2238	DEBIT	90/10 split: Turner matching donation	-500	USD	2016-10-04 09:06:02.036-07	2017-11-02 14:23:30.205-07	12	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-500	-500	393	7ef5084d-5235-bef4-5804-f8d44b9ada8b	9804	9804	74a42b25-d286-4fef-a2aa-aec720ec9287
2241	DEBIT	90/10 split: Syema Ailia	-250	USD	2016-10-04 09:06:23.454-07	2017-11-02 14:23:30.108-07	12	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-250	-250	390	b5cb37e8-58e9-653e-890e-4cac022f64af	9804	9804	34eb548a-897b-491f-b7fb-32a9f77b26b2
2240	DEBIT	90/10 split: Beth Laing	-500	USD	2016-10-04 09:06:16.796-07	2017-11-02 14:23:30.168-07	12	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-500	-500	392	072538e6-ca0e-202c-389a-796c0385d04c	9804	9804	569c2a53-191d-4ea5-ad5c-3f2fe0fee65a
2245	CREDIT	Donation received via Meetup, less fees	788	USD	2016-10-04 09:46:13.302-07	2016-10-04 09:46:13.487-07	12	3	\N	\N	\N	\N	\N	\N	\N	USD	1	788	788	\N	c2d404cb-c53c-ba9f-ec63-019167f99fbd	9804	9804	6835bb12-d051-4c36-ac4b-126dbd105a54
2301	CREDIT	Blurb donation	54000	USD	2016-10-06 09:06:35.799-07	2016-10-06 09:06:36.235-07	3	3	\N	\N	\N	\N	\N	\N	\N	USD	1	54000	54000	\N	39cb92df-b193-f3a1-74b5-52909589f735	9804	9804	3414f65e-f9e0-4aed-9ce2-a12f39a276b4
2254	CREDIT	Network budget balance pre Open Collective	34240	USD	2016-10-04 14:49:31.268-07	2016-10-04 14:49:31.543-07	15	3	\N	\N	\N	\N	\N	\N	\N	USD	1	34240	34240	\N	926b8300-9539-847e-7fc5-f1b509041537	9804	9804	9cb40eee-91b3-45f4-b4fb-d58230f610cd
2302	DEBIT	Network Stickers	-58590	USD	2016-10-06 09:08:07.615-07	2016-10-06 09:08:07.66-07	3	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-58590	-58590	\N	b89677d6-1883-f3a5-a78c-a966e89c0b26	51	9804	99bfb1c7-fd3e-4f0e-a131-9a7f5f3805e6
2257	DEBIT	Net budget balance pre-Open Collective	-56266	USD	2016-10-04 14:57:44.218-07	2017-11-02 14:23:30.238-07	2	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-56266	-56266	394	4c24e754-535b-e277-0b63-91b102290120	9804	9804	7b2d6d38-10dd-4a83-81de-f64904c4f57a
2304	DEBIT	Conference stipend Udisha S.	-75000	USD	2016-10-06 10:21:09.865-07	2016-10-06 10:21:09.933-07	13	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-75000	-75000	\N	0a06cfea-564a-5a45-7926-1ea2f64e5f95	51	9804	bb9ba348-631d-4f55-81ba-a74a0fca2beb
2258	DEBIT	90/10 split: Hackathon donation	-32000	USD	2016-10-04 15:05:22.85-07	2017-11-02 14:23:30.27-07	15	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-32000	-32000	395	d274f5b2-bc27-811c-53bf-3cf9212b0540	9804	9804	6c33bbbb-8b81-4cda-b31c-ebd6af14785b
2305	CREDIT	Google I/O scholarship	75000	USD	2016-10-06 10:21:27.384-07	2016-10-06 10:21:27.396-07	13	3	\N	\N	\N	\N	\N	\N	\N	USD	1	75000	75000	\N	8d5f8cc6-74b3-61c6-0e28-44623060b1cb	9804	9804	bf3e8fee-358b-4478-b0b0-8ef0d49d1803
6882	CREDIT	Leadership Development 	14915	MXN	2017-03-07 04:55:53.128-08	2017-03-07 04:55:53.3-08	511	3	\N	\N	\N	\N	\N	\N	\N	USD	0.0513100000000000014	765	14915	\N	203bd75a-3869-12cf-5f9f-ce7b4bc232a0	9804	9804	a36875a2-d595-4551-8eeb-a4e18fec143d
6883	CREDIT	Leadership Development	50616	MXN	2017-03-07 05:01:15.044-08	2017-03-07 05:01:15.192-08	282	3	\N	\N	\N	\N	\N	\N	\N	USD	0.0513100000000000014	2597	50616	\N	a0f389cf-0b46-d544-cdc6-04ad07c786cf	9804	9804	3684d6b8-930a-462d-998f-f875851f1349
9695	CREDIT	\N	150000	USD	2017-05-03 10:32:39.653-07	2017-05-03 10:32:39.653-07	12	3	\N	\N	\N	2693	0	0	0	USD	1	150000	150000	\N	56edece1-26f0-60e5-74e0-e48d57b68615	9804	9804	925e4218-5c46-400d-8c00-f85e925a272d
9696	CREDIT	\N	30000	USD	2017-05-03 10:33:13.688-07	2017-05-03 10:33:13.688-07	51	3	\N	\N	\N	2694	0	0	0	USD	1	30000	30000	\N	dd29aea9-7082-fcc4-dc16-60af54a149ee	9804	9804	23ab00f7-6e95-45e8-88e6-fa35a312cd4c
9698	CREDIT	\N	75000	USD	2017-05-03 10:44:10.84-07	2017-05-03 10:44:10.84-07	12	3	\N	\N	\N	2696	0	0	0	USD	1	75000	75000	\N	769c5324-792a-04a3-7883-0f8cd48eac15	9804	9804	20323f32-dedd-49a6-a987-b53f5d79a73a
9699	CREDIT	\N	15000	USD	2017-05-03 10:44:48.715-07	2017-05-03 10:44:48.715-07	51	3	\N	\N	\N	2697	0	0	0	USD	1	15000	15000	\N	caae0a65-6415-4c56-8435-60824408c688	9804	9804	03fe1d84-514d-4bac-a05e-14697d313c67
2269	CREDIT	Donation from Adane	450	USD	2016-10-04 15:56:11.881-07	2016-10-04 15:56:13.02-07	260	3	\N	\N	\N	\N	\N	\N	\N	USD	1	450	450	\N	7b324f30-e556-2441-54fc-ea698647683e	9804	9804	58e240a1-9f98-4419-aea6-0c07c417426f
2430	CREDIT	Network budget pre Open Collective 	162598	USD	2016-10-11 22:01:43.648-07	2016-10-11 22:01:43.828-07	264	3	\N	\N	\N	\N	\N	\N	\N	USD	1	162598	162598	\N	75baf17e-4d1e-8c27-ad19-8fa83743de09	9804	9804	a4eda4e4-674f-4bc9-b285-0ea494d53d6e
2395	DEBIT	Google I/O stipend	-50000	USD	2016-10-11 09:00:21.246-07	2016-10-11 09:00:22.203-07	195	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-50000	-50000	\N	d9be0a20-bbd0-e0dc-a323-261838c59956	51	9804	9d5e5327-1884-4e15-886c-49f2e10cc524
2394	CREDIT	Conference stipend Heidi H.	50000	USD	2016-10-11 08:59:30.363-07	2016-10-11 08:59:31.524-07	195	3	\N	\N	\N	\N	\N	\N	\N	USD	1	50000	50000	\N	2ba68eff-0102-29fa-94fc-6f05bb311b7b	9804	9804	9e112a13-bcc7-46c3-bd22-477889a2e211
2531	DEBIT	WWCode Director t-shirt	-3649	USD	2016-10-17 13:50:53.853-07	2016-10-17 13:50:53.855-07	47	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-3649	-3649	\N	104c93ab-5ed5-dd4c-a347-73d8bddd3743	51	9804	20dbb4fb-a6a0-40ae-b1bb-f6273b8ba86a
2532	CREDIT	Director t-shirt	2860	USD	2016-10-17 13:55:47.647-07	2016-10-17 13:55:47.671-07	12	3	\N	\N	\N	\N	\N	\N	\N	USD	1	2860	2860	\N	e330f701-4324-860f-667a-13e7786c0705	9804	9804	87b94077-f843-40a9-bfc0-ee6762b948ae
2533	DEBIT	Director t-shirt	-2860	USD	2016-10-17 13:56:00.744-07	2016-10-17 13:56:00.777-07	12	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-2860	-2860	\N	00768de6-b738-9d91-df7b-4b53ab93200d	51	9804	d70ea039-ae24-4e0f-8b2d-da97ed1c7034
2534	CREDIT	Director t-shirt	2898	USD	2016-10-17 13:57:08.514-07	2016-10-17 13:57:08.533-07	3	3	\N	\N	\N	\N	\N	\N	\N	USD	1	2898	2898	\N	a06548c5-0229-8fed-e09e-751ab833d5f3	9804	9804	ad7d27a5-8c0d-40ae-8d9e-8398f96f821e
2535	DEBIT	Director t-shirt	-2898	USD	2016-10-17 13:57:20.051-07	2016-10-17 13:57:20.056-07	3	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-2898	-2898	\N	180d4b36-db62-4e35-3b30-edeb9b1ef661	51	9804	5f46d89a-7e48-4490-a6ed-ed52580697a0
2537	DEBIT	Director t-shirt	-3186	USD	2016-10-17 13:58:31.776-07	2016-10-17 13:58:31.789-07	271	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-3186	-3186	\N	075f6381-27d1-b70e-e8c4-c2eff14ea5ad	51	9804	4655b11d-ef4c-4dc8-a49c-a71de1c59e63
2824	DEBIT	05-21-16 AI workshop	-30000	USD	2016-10-31 14:16:09.23-07	2016-10-31 14:16:09.38-07	2	28	1043	\N	\N	\N	\N	\N	\N	USD	1	-30000	-30000	186	3821f924-85b2-d970-3374-8e1274797f9e	6280	9804	66547131-6b53-40cc-b148-fd1bd19004a0
2536	CREDIT	Director t-shirt	3186	USD	2016-10-17 13:58:21.952-07	2016-10-17 13:58:22.083-07	271	3	\N	\N	\N	\N	\N	\N	\N	USD	1	3186	3186	\N	ee020899-33d2-8003-4f84-a24257bfd2cd	9804	9804	db44a66c-20ef-4f91-8f2d-e70e0adde1ea
2538	CREDIT	Director t-shirt	3325	USD	2016-10-17 14:00:51.295-07	2016-10-17 14:00:51.425-07	298	3	\N	\N	\N	\N	\N	\N	\N	USD	1	3325	3325	\N	fd98cd9b-91f6-2576-72ec-88939e51abf2	9804	9804	fcf8a80e-b599-4117-b8a4-6d6408d2b471
3530	DEBIT	Regional Leadership Director Training	-631	USD	2016-11-29 14:38:46.551-08	2016-11-29 14:38:46.748-08	47	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-631	-631	\N	3e304e74-9a92-8c2b-3b51-cfd3c01d4c9e	51	9804	21021225-7c85-4db3-afd2-108a06e8d84f
2528	CREDIT	WWCode shirt Grisel	3649	USD	2016-10-17 13:48:59.282-07	2016-10-17 13:48:59.313-07	282	3	\N	2017-11-06 16:00:00-08	\N	\N	\N	\N	\N	USD	1	3649	3649	\N	0d4b23c4-a845-06ad-de3b-9e097509b136	9804	9804	36f7c286-e20e-4218-b759-df2fa14bc4e9
2529	DEBIT	WWCode Director shirt	-3649	USD	2016-10-17 13:49:16.114-07	2016-10-17 13:49:16.113-07	282	3	\N	2017-11-06 16:00:00-08	\N	\N	\N	\N	\N	USD	1	-3649	-3649	\N	eabd05b1-f329-b2b6-ebf7-5e3cf604002f	51	9804	593f48e2-a5c1-4b82-b47e-1b2efefd1e35
7042	CREDIT	Women Who Code Atlanta &amp; DevNexus Soirée - fees + global	10875	USD	2017-03-13 10:05:28.744-07	2017-03-13 10:05:31.582-07	12	3	\N	\N	\N	\N	\N	\N	\N	USD	1	10875	10875	\N	4bbaaa9f-c9b5-09cc-34a6-0f65c918229c	9804	9804	0248ba4b-932a-403b-9770-b5738761aaf3
7043	CREDIT	Women Who Code Atlanta &amp; DevNexus Soirée global networks support	1450	USD	2017-03-13 10:06:48.459-07	2017-03-13 10:06:51.099-07	51	3	\N	\N	\N	\N	\N	\N	\N	USD	1	1450	1450	\N	bb24020c-5781-49a5-97df-709878c1a4a9	9804	9804	724056e9-fd07-4ef0-831b-f0388de1d55f
2339	DEBIT	Network budget pre Open Collective	-230712	USD	2016-10-07 13:01:03.429-07	2016-10-07 13:01:03.535-07	300	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-230712	-230712	\N	7b91b6e3-46e4-ff55-bfbb-c9bf04707051	51	9804	53e1a63e-0db6-4e23-a2e9-fb030fd52c53
2808	DEBIT	Monthly team meeting w core six members. Food/pizza	-3323	USD	2016-10-31 14:02:15.762-07	2016-10-31 14:02:16.402-07	14	31	1024	\N	\N	\N	\N	\N	\N	USD	1	-3323	-3323	400	15381d77-fcd6-d540-1f4f-e23175fbf82a	7538	9804	49a4741e-6071-4bd8-9bee-9e10ce0332a0
2809	DEBIT	Costco breakfast, lunch, drinks, plates, cups, utensils, snacks, deserts ...	-48435	USD	2016-10-31 14:08:49.332-07	2016-10-31 14:08:49.517-07	300	1371	1042	\N	\N	\N	\N	\N	\N	USD	1	-48435	-48435	417	789e4d31-87a5-7e16-62b1-42660fc58f36	1060	9804	942178a7-f72e-490e-8214-72cf4fc8a7e1
2739	DEBIT	DJ (ATXDivHack)	-35000	USD	2016-10-27 14:08:48.506-07	2016-10-27 14:08:48.71-07	2	28	1024	\N	\N	\N	\N	\N	\N	USD	1	-35000	-35000	453	42b30f9d-9196-147f-6ea5-d2612174b82b	6280	9804	dd1b8785-fbdb-41fc-83ba-63fd0b6ecc1f
4259	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 09:08:24.515-08	2016-12-23 09:08:24.709-08	265	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	644d090b-14b8-30a6-ab47-d17d7cbf25eb	9804	9804	f57866f4-aa75-4f51-9265-fed6de9c8c4f
70	CREDIT	Donation to WWCode Washington DC	100	USD	2016-02-02 09:04:56.247-08	2016-04-16 13:40:58.698-07	13	30	43	\N	\N	69	5	10	33	USD	1	100	52	\N	cbf2e7d6-298c-bbc9-7e91-566b9e1e64ab	2385	9804	b4a31066-16a0-4e70-a3e0-8ae20773e969
4370	CREDIT	Global Development for Meetup Fee	5700	EUR	2016-12-27 08:34:45.59-08	2016-12-27 08:34:45.771-08	298	3	\N	\N	\N	\N	\N	\N	\N	USD	1.04449999999999998	5954	5700	\N	2773fe18-207c-baaa-1a4f-40ac35f75de3	9804	9804	b18c7334-75f3-48d3-9fd8-b1e6dc9fa8cd
126	CREDIT	Recurring subscription	100	USD	2016-03-02 09:53:54.346-08	2016-04-16 13:40:58.736-07	14	30	41	\N	\N	67	5	10	33	USD	1	100	52	\N	c24ea525-dcbc-9960-4112-97471334a39a	2385	9804	353ac69f-fd73-4371-873a-bf78ac58c14a
702	CREDIT	WOMEN TECHMAKER WWCODE PARTNERSHIP GRANT	80000	USD	2016-05-31 11:01:08.532-07	2016-05-31 11:01:07.064-07	13	3	\N	\N	\N	\N	\N	\N	\N	USD	1	80000	80000	\N	fbf041b2-f782-623d-c7e2-a7fd27b38d19	9804	9804	dff80d8a-2250-459c-b3bb-f7d16f8ffcce
653	CREDIT	Women Techmaker WWCode Partnership Grant	15000	USD	2016-05-24 13:12:34.913-07	2016-05-24 13:12:35.226-07	13	3	\N	\N	\N	\N	\N	\N	\N	USD	1	15000	15000	\N	b6fb31f9-c40d-f2dc-dd02-62b9c016f071	9804	9804	f98eec07-3149-4881-b928-ae206eefea10
7070	DEBIT	February Lightning Talks food	-10680	USD	2017-03-14 10:17:53.891-07	2017-03-14 10:17:53.957-07	2	28	1893	\N	\N	\N	\N	\N	340	USD	1	-10680	-11020	820	c1377816-d05d-452f-b163-2ac9f34fcd84	6280	9804	ab6f4c31-871c-4f3e-a723-6d52739bf442
7071	DEBIT	Mar 7 Lightning Talks	-15316	USD	2017-03-14 10:21:29.296-07	2017-03-14 10:21:29.332-07	2	28	1893	\N	\N	\N	\N	\N	474	USD	1	-15316	-15790	57	fbe4e139-4217-a9df-a51c-4065d77cec2e	6280	9804	fd070c80-8e93-45cd-9823-e221e6955752
7072	DEBIT	meetup with speaker, Heather VanCura, in conjunction with DevNexus conference	-20950	USD	2017-03-14 10:22:10.666-07	2017-03-14 10:22:10.681-07	12	70	1893	\N	\N	\N	\N	\N	638	USD	1	-20950	-21588	899	6f4bd17a-4992-61ee-2aa4-3130b48498d0	1115	9804	2c666256-c9fd-4454-a4d1-00a224225974
68	CREDIT	Donation to WWCode Seattle	100	USD	2016-02-02 08:36:38.327-08	2016-04-16 13:40:58.702-07	14	30	41	\N	\N	67	5	10	33	USD	1	100	52	\N	13a04222-c205-1384-6c50-1bb630cd78bb	2385	9804	1eb0e585-f4ed-4b81-ac05-ffa9955d11fe
7073	DEBIT	IWD event -- wine for event	-9732	USD	2017-03-14 10:22:31.446-07	2017-03-14 10:22:31.46-07	12	70	1893	\N	\N	\N	\N	\N	312	USD	1	-9732	-10044	900	ecd93cb8-d1b6-5a34-d2fd-b4983bb58fa2	1115	9804	3a4efc50-5ade-4b32-8105-dd17d41d486d
208	DEBIT	Food for March Boulder, CO event	-14000	USD	2016-03-17 11:48:54.413-07	2016-06-14 11:14:21.77-07	15	68	26	\N	\N	\N	\N	\N	\N	USD	1	-14000	-14000	46	b5d4cd2d-6ba0-36d2-4f54-2c0341bac4c8	8203	9804	42b3bc94-8c8a-4dd2-afed-6953634c0030
2800	DEBIT	WWCode Seattle planning lunch with Sara	-2700	USD	2016-10-31 10:52:44.962-07	2016-10-31 10:52:45.274-07	14	32	1024	\N	\N	\N	\N	\N	\N	USD	1	-2700	-2700	420	27fdfd2d-6602-df36-abe7-2c717055247b	6353	9804	243e395b-a56f-44f8-8813-a978b0269b95
2801	DEBIT	Monthly core team meeting. Beverages with dinner for six members 	-3080	USD	2016-10-31 10:59:53.602-07	2016-10-31 10:59:53.96-07	14	31	1024	\N	\N	\N	\N	\N	\N	USD	1	-3080	-3080	401	b81392b5-a3ec-2a83-1ab6-460d6433254c	7538	9804	79d32406-744e-47ee-a888-6c3d6b11d75c
2811	DEBIT	May AI Workshop	-26800	USD	2016-10-31 14:10:54.112-07	2016-10-31 14:10:54.327-07	2	28	1042	\N	\N	\N	\N	\N	\N	USD	1	-26800	-26800	452	25bce8e2-2f58-fd9d-cce9-ef5c1d122ad7	6280	9804	cad0bf55-3f1a-4b7f-aa8d-50b0173d8ffc
2812	DEBIT	June South Hack Night	-20568	USD	2016-10-31 14:11:20.573-07	2016-10-31 14:11:20.753-07	2	28	1042	\N	\N	\N	\N	\N	\N	USD	1	-20568	-20568	451	26cf6ca3-161e-3ca0-1c31-c047c7d264e1	6280	9804	99947a00-e951-4750-ba75-ffa967aa3bdd
2814	DEBIT	Drinks and snacks (ATXDivHack)	-75932	USD	2016-10-31 14:13:05.943-07	2016-10-31 14:13:06.106-07	2	28	1043	\N	\N	\N	\N	\N	\N	USD	1	-75932	-75932	449	6504ccba-d153-d1e0-cc2f-2a20e2094a35	6280	9804	bb8cea88-3d06-4c46-9750-abe41a425f28
7079	DEBIT	Movie screening for "She Started It"	-25700	USD	2017-03-14 10:59:53.142-07	2017-03-14 10:59:53.153-07	48	142	2149	\N	\N	\N	\N	\N	775	USD	1	-25700	-26475	814	1c69c1a8-08fc-7782-8faf-9b0fb9d8abe3	8492	9804	119c5962-fd65-40de-9749-dd3bb647c287
4677	CREDIT	Donation from Cameron - fees and global development	4350	USD	2017-01-04 12:33:36.359-08	2017-01-04 12:33:37.475-08	259	3	\N	\N	\N	\N	\N	\N	\N	USD	1	4350	4350	\N	643a5905-7bea-414f-ffc7-b84e1a507efa	9804	9804	0abba1b5-d685-4a7e-869b-f716167df1dc
498	DEBIT	Conference Grant	-50000	USD	2016-05-04 14:14:39.136-07	2017-11-02 14:23:29.088-07	13	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-50000	-50000	145	e2a6e961-7814-7251-65ac-bcc067f96d81	9804	9804	31ddedc8-c59a-4e11-8197-158d7ac6559e
250	DEBIT	WwConnect Planning Meeting	-2519	USD	2016-03-10 16:00:00-08	2016-06-14 11:14:21.794-07	14	31	26	\N	\N	\N	\N	\N	\N	USD	1	-2519	-2519	60	6f5b0b4b-4ad5-6e8b-8ed7-5e8591e1ddd1	7538	9804	ff0b9f18-a901-4526-820c-4306ce47fc83
7080	DEBIT	Wearable Clothing Workshop	-33412	USD	2017-03-14 11:00:11.436-07	2017-03-14 11:00:11.448-07	48	142	2149	\N	\N	\N	\N	\N	999	USD	1	-33412	-34411	815	0098622b-5c8d-e95c-c171-c25625fa3395	8492	9804	31205b84-a852-4e19-8df1-e5c985113b98
7083	DEBIT	Leadership Development	-50616	MXN	2017-03-14 11:17:51.969-07	2017-11-02 14:23:33.284-07	282	3	\N	\N	\N	\N	\N	\N	0	USD	0.0509949999999999987	-2581	-50616	887	874de65f-ddc4-0456-0a78-3f57b4222593	9804	9804	23156bc6-0b06-493e-b438-0f605da2f17e
7087	DEBIT	Leadership Development	-14915	MXN	2017-03-14 11:18:46.358-07	2017-11-02 14:23:33.245-07	511	3	\N	\N	\N	\N	\N	\N	0	USD	0.0509949999999999987	-761	-14915	886	6d502a60-68b2-05a6-9001-1f4ce83e9418	9804	9804	e66f1d5d-3e27-43fe-8e95-b22781a06906
9746	CREDIT	\N	1200	USD	2017-05-04 11:58:24.9-07	2017-05-04 11:58:24.9-07	430	3	\N	\N	\N	2713	0	0	0	USD	1	1200	1200	\N	c22df393-0b26-d5ce-99d7-c750608a226c	9804	9804	faa2ae0b-e025-432f-8ca0-69de8ffd90c6
9747	DEBIT	Google i/o travel stipend for Yelyzaveta (plus $12 transfer fees)	-101200	USD	2017-05-04 12:06:09.002-07	2017-11-02 14:23:34.751-07	430	3	\N	\N	\N	\N	\N	\N	0	USD	1	-101200	-101200	1099	8ade16b4-b5bd-2eaf-ed02-f11d00d2c8f7	9804	9804	9fee3069-a80c-43d2-a721-a230fcd39865
7114	DEBIT	Plaques for IWD awards ceremony​ 	-54783	USD	2017-03-15 06:57:14.454-07	2017-03-15 06:57:14.471-07	12	69	2149	\N	\N	\N	\N	\N	1619	USD	1	-54783	-56402	888	55eaccbc-fb04-5797-3882-1504f7652b77	5147	9804	a698983f-4b86-4be0-8956-1bfafb19791a
8175	CREDIT	Travel Stipend for CONNECT	50000	USD	2017-04-03 13:24:58.616-07	2017-04-03 13:24:58.879-07	511	3	\N	2017-04-02 17:00:00-07	\N	\N	\N	\N	\N	USD	1	50000	\N	\N	48992add-c138-ceb2-3090-043857b309fb	9804	9804	84b5a75b-50cd-4ad4-82cc-23dfa7475fdf
10555	DEBIT	Tech Summit Lunch	-1785	USD	2017-05-30 09:53:39.172-07	2017-05-30 09:53:39.172-07	59	171	\N	\N	\N	\N	\N	\N	0	USD	1	-1785	-1785	1070	ec907396-7c94-fe7d-1fca-437bbf1bb602	6057	9804	3c9eb6a2-aab5-4d20-98f7-94501686bb7f
10556	DEBIT	Snacks for Unity 101 workshop.	-3405	USD	2017-05-30 09:54:00.817-07	2017-05-30 09:54:00.817-07	59	171	\N	\N	\N	\N	\N	\N	0	USD	1	-3405	-3405	966	f309d748-551a-58f1-6558-a241a934d63a	6057	9804	33e3545f-3100-4f99-923f-66c5b7a88fd4
10561	DEBIT	Transportation - Connect 2017	-6513	USD	2017-05-30 10:04:18.186-07	2017-05-30 10:04:18.186-07	59	171	\N	\N	\N	\N	\N	\N	0	USD	1	-6513	-6513	1093	30395ca6-ecb4-f2b9-b3db-7bf312865074	6057	9804	d875f7c5-cabf-4fdd-ab2f-3b98eece213c
10562	DEBIT	Transportation - Connect 2017	-1950	USD	2017-05-30 10:12:53.68-07	2017-05-30 10:12:53.68-07	59	171	\N	\N	\N	\N	\N	\N	0	USD	1	-1950	-1950	1092	4c327f3c-c4a0-6dbe-b7d0-8cadb5657d3b	6057	9804	f7cef189-26a5-4884-8280-394d8fcdcf86
10564	DEBIT	Intro to Docker workshop food for attendees	-19017	USD	2017-05-30 11:07:58.617-07	2017-05-30 11:07:58.617-07	14	32	\N	\N	\N	\N	\N	\N	0	USD	1	-19017	-19017	1143	5ba18f64-b9c7-8ce9-bcb4-faa38bcbfba6	6353	9804	266461c4-8ca6-479d-9161-b8e71d5dc952
8237	DEBIT	Meetup Fees	-6000	USD	2017-04-05 07:19:21.293-07	2017-11-02 14:23:33.82-07	295	3	\N	\N	\N	\N	\N	\N	0	USD	1	-6000	-6000	988	21aadc74-9f2b-9783-1bf2-474ec973f1f5	9804	9804	90883cf6-19ef-47c3-9fe2-ed314816fdb6
4369	DEBIT	Meetup Fees	-6000	USD	2016-12-27 08:31:58.557-08	2017-11-02 14:23:32.015-07	15	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	636	c69b128e-8912-608d-29b9-4ce2f5788384	9804	9804	c1842db9-a3d8-402b-9a61-837a6051306d
3840	DEBIT	October Hack Night Drinks/Food.	-1100	USD	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	273	1325	\N	\N	\N	\N	\N	\N	\N	USD	1	-1100	-1106	485	cab47984-1b87-3022-6b3e-cacfa780f9b4	3210	9804	29498103-a676-457d-85ea-a9da3fcc2fdc
3839	DEBIT	Food for October Hack Night.	-7700	USD	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	273	1325	\N	\N	\N	\N	\N	\N	\N	USD	1	-7700	-7773	484	ae71fb4e-a991-ee69-5d54-5d31281ea10d	3210	9804	be38e94a-77f5-4309-8259-547e841a8a55
4141	DEBIT	Leadership - Planning for 2017 - Dinner	-9240	USD	2016-12-19 10:45:09.113-08	2016-12-19 10:45:09.64-08	48	142	1191	\N	\N	\N	\N	\N	\N	USD	1	-9240	-9240	602	e873a985-16d4-e88c-404a-2c659fdc8f5c	8492	9804	80949f54-da5a-4541-8774-17cdf92c0c28
8305	CREDIT	\N	20000	USD	2017-04-07 05:25:51.09-07	2017-04-07 05:25:51.09-07	516	3	\N	\N	\N	2393	0	0	0	USD	1	20000	20000	\N	3b7d17fb-0774-be55-fb4a-d13c020c4396	9804	9804	c5c3d3fc-30f0-4583-a415-5f867241f433
4190	DEBIT	Meetup Fees	-6000	USD	2016-12-21 10:53:46.984-08	2017-11-02 14:23:31.361-07	2	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	607	148e2d41-560a-4d19-89c9-55a5d1e1661b	9804	9804	27257c8a-4573-4a22-bf4a-3a230046c6c9
4191	DEBIT	Meetup Fees	-6000	USD	2016-12-21 10:54:30.839-08	2017-11-02 14:23:31.392-07	3	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	608	fde65054-4fc2-cc39-de9e-58a5a00c4a24	9804	9804	c6bec5a9-6752-484c-9f2f-16fdecdf3d15
8308	CREDIT	VMWare foundation Donation - global development (Ramya V., Swathi U. and Anonymous) 	24750	USD	2017-04-07 09:43:42.261-07	2017-04-07 09:43:42.673-07	262	3	\N	\N	\N	\N	\N	\N	\N	USD	1	24750	\N	\N	0a2b3e21-a703-55d1-5a75-955b82731e5b	9804	9804	ad05635b-ce5b-48a8-9135-9665d1a0cb93
1954	DEBIT	Event food	-2911	USD	2016-09-15 17:09:43.149-07	2016-09-15 17:09:43.531-07	59	171	573	\N	\N	\N	\N	\N	\N	USD	1	-2911	-2911	345	396a1c7d-b2d8-c38b-c96f-7d3e1ad42f28	6057	9804	15b0f174-ad64-4619-9ef5-46aa8610a99b
8756	CREDIT	AJUG - Global and fees	26250	USD	2017-04-20 14:39:17.741-07	2017-04-20 14:39:18.323-07	12	3	\N	\N	\N	\N	\N	\N	\N	USD	1	26250	26250	\N	a158911e-0190-5864-77eb-49333405606f	9804	9804	e3eed9cb-5aad-4ef0-a9d5-6d25df7c656d
329	DEBIT	Meetup Donation Transaction Fee	-163	USD	2016-04-12 11:52:16.188-07	2017-11-02 14:23:27.974-07	4	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-163	-163	81	b5e7e714-9683-439c-bb83-cfde22ae736b	9804	9804	67512174-5a8f-49a5-82b2-de5995912ee0
3284	DEBIT	Food (ATXDivHack)	-339421	USD	2016-11-21 07:23:08.279-08	2016-11-21 07:23:08.279-08	2	28	\N	\N	\N	\N	\N	\N	\N	USD	1	-339421	-339421	467	0dcc2859-f65e-efc4-297e-6135f7a19528	6280	9804	7759b4db-5397-4528-aa68-b29d1dd52574
3836	DEBIT	Food/Drinks for Leadership Team Meeting - Gen, Claire, Halima - Sept 2016	-6000	GBP	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	278	1333	\N	\N	\N	\N	\N	\N	\N	USD	1.26089999999999991	-7565	-6000	506	8fb31c8d-d301-db6d-8deb-00dbab40187e	8487	9804	e5026a45-fafe-4451-ae8d-39cf945b641c
4381	DEBIT	Meetup Fees	-6000	USD	2016-12-27 08:59:33.873-08	2017-11-02 14:23:32.189-07	276	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	642	f90c12ba-ef5b-6188-7626-359a8f9698f6	9804	9804	14a979fd-c7b8-4484-92e5-2e42d0d2040e
2428	CREDIT	Donation from Shugo	450	USD	2016-10-11 21:30:15.825-07	2016-10-11 21:30:15.896-07	295	3	\N	\N	\N	\N	\N	\N	\N	USD	1	450	450	\N	8b8bc1de-43b0-ff94-6905-e0035beb9347	9804	9804	2a853798-9fbd-4ce4-9721-9dddd6c58a69
377	DEBIT	WePay fee	-125	USD	2016-04-17 15:19:12.094-07	2017-11-02 14:23:28.127-07	13	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-125	-125	95	4ddf51d8-7c2b-e195-7ff2-5cfc0efbdfa2	9804	9804	c5a7aec7-8d73-456c-aede-6a330f4ff6a5
249	DEBIT	WwConnect planning meeting	-4656	USD	2016-03-10 16:00:00-08	2016-06-14 11:14:21.794-07	14	31	26	\N	\N	\N	\N	\N	\N	USD	1	-4656	-4656	59	fc78046e-6878-1de2-2216-5d235073f827	7538	9804	d08dad3e-5a82-4fc6-bbc5-86c3ea05b533
9848	CREDIT	\N	16563	EUR	2017-05-08 08:30:18.585-07	2017-05-08 08:30:18.585-07	301	3	\N	\N	\N	2741	0	0	0	USD	1.09380000000000011	18117	16563	\N	79c66262-8d55-471e-3aa8-b33352050849	9804	9804	1a8af39d-ea9f-4f91-a9fd-99416a61bd9a
7374	CREDIT	Leadership Development: Google I/O grant for Luisa M.	100000	USD	2017-03-22 10:56:10.528-07	2017-03-22 10:56:10.804-07	3	3	\N	\N	\N	\N	\N	\N	\N	USD	1	\N	100000	\N	9323b3c0-b0d1-363f-9055-69d297f82c87	9804	9804	dbac8ccd-80e5-435a-9d0e-544bb1b638ca
8421	DEBIT	Event supplies	-1527	USD	2017-04-11 12:13:28.544-07	2017-04-11 12:13:28.599-07	59	171	2321	\N	\N	\N	\N	\N	74	USD	1	-1527	-1601	1002	01bc21f0-40b3-4be3-a188-63b50cc463ac	6057	9804	81e4e9a4-3e17-49c6-ae98-e37b23e607cf
8422	DEBIT	Hackathon 2017 planning meeting	-2891	USD	2017-04-11 12:15:09.813-07	2017-04-11 12:15:09.826-07	59	171	2321	\N	\N	\N	\N	\N	114	USD	1	-2891	-3005	1001	dab3f57b-3475-d0da-600b-ea62f17155ab	6057	9804	d9675048-7bc8-47bf-ac75-49c163c3e37c
5750	CREDIT	Donations - Fees 	17328	USD	2017-02-06 12:06:15.502-08	2017-02-06 12:06:15.622-08	2	3	\N	2017-02-05 16:00:00-08	\N	\N	\N	\N	\N	USD	1	17328	173	\N	7d0bcf3d-eed9-8964-ad4e-9c1c247b469b	9804	9804	de7bf611-526b-4ccb-8950-0c96390b755d
5751	CREDIT	Taipei Donation - fees and global development	800	USD	2017-02-06 12:11:26.406-08	2017-02-06 12:11:26.522-08	241	3	\N	\N	\N	\N	\N	\N	\N	USD	1	800	8	\N	f59433da-2078-b95e-f984-672067612e95	9804	9804	b26d45f7-1a64-46ff-9b2d-871b6a853bf0
5277	CREDIT	Global Network Development	500000	USD	2017-01-25 10:27:46.907-08	2017-01-25 10:27:47.421-08	51	3	\N	\N	\N	\N	\N	\N	\N	USD	1	500000	500000	\N	b9c8c150-7625-417c-940f-daf13c8180a7	9804	9804	60da65f3-dfbd-4fb9-bf0e-b15a131542f8
5754	CREDIT	Donation - fees	800	USD	2017-02-06 14:10:44.604-08	2017-02-06 14:10:44.763-08	270	3	\N	\N	\N	\N	\N	\N	\N	USD	1	800	8	\N	7a406482-8a4c-0fc1-22c1-46e83b119c9a	9804	9804	8a5c0a09-4f08-4071-a176-956e4f250dcd
5755	CREDIT	Gitlab - transaction and global development	41400	USD	2017-02-06 14:12:42.534-08	2017-02-06 14:12:42.684-08	48	3	\N	2017-02-05 16:00:00-08	\N	\N	\N	\N	\N	USD	1	41400	414	\N	7890c09f-a2ea-37c1-bf32-d128fd9f29ce	9804	9804	cc615af4-195e-4686-b896-a464e99e2726
5763	CREDIT	Donations via meetup - fees/global development	2000	USD	2017-02-06 14:56:24.306-08	2017-02-06 14:56:24.52-08	272	3	\N	\N	\N	\N	\N	\N	\N	USD	1	2000	20	\N	61066f0a-61a6-30da-9ff5-c8c03b7fa267	9804	9804	968fdea4-880a-4ccb-acf2-2bb7480a0631
5764	CREDIT	Donations via meetup - fees	1200	USD	2017-02-06 14:58:38.922-08	2017-02-06 14:58:39.29-08	13	3	\N	\N	\N	\N	\N	\N	\N	USD	1	1200	12	\N	8ca21f2e-7341-fea1-4b2f-2ee2ece7ce48	9804	9804	5cd67441-8bad-45ab-b7e5-0669b7174e31
5781	DEBIT	Last minute (less than 7 day advance purchase) airline price purchase from SFO to JFK. Emailed Joey to alert of higher fare. 	-59040	USD	2017-02-07 10:32:48.784-08	2017-02-07 10:32:49.072-08	14	31	1718	\N	\N	\N	\N	\N	\N	USD	1	-59040	-59040	776	27edc4b8-391b-8e53-34fb-f565622ebee4	7538	9804	d71bd4e7-6584-48f0-9bf6-91cbe89b16f1
5785	DEBIT	Event supplies for Leads	-2439	USD	2017-02-07 10:38:14.3-08	2017-02-07 10:38:15.58-08	59	171	1718	\N	\N	\N	\N	\N	\N	USD	1	-2439	-2439	737	c96984f0-5dbd-bd55-d406-c58fe9c7aa57	6057	9804	2af1c922-54c1-4e7e-8cbc-afd5196ee171
5786	DEBIT	Printing WWCODE pamphlets for Camas STEM Fair for middle-school girls (organized by OHSU).	-4431	USD	2017-02-07 10:40:27.475-08	2017-02-07 10:40:27.96-08	59	171	1718	\N	\N	\N	\N	\N	\N	USD	1	-4431	-4431	736	e2ceb6ce-4555-a251-95d9-171567c977a8	6057	9804	07626c4a-905f-4be1-8cc6-36afe3cf40e2
5787	DEBIT	Food for 2017 Planning Meeting w/ leadership team (Jan. 22)	-9050	USD	2017-02-07 10:40:49.494-08	2017-02-07 10:40:49.852-08	59	171	1718	\N	\N	\N	\N	\N	\N	USD	1	-9050	-9050	790	88254f41-5b26-3fb8-9be6-72ec0d03a452	6057	9804	3549917f-8d33-4c46-8e76-da0f77d64475
5948	CREDIT	Macy's donation - fees and global development	435000	USD	2017-02-13 16:21:10.361-08	2017-02-13 16:21:10.558-08	12	3	\N	\N	\N	\N	\N	\N	\N	USD	1	435000	435000	\N	32838e95-6e63-940b-bea4-fffb9435eaaa	9804	9804	29484a9e-1074-49a0-bf87-503f4d0392be
6199	DEBIT	Domain name for hackathon and study night projects	-1798	USD	2017-02-20 12:53:02.864-08	2017-02-20 12:53:02.879-08	59	171	1893	\N	\N	\N	\N	\N	\N	USD	1	-1798	-1798	497	f1c7fa04-11b6-2359-8f55-9cd86dfc5c11	6057	9804	f3d5860a-39b0-4bf3-9f5a-28c8993ef1fb
6270	DEBIT	Travel to attend internal leads meeting to finalize plans for upcoming 2017 events	-6100	USD	2017-02-22 07:27:02.607-08	2017-02-22 07:27:02.62-08	14	31	1893	\N	\N	\N	\N	\N	\N	USD	1	-6100	-6100	774	7ca42525-d315-0a9f-79fd-95e70f2c8506	7538	9804	b2716362-882a-48b4-b895-3141c53dbcbb
9385	CREDIT	\N	154800	USD	2017-05-01 11:02:20.511-07	2017-05-01 11:02:20.511-07	13	3	\N	\N	\N	2649	0	0	0	USD	1	154800	154800	\N	73ebf6eb-582f-d62a-dc6d-229f1d0758f2	9804	9804	414c1700-b25a-43b9-9fd8-d6f8be70cdac
6271	DEBIT	Lunch w Saranya during leads meeting. I lost the paper copy of the receipt so including the credit card statement 	-5458	USD	2017-02-22 07:27:45.429-08	2017-02-22 07:27:45.466-08	14	31	1893	\N	\N	\N	\N	\N	\N	USD	1	-5458	-5458	775	f1f26043-d907-489b-8273-ba479684304a	7538	9804	8b1aede8-3aed-40e2-8832-883b86d68eb2
7517	DEBIT	Travel Stipend for Google I/O, now that I have secured my I/O Ticket via Google - see enclosed I/O Ticket Receipt)	-85000	GBP	2017-03-27 09:01:27.19-07	2017-03-27 09:01:27.295-07	278	1333	2265	\N	\N	\N	\N	\N	3760	USD	1.26029999999999998	-107125	-88760	926	8d767aab-e455-3feb-0c3e-6b96677bea1f	8487	9804	21b29da9-ef62-4985-9832-fad6f59e826e
7518	CREDIT	\N	50000	USD	2017-03-27 10:10:04.622-07	2017-03-27 10:10:04.622-07	12	3	\N	\N	\N	2151	0	0	0	USD	1	50000	50000	\N	61dbca7e-afff-5a29-105a-8fea76df24e5	9804	9804	d5aaf185-93c5-4b8a-bd3d-9fb012f5c0a1
7523	CREDIT	\N	20000	USD	2017-03-27 10:45:17.58-07	2017-03-27 10:45:17.58-07	59	3	\N	\N	\N	2152	0	0	0	USD	1	20000	20000	\N	9353d990-e21a-aea6-32b9-7a4f97654801	9804	9804	11b64e28-d3db-4492-abff-a8162002bc3a
7554	CREDIT	International Women's Day Celebrations - Global	51750	USD	2017-03-28 11:27:16.525-07	2017-03-28 11:27:16.748-07	12	3	\N	\N	\N	\N	\N	\N	\N	USD	1	51750	51750	\N	4f9a756e-d2b6-fd1d-78e6-df170ffe4c3f	9804	9804	12044649-3588-46c7-b2bc-378054ccc450
7556	CREDIT	International Women's Day Atlanta	10350	USD	2017-03-28 11:28:28.77-07	2017-03-28 11:28:28.938-07	51	3	\N	\N	\N	\N	\N	\N	\N	USD	1	10350	\N	\N	2cb25656-0d0b-dc7f-df41-52f1bd07330d	9804	9804	ab835b28-9137-4233-9195-0a012c70521d
8601	DEBIT	Atlanta IWD Event	-235699	USD	2017-04-17 12:17:23.032-07	2017-11-02 14:23:34.015-07	12	3	\N	\N	\N	\N	\N	\N	0	USD	1	-235699	-235699	998	05dfc9dd-d166-eb3d-5570-bd9fabae1228	9804	9804	665f4356-58c1-40a8-ac00-615c59281e96
8605	CREDIT	\N	4000	GBP	2017-04-17 12:31:52.919-07	2017-04-17 12:31:52.919-07	267	3	\N	\N	\N	2470	0	0	0	USD	1.25409999999999999	5016	4000	\N	67f93c92-b34b-dc23-3719-24e283361c8d	9804	9804	b982c6d8-092b-4917-bfde-146585db9fb4
8606	CREDIT	\N	9000	USD	2017-04-17 12:41:07.659-07	2017-04-17 12:41:07.659-07	277	3	\N	\N	\N	2471	0	0	0	USD	1	9000	9000	\N	337d9d08-98b9-1abd-c2c4-531dc155d8cf	9804	9804	92b0de2b-e739-493c-b1a5-57672bbde809
8609	CREDIT	\N	5000	USD	2017-04-17 13:41:53.602-07	2017-04-17 13:41:53.602-07	517	3	\N	\N	\N	2473	0	0	0	USD	1	5000	5000	\N	de97c4f7-a93d-ea68-b720-fe4d83011b66	9804	9804	1f495604-2667-48fc-a72a-ff75580329f8
8611	CREDIT	\N	85000	GBP	2017-04-17 14:05:15.067-07	2017-04-17 14:05:15.067-07	278	3	\N	\N	\N	2474	0	0	0	USD	1.25409999999999999	106599	85000	\N	c6579d48-143b-43b6-f487-1f191e2f262b	9804	9804	77da8889-8ecf-4d34-823b-87a77fb87933
8612	CREDIT	\N	4250	GBP	2017-04-17 14:06:54.803-07	2017-04-17 14:06:54.803-07	278	3	\N	\N	\N	2475	0	0	0	USD	1.25409999999999999	5330	4250	\N	d9789591-44e7-c38b-0bf8-0b3d113546b5	9804	9804	083a9810-e5fe-47d4-b65a-8ff91bba7614
8614	DEBIT	WWCode CONNECT Conference Travel Stipend	-85000	GBP	2017-04-17 14:18:35.523-07	2017-04-17 14:18:35.581-07	278	1333	2602	\N	\N	\N	\N	\N	3760	USD	1.25409999999999999	-106598	-88760	1016	36f186ff-4027-51fb-9bf4-9d131a8a888e	8487	9804	a4cf60a3-9be2-4083-bddc-c9045c62e22d
8615	CREDIT	\N	100000	USD	2017-04-17 15:09:42.57-07	2017-04-17 15:09:42.57-07	270	3	\N	\N	\N	2477	0	0	0	USD	1	100000	100000	\N	bb762193-160c-c10d-129b-016829f07602	9804	9804	2bf9f763-8aa4-4855-aeee-489390450662
8621	CREDIT	\N	2200	MXN	2017-04-17 15:35:55.014-07	2017-04-17 15:35:55.014-07	511	3	\N	\N	\N	2489	0	0	0	USD	0.0537790000000000004	118	2200	\N	284e5f5b-5958-9756-84af-1356367b892b	9804	9804	442abfc4-287e-43fd-b194-7b8a4d2a8a9e
8620	CREDIT	\N	18800	MXN	2017-04-17 15:35:06.093-07	2017-04-17 15:35:06.093-07	511	3	\N	\N	\N	2488	0	0	0	USD	0.0537790000000000004	1011	18800	\N	82aa03cb-5e4a-7465-3c5e-c6d070bebed0	9804	9804	4c0e1ea3-d5bc-46e3-a7c7-f2241b2a6bfd
8624	CREDIT	\N	100000	USD	2017-04-17 15:40:40.357-07	2017-04-17 15:40:40.357-07	430	3	\N	\N	\N	2490	0	0	0	USD	1	100000	100000	\N	a77fe56d-3e90-fbd9-05b6-2dfff786a153	9804	9804	4e632e20-8673-47a4-9c2f-cf291b47974c
8664	CREDIT	\N	3562	GBP	2017-04-18 12:41:30.286-07	2017-04-18 12:41:30.286-07	278	3	\N	\N	\N	2503	0	0	0	USD	1.26600000000000001	4509	3562	\N	1fe0c229-ce3c-08a4-3939-12b277cc4bb6	9804	9804	6fef9bd5-9fac-4ffc-ab42-21bdaa6cef7a
8672	CREDIT	\N	1480	USD	2017-04-18 17:20:11.527-07	2017-04-18 17:20:11.527-07	12	3	\N	\N	\N	2506	0	0	0	USD	1	1480	1480	\N	71aa9e1f-5483-3504-159e-9b33a46a53ed	9804	9804	263615a0-838b-4219-95c1-c12a0086e2ea
7667	CREDIT	\N	39800	GBP	2017-03-31 11:01:48.418-07	2017-03-31 11:01:48.418-07	278	3	\N	\N	\N	2209	0	0	0	USD	1.24960000000000004	49734	39800	\N	fda3ece6-3b09-d58f-288a-dbe0fb8c6748	9804	9804	8260403f-b1fc-4906-8a2b-ad128e8332f5
2425	DEBIT	Fedex 	-3418	USD	2016-10-11 17:43:40.215-07	2016-10-11 17:43:40.344-07	48	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-3418	-3418	\N	c7f1f216-1a34-3e8c-9aba-2ea618ba668b	51	9804	8852f828-2b58-4a5f-9c55-faaa64ce045d
3529	DEBIT	Regional Leadership Director Training	-13031	USD	2016-11-29 14:35:21.354-08	2016-11-29 14:35:21.522-08	47	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-13031	-13031	\N	3685d270-d8b7-593a-7bec-28011b8fdf62	51	9804	3bcc6779-997e-436f-95b8-6655fbb6c49a
7683	CREDIT	\N	100000	USD	2017-03-31 15:32:34.123-07	2017-03-31 15:32:34.123-07	286	3	\N	\N	\N	2212	0	0	0	USD	1	100000	100000	\N	38e1c9b9-ab98-4f01-3093-7eb1760fa0a7	9804	9804	b2fbdbf6-9051-4a97-9ca1-6ef24c403f87
7684	DEBIT	Travel stipend to attend the Google I/O 2017 Conference.	-100000	USD	2017-03-31 15:33:59.707-07	2017-03-31 15:33:59.731-07	286	1344	2321	\N	\N	\N	\N	\N	7430	USD	1	-100000	-107430	962	43255f86-597c-d628-d039-8a48cd15c803	6285	9804	ac6e60f4-0659-4d9b-b0b6-ae62ee0e9060
7686	CREDIT	\N	20000	USD	2017-03-31 15:50:23.915-07	2017-03-31 15:50:23.915-07	286	3	\N	2017-06-14 17:00:00-07	\N	2214	0	0	0	USD	1	20000	20000	\N	e0ede949-bf2d-e523-91ff-8bea4a323670	9804	9804	512de6bc-7ed9-4eab-a59b-4455f5640973
7687	CREDIT	\N	7500	USD	2017-03-31 15:52:45.079-07	2017-03-31 15:52:45.079-07	286	3	\N	\N	\N	2215	0	0	0	USD	1	7500	7500	\N	f69d4f6b-43e1-fb77-dc50-5683978e7b2e	9804	9804	36e29422-6beb-4b56-ade6-13a3b66434fb
7688	CREDIT	\N	50000	CAD	2017-03-31 16:37:30.819-07	2017-03-31 16:37:30.819-07	291	3	\N	\N	\N	2217	0	0	0	USD	0.749460000000000015	37473	50000	\N	c1dd5258-5b6b-6689-ff5d-de098c8c29e7	9804	9804	37123e44-489e-48cf-ad29-8b7e2a2e1b81
8705	CREDIT	\N	1480	USD	2017-04-19 11:18:19.043-07	2017-04-19 11:18:19.043-07	2	3	\N	\N	\N	2519	0	0	0	USD	1	1480	1480	\N	111fe90b-1a8f-813d-63d5-e92d900eee5c	9804	9804	b5b65a5a-03d4-49c2-aec2-cfb583664040
8706	CREDIT	\N	40000	USD	2017-04-19 11:26:01.228-07	2017-04-19 11:26:01.228-07	3	3	\N	\N	\N	2520	0	0	0	USD	1	40000	40000	\N	a22103fb-c04c-76c2-545d-f1f63e736d22	9804	9804	46f2b577-c604-4913-8473-1b911cddbee5
8707	CREDIT	\N	1190	USD	2017-04-19 11:26:58.997-07	2017-04-19 11:26:58.997-07	3	3	\N	\N	\N	2521	0	0	0	USD	1	1190	1190	\N	d67c5eb0-6615-c1b7-fd3f-76c5c5ebff91	9804	9804	651dd261-31f8-4840-858e-4efb4e610d3a
8708	CREDIT	\N	610	USD	2017-04-19 11:35:03.04-07	2017-04-19 11:35:03.04-07	59	3	\N	\N	\N	2522	0	0	0	USD	1	610	610	\N	5dac7e36-409a-f04e-2c48-ea90bda51651	9804	9804	37ced041-5af0-4986-83f5-57681190ca77
9621	CREDIT	\N	2930	USD	2017-05-01 17:33:45.73-07	2017-05-01 17:33:45.73-07	3	3	\N	\N	\N	2662	0	0	0	USD	1	2930	2930	\N	ec80ebc8-cf88-6720-4751-190626184e8b	9804	9804	7247e699-4812-4675-b388-c3f3ad673989
10118	DEBIT	Regional Leadership Event: Barcelona	-19398	EUR	2017-05-16 14:49:07.885-07	2017-05-16 14:49:07.885-07	301	1378	\N	\N	\N	\N	\N	\N	0	USD	1.10590000000000011	-21452	-19398	1122	e6b2fc88-e748-8799-70fd-37bb4abf56ac	5394	9804	edd7b65e-f298-4134-9d5f-eaf7bd8288c8
10119	DEBIT	Deposit- We Rise Conference Hosting Location	-500000	USD	2017-05-16 14:51:10.574-07	2017-05-16 14:51:10.574-07	12	3206	\N	\N	\N	\N	\N	\N	0	USD	1	-500000	-500000	1123	a2365d00-8394-f2a9-5dc2-8f6939bb9db0	5903	9804	3dd99fdf-2011-400b-8a2d-84de4a24ade2
538	DEBIT	Conference Grant - Sarah Olson	-110000	USD	2016-05-10 12:19:21.785-07	2017-11-02 14:23:29.134-07	48	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-110000	-110000	156	8491c315-05fb-7a08-d5a1-ed859fd09727	9804	9804	bd13559c-cb32-489a-8b2f-8c2471b6a2ba
2398	CREDIT	Network Development	20000	USD	2016-10-11 09:02:18.108-07	2016-10-11 09:02:19.138-07	195	3	\N	\N	\N	\N	\N	\N	\N	USD	1	20000	20000	\N	f88be3b9-e189-06ae-9fde-a0e965974a80	9804	9804	64e3b9df-9d70-4b80-9210-fe3c15571d50
376	DEBIT	Global Development	-250	USD	2016-04-17 15:19:12.094-07	2017-11-02 14:23:28.156-07	48	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-250	-250	96	8bf2c1f1-9bff-fbe3-4150-bda2564d33df	9804	9804	f55aa05d-9367-4ec7-8b1a-710ded7db244
671	DEBIT	A Small Orange	-12700	USD	2016-02-01 16:00:00-08	2017-11-02 14:23:29.464-07	48	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-12700	-12700	194	37b98eed-62a1-5858-56a7-bd9fee1e33ed	9804	9804	e1d44fbc-fe70-4cc2-a5ff-0be33ba1b6c3
656	DEBIT	Conference Grant	-100000	USD	2016-05-24 12:42:50.307-07	2017-11-02 14:23:29.319-07	3	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-100000	-100000	189	ac1c7423-6e35-9ae3-caa7-be423116d817	9804	9804	a5cee1d2-88c8-43ec-a911-41fb2cdbedc4
10125	DEBIT	Farewell lunch for Clarissa + Welcome lunch for Pranoti 	-11500	USD	2017-05-16 14:55:26.725-07	2017-05-16 14:55:26.725-07	14	32	\N	\N	\N	\N	\N	\N	0	USD	1	-11500	-11500	1119	e75f8139-bd05-e1a9-43ed-d3d82416aef0	6353	9804	417bc899-95a0-4d01-983d-ab6710926639
673	CREDIT	WOMEN TECHMAKER WWCODE PARTNERSHIP GRANT	50000	USD	2016-05-26 13:48:43.015-07	2016-05-26 13:48:43.336-07	59	3	\N	\N	\N	\N	\N	\N	\N	USD	1	50000	50000	\N	1a9543bc-fc8d-6e92-abb7-125cbb9960e9	9804	9804	c8d52424-2880-4d27-90b6-9e733382220d
10131	DEBIT	Leadership meeting	-2989	USD	2017-05-16 14:59:48.206-07	2017-05-16 14:59:48.206-07	48	142	\N	\N	\N	\N	\N	\N	0	USD	1	-2989	-2989	1086	235d0363-4843-522e-dbf0-667e45a56ad2	8492	9804	0e2d6413-9f0d-405b-b7d9-4a135809fea1
10132	DEBIT	Snacks and batteries for our robots	-1554	USD	2017-05-16 15:00:04.449-07	2017-05-16 15:00:04.449-07	48	142	\N	\N	\N	\N	\N	\N	0	USD	1	-1554	-1554	1084	af66c331-7f77-85c8-e29f-61baa7c11a47	8492	9804	8b196e29-6388-4436-aadc-dcef49e5c6e6
10134	DEBIT	Business cards and stickers	-11948	USD	2017-05-16 15:00:30.412-07	2017-05-16 15:00:30.412-07	48	142	\N	\N	\N	\N	\N	\N	0	USD	1	-11948	-11948	1007	e13a452e-249c-7be4-ae9c-bfebd109a464	8492	9804	f942dcc5-12c0-491e-8075-28b130b4c150
2303	CREDIT	Network development (stickers)	58590	USD	2016-10-06 09:08:20.916-07	2016-10-06 09:08:21.09-07	3	3	\N	\N	\N	\N	\N	\N	\N	USD	1	58590	58590	\N	02aef8d3-a721-2e02-ad70-3123c665a911	9804	9804	b79911c4-0ba9-435c-be06-f482d9ff97eb
2810	DEBIT	500 gift cards, 19.62 printed awards	-51962	USD	2016-10-31 14:09:11.281-07	2016-10-31 14:09:11.484-07	300	1371	1042	\N	\N	\N	\N	\N	\N	USD	1	-51962	-51962	416	09467490-643f-690a-3539-4bbfacebec29	1060	9804	f9059ee0-4489-4286-9b1d-de158d80fbf4
5019	CREDIT	WWCode t-shirt sales	1229	USD	2017-01-17 19:23:59.112-08	2017-01-17 19:23:59.247-08	48	3	\N	\N	\N	\N	\N	\N	\N	USD	1	1229	1229	\N	522bb021-c107-51ac-3e19-b61419de0492	9804	9804	f1af1807-f06c-4bcb-9c82-1eb4ff80e353
5020	CREDIT	WWCode t-shirt sales	982	USD	2017-01-17 19:24:31.362-08	2017-01-17 19:24:31.504-08	13	3	\N	\N	\N	\N	\N	\N	\N	USD	1	982	982	\N	6aa8ef75-7e62-7629-9fec-763bf805b82f	9804	9804	22990f82-2bf0-4690-b1fd-ab6eb8f0c55c
1402	DEBIT	Monthly core team lunch with Sandra Saranya Sara CiCi Tori (5 members) ; on boarding new core member Tori!	-10294	USD	2016-08-02 06:38:05.215-07	2016-08-02 06:38:05.831-07	14	31	320	\N	\N	\N	\N	\N	\N	USD	1	-10294	-10294	255	c5049702-102a-7066-3b21-49a8e518cc2c	7538	9804	a1fa5dc3-b615-44a2-b7cc-77cf03622783
3613	DEBIT	Leadership Development - Conference Travel Stipend Google I/O	-130000	USD	2016-11-30 13:06:48.939-08	2016-11-30 13:06:49.116-08	241	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-130000	-130000	\N	592284af-1295-6351-6f21-ffd5e4d34ef6	51	9804	6efd098e-4e95-463d-8676-76c44018d44d
3619	DEBIT	Banner	-2000	USD	2016-11-30 13:19:46.014-08	2016-11-30 13:19:46.128-08	269	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-2000	-2000	\N	9ba6bc67-9ea6-bf28-332c-7a6e4fe1c7de	51	9804	852df736-3772-477e-a892-6ad8e7a01a9c
3622	DEBIT	Regional Leadership Director Meeting 	-7500	USD	2016-11-30 13:20:31.263-08	2016-11-30 13:20:31.464-08	269	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-7500	-7500	\N	a8cd6655-04f7-5cd5-7f88-511b827dbbcf	51	9804	f0a30018-d95b-40cd-8ca8-006496180b47
253	DEBIT	WwConnect Conference	-658	USD	2016-03-19 17:00:00-07	2016-06-14 11:14:21.806-07	14	31	26	\N	\N	\N	\N	\N	\N	USD	1	-658	-658	63	7f3460dc-2e4b-61b0-5141-2e5149daf53b	7538	9804	7c7fbab5-d084-4c2a-a63b-24d2c20b73c7
5275	DEBIT	travel to NY for bell ringing at NYSE	-30000	USD	2017-01-25 10:20:51.642-08	2017-01-25 10:20:54.592-08	12	70	1476	\N	\N	\N	\N	\N	\N	USD	1	-30000	-30000	743	749253b6-c634-765c-23f8-231af0059cc0	1115	9804	63685cbe-4dfc-4fd1-937b-a86cce0c795e
1407	DEBIT	Leadership team dinner - Sondry interview	-11757	USD	2016-08-02 06:44:04.201-07	2016-08-02 06:44:04.214-07	14	31	320	\N	\N	\N	\N	\N	\N	USD	1	-11757	-11757	307	9bf0a71c-0a9d-ee4f-33c2-5979fa578461	7538	9804	5fbe93dc-f03c-4c68-8188-1bed005f4630
499	CREDIT	Women Techmaker/WWCode partnership grant	50000	USD	2016-05-04 14:17:27.653-07	2016-05-04 14:17:27.886-07	13	3	\N	\N	\N	\N	\N	\N	\N	USD	1	50000	50000	\N	d5b43aed-5f65-0ec8-b6a5-8781a541d844	9804	9804	52a0a353-7904-4fd6-a6ef-d178bfa9777d
7082	DEBIT	Supplies for Agile workshop (2/26)	-5798	USD	2017-03-14 11:16:43.183-07	2017-03-14 11:16:43.22-07	59	171	2149	\N	\N	\N	\N	\N	198	USD	1	-5798	-5996	858	24800c3d-6b8b-6619-b465-294cce56b2ec	6057	9804	d34224fd-5113-4542-bd46-ba08d7518b86
282	CREDIT	Recurring subscription	500	MXN	2016-04-02 13:10:38.206-07	2016-04-02 13:10:38.242-07	10	80	42	2016-04-07 13:10:38.206-07	\N	68	\N	\N	\N	USD	0.0574469999999999981	29	\N	\N	2692fff8-fdcf-7340-8618-06773bbbf990	4356	9804	11aa0e6b-3c4d-4cfc-8a1a-81e3773bd326
3331	DEBIT	Thank you bags (16) for hackathon speakers and judges, and for pre-hackathon events volunteers and sponsors.  Each bag contains a WWCode Portland coffee mug, a chocolate bar, ghirardellis squares, and a thank you card.	-8181	USD	2016-11-22 13:54:33.366-08	2016-11-22 13:54:33.644-08	59	171	1191	\N	\N	\N	\N	\N	\N	USD	1	-8181	-8181	499	6703c651-858e-5328-9987-e20745e87d7a	6057	9804	985e769c-c47f-4d8c-8c0a-396ec4fe81ce
472	CREDIT	Recurring subscription	100	USD	2016-05-02 11:15:35.25-07	2016-05-02 11:15:35.307-07	13	30	44	\N	\N	70	5	10	33	USD	1	100	52	\N	4da6ab71-05ae-0c9c-3b22-f11ac174d97c	2385	9804	be0079f3-508c-4ad8-9a62-d35e477c4c8c
300	DEBIT	Reimburse Caterina for program materials	-3798	USD	2016-04-05 12:44:01.338-07	2017-11-02 14:23:27.881-07	59	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-3798	-3798	76	1ea9938f-2a45-947b-b944-a0dbfc8324e0	9804	9804	2cbe1287-503b-415f-962e-ae15e70d2306
4392	DEBIT	Meetup Fees	-6000	AUD	2016-12-27 09:54:00.843-08	2017-11-02 14:23:32.342-07	281	3	\N	\N	\N	\N	\N	\N	\N	USD	0.718759999999999954	-4313	-6000	649	9a68e29d-5528-0505-b9da-54d45e548d3a	9804	9804	49102370-ae6b-45ba-87a3-4ed9f466887e
2426	DEBIT	Engineering (Web) - A Small Orange	-12700	USD	2016-10-11 17:44:30.933-07	2016-10-11 17:44:31.081-07	48	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-12700	-12700	\N	ed661c9d-2fe8-441b-b365-f36a30d1205e	51	9804	b2a5d553-cdb6-4945-83ec-288c855c11cb
821	DEBIT	6/2/16 Fireside Chat at Orange Coworking	-20000	USD	2016-06-04 14:37:03.991-07	2016-06-14 11:14:22.145-07	2	28	320	\N	\N	\N	\N	\N	\N	USD	1	-20000	-20000	211	020ee7f7-3c47-2314-7ef0-6c2f804c4ad7	6280	9804	a0bd0b6f-226d-4bf7-99f4-e271f45d8b7b
305	DEBIT	test 	-100	USD	2016-04-06 10:39:39.954-07	2016-04-06 10:46:25.532-07	14	3	\N	2016-04-06 10:46:25.531-07	\N	\N	\N	\N	\N	USD	1	-100	\N	\N	1aa14565-5960-0fe9-22d1-6922279ca429	51	9804	aa43ab39-a08c-423d-9d4d-0e7e53101e79
4256	DEBIT	Meetup Fees	-6000	USD	2016-12-23 09:00:25.987-08	2017-11-02 14:23:31.543-07	263	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	617	83a28002-804e-4aec-cf08-f104c7f05fa7	9804	9804	d4c90ff0-7374-49b5-94af-5c5dc1379a74
4373	DEBIT	Meetup Fees	-6000	USD	2016-12-27 08:41:27.235-08	2017-11-02 14:23:32.074-07	272	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	638	4e521add-8e8a-5865-880a-131aebd819ff	9804	9804	798c90af-aea4-4b1d-b7d1-dcd201ceb5b7
469	CREDIT	Recurring subscription	100	USD	2016-05-02 10:46:41.832-07	2016-05-02 10:46:41.894-07	14	30	41	\N	\N	67	5	10	33	USD	1	100	52	\N	aaadfe59-b9a4-dab9-6843-c192d0af102f	2385	9804	09d5730c-e46e-47fa-8e86-fe9973986ba8
127	CREDIT	Recurring subscription	500	MXN	2016-03-02 10:06:23.743-08	2016-04-16 13:40:58.731-07	10	80	42	\N	\N	68	2	3	16	USD	17.8570999999999991	28	125	\N	f2249b6b-ed8c-be0a-10ea-725c231d166c	4356	9804	899a0b98-eb60-436c-9131-1dbaf00b2e22
128	CREDIT	Recurring subscription	100	USD	2016-03-02 10:19:33.362-08	2016-04-16 13:40:58.737-07	13	30	43	\N	\N	69	5	10	33	USD	1	100	52	\N	680ae38a-194f-7fa4-42cb-334a482af141	2385	9804	54b851dd-4cb9-4f5e-af1e-58578d4a8508
74	CREDIT	Donation to WWCode Washington DC	100	USD	2016-02-02 09:09:22.069-08	2016-04-16 13:40:58.697-07	13	30	44	\N	\N	70	5	10	33	USD	1	100	52	\N	ed0f8314-1ba7-7746-83a4-d61465d74d3e	2385	9804	0a26630d-6715-4d16-8baf-73eb900eb37a
280	CREDIT	Recurring subscription	100	USD	2016-04-02 12:09:44.502-07	2016-04-16 13:40:58.811-07	14	30	41	\N	\N	67	5	10	33	USD	1	100	52	\N	f0487489-8ec6-4c29-7774-43e9f389809a	2385	9804	71772053-cbe5-46d1-b705-e4f572c349a6
985	CREDIT	Donation to WWCode San Francisco	100	USD	2016-06-21 09:05:01.251-07	2016-06-21 09:05:01.296-07	4	642	431	\N	\N	360	5	10	32	USD	1	100	53	\N	f8757a8c-8686-bf7c-eb6e-412e7f26b028	3533	9804	02f03817-6d93-483a-9615-a66c1a7ac6ea
5022	CREDIT	WWCode t-shirt sales	1106	USD	2017-01-17 19:29:09.407-08	2017-01-17 19:29:09.561-08	14	3	\N	\N	\N	\N	\N	\N	\N	USD	1	1106	1106	\N	bd9480c5-30c9-a269-61d2-c4e1f92ba768	9804	9804	147b6e37-e8b5-4611-bd8d-5fe91b863834
4409	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 11:51:47.92-08	2016-12-27 11:51:48.117-08	14	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	40e36264-56a0-30cb-fad9-48a7428f1263	9804	9804	29a786b5-b34a-4b2d-a4ef-c1f4bc190ca2
675	CREDIT	WOMEN TECHMAKER WWCODE PARTNERSHIP GRANT	34750	USD	2016-05-26 13:50:28.413-07	2016-05-26 13:50:28.721-07	59	3	\N	\N	\N	\N	\N	\N	\N	USD	1	34750	34750	\N	898c6829-f972-6e22-761c-ec6399dd5538	9804	9804	34cc1f46-7142-47c4-97cf-60b298783220
4405	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 11:44:22.123-08	2016-12-27 11:44:22.207-08	287	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	ce08d98b-ca19-a8b6-a563-fb04e5936027	9804	9804	5272a73b-d512-442a-b58f-36a3b95034b7
4397	CREDIT	Global Development for Meetup Fee	5700	EUR	2016-12-27 10:10:14.864-08	2016-12-27 10:10:14.928-08	283	3	\N	\N	\N	\N	\N	\N	\N	USD	1.04449999999999998	5954	5700	\N	33a615fd-c303-ef25-6bfd-72834c5474e1	9804	9804	566db4df-ce7e-4512-b453-e7972fe47b73
5021	CREDIT	WWCode t-shirt sales	3563	USD	2017-01-17 19:28:29.874-08	2017-01-17 19:28:30.096-08	290	3	\N	\N	\N	\N	\N	\N	\N	USD	1	3563	3563	\N	9c1cdb28-3c34-af6e-82a5-f142ca2b3a8a	9804	9804	57e3946d-d0da-45a1-9f93-f715ea1e80ec
614	CREDIT	Women Techmaker WWCode Partnership Grant	70000	USD	2016-05-19 12:17:47.24-07	2016-05-19 12:17:48.401-07	3	3	\N	\N	\N	\N	\N	\N	\N	USD	1	70000	70000	\N	e4303377-c97d-a675-4247-7a7cd34b1698	9804	9804	5fcdb377-1a97-4757-afb4-e39aaf881d27
466	CREDIT	Recurring subscription	100	USD	2016-05-01 22:44:10.046-07	2016-05-01 22:44:10.072-07	13	126	93	\N	\N	95	5	10	33	USD	1	100	52	\N	1018f36c-8484-706b-f9fa-f028a515b4fd	4228	9804	8c4c2a9f-b7da-4495-ac27-529738618373
6930	CREDIT	monthly recurring subscription	100	USD	2017-03-09 10:29:18.778-08	2017-03-09 10:29:18.778-08	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	8d9678ab-999f-b946-5271-0842c4d94fe3	8638	9804	07773aec-ba35-4b4d-84d8-d86b160eb1f5
6944	CREDIT	monthly recurring subscription	1000	USD	2017-03-09 20:43:47.943-08	2017-03-09 20:43:47.943-08	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	7078d83d-aff7-d8b5-807f-fdbd9c349c52	6067	9804	b137a275-67eb-458d-ba2d-d91ebaae8eb2
9042	CREDIT	\N	200	USD	2017-04-30 18:40:30.232-07	2017-04-30 18:40:30.232-07	516	3419	2749	\N	\N	2636	10	20	34	USD	1	200	136	\N	93b59a42-0cee-42ba-47bc-ebd347241dbf	3898	9804	9d22c58f-7e54-459d-9e37-adb0985a4b00
8365	CREDIT	monthly recurring subscription	1000	USD	2017-04-09 21:43:06.965-07	2017-04-09 21:43:06.965-07	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	cd380ed5-e24b-0ac5-a9b7-0c8ca5728587	6067	9804	e5b12b0f-6d3b-44fa-a1c7-eaec1ffd9f1f
3590	CREDIT	\N	20000	USD	2016-11-30 08:11:42.049-08	2016-11-30 08:11:42.049-08	2	1957	1296	\N	\N	1215	1000	2000	470	USD	1	20000	16530	\N	008eea6f-a3b8-2c90-121d-fb998c2120b9	4960	9804	ddc9c873-a11c-451e-9007-bc7c7d2b3064
3886	CREDIT	Recurring subscription	1000	USD	2016-12-09 20:43:00.244-08	2016-12-09 20:43:00.244-08	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	37cf59e3-a368-a272-a598-5203cd7ebc65	6067	9804	8c4b2edf-973b-4c1c-8ba3-80bf0bbc4fac
10626	CREDIT	monthly recurring subscription	200	USD	2017-05-31 20:34:32.114-07	2017-05-31 20:34:32.114-07	516	3419	2749	\N	\N	2636	10	20	34	USD	1	200	136	\N	918758f0-397f-ce21-db49-ec48df9c9cc5	3898	9804	5b0b928b-33fe-40d1-98a8-9b35fd5d274f
4123	CREDIT	\N	2500	USD	2016-12-18 17:41:29.006-08	2016-12-18 17:41:29.006-08	259	2220	1471	\N	\N	1388	125	250	85	USD	1	2500	2040	\N	8205294f-18e0-1599-069a-8aebdf7ba4f7	1831	9804	c5bf663e-ee61-47d1-8908-78f8e44297b0
104	CREDIT	Recurring subscription	500	USD	2016-02-18 17:11:10.784-08	2016-04-16 13:40:58.716-07	10	2	34	\N	\N	65	25	50	45	USD	1	500	380	\N	30f4a3cc-f7ee-dab3-3ec9-870f609b281f	1729	9804	103f6238-9b5a-4d75-9263-52585d5a881b
984	CREDIT	Donation to WWCode Atlanta	100	USD	2016-06-21 09:02:56.072-07	2016-06-21 09:02:56.13-07	12	642	430	\N	\N	359	5	10	32	USD	1	100	53	\N	5994dcab-c18f-af19-d3ec-0b7381886c9a	3533	9804	c218de85-6a0f-4a3e-9dbd-b267dd7bccaf
9898	CREDIT	monthly recurring subscription	1000	USD	2017-05-09 21:43:13.462-07	2017-05-09 21:43:13.462-07	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	4eb963b6-dc72-22db-61a6-5a6fa7186a6c	6067	9804	0397e293-5b3d-424c-949c-17bde903e9c1
4793	CREDIT	Recurring subscription	1000	USD	2017-01-09 20:43:19.956-08	2017-01-09 20:43:19.956-08	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	0c14182e-4a4f-f9b7-18c4-a6f07d0aabb7	6067	9804	77725f1d-b326-485c-a884-0b57353e39cf
3876	CREDIT	Recurring subscription	100	USD	2016-12-09 10:29:17.341-08	2016-12-09 10:29:17.341-08	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	edd8cc90-bfa2-57c5-8b2a-c09834a67cd2	8638	9804	0b41a0f0-18df-4a8d-b7f7-fff1ab504a29
1395	CREDIT	Recurring subscription	1000	USD	2016-08-01 16:35:39.219-07	2016-08-01 16:35:39.244-07	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	279da14b-96f7-5e66-f8f4-8a2b3354ad58	6616	9804	cad70aa6-2f2d-4d0a-95c0-62f75469ca4a
8038	CREDIT	monthly recurring subscription	1000	USD	2017-04-01 16:32:24.254-07	2017-04-01 16:32:24.254-07	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	994a8d20-48f4-5c36-7102-4efaa337ec29	6616	9804	bcc507a4-a078-4dab-85e0-2f5b51517439
2189	CREDIT	Recurring subscription	1000	USD	2016-10-01 16:35:17.911-07	2016-10-01 16:35:17.911-07	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	d61447ec-0468-b8fa-0021-1970b821464b	6616	9804	17b4ad88-d103-4fa9-82cd-f06fd359df4b
5852	CREDIT	monthly recurring subscription	1000	USD	2017-02-09 20:43:49.515-08	2017-02-09 20:43:49.515-08	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	608b66b0-6402-0444-ad7b-e9036876da19	6067	9804	17666b89-5261-47a0-ad1d-452cbd60d18f
2370	CREDIT	Recurring subscription	1000	USD	2016-10-09 21:49:33.558-07	2016-10-09 21:49:33.558-07	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	415a159d-961f-f547-8f05-d2b2ac341ebe	6067	9804	61e6962e-d34b-4501-9cbe-9e440aed292f
3471	CREDIT	\N	4000	USD	2016-11-28 07:33:14.428-08	2016-11-28 07:33:14.428-08	2	1890	1249	\N	\N	1167	200	400	118	USD	1	4000	3282	\N	73fc061d-c1e6-9ebb-0794-ad8b5bef2871	6014	9804	468226f6-c1f4-49cf-95dc-bbb12a1099c2
7913	CREDIT	monthly recurring subscription	2500	USD	2017-04-01 11:31:19.231-07	2017-04-01 11:31:19.231-07	271	2906	1804	\N	\N	1712	125	250	85	USD	1	2500	2040	\N	68466831-ddcc-4156-3f41-916698448672	4881	9804	ca1b1e8b-d8fd-47f0-a2e4-60099198c88a
8427	CREDIT	\N	2500	USD	2017-04-11 19:05:36.032-07	2017-04-11 19:05:36.032-07	13	4173	2546	\N	\N	2430	125	250	85	USD	1	2500	2040	\N	ea5ae2ff-6baf-1477-b3c8-8825a19fcf9b	4475	9804	7cc4e6f9-7975-45d2-b630-bbb224711df3
470	CREDIT	Recurring subscription	100	USD	2016-05-02 11:10:42.774-07	2016-05-02 11:10:42.847-07	13	30	43	\N	\N	69	5	10	33	USD	1	100	52	\N	2c8d029e-330e-b5bd-8680-304429819a7b	2385	9804	dd0095a6-b33e-4207-8226-5accc5c837c0
4655	CREDIT	\N	20000	USD	2017-01-03 12:59:37.749-08	2017-01-03 12:59:37.749-08	2	2416	1553	\N	\N	1466	1000	2000	470	USD	1	20000	16530	\N	6f3c90ce-a72e-c3a7-58f8-d7bfd08e5524	3538	9804	4fc40537-3f6c-4be5-a42c-4db74995f483
986	CREDIT	Donation to WWCode Twin Cities	100	USD	2016-06-21 09:06:05.517-07	2016-06-21 09:06:05.626-07	48	642	432	\N	\N	361	5	10	32	USD	1	100	53	\N	c0b3f3c4-7e3f-14b6-951c-78e15428f604	3533	9804	272bf73e-5bca-457f-b764-c8367bc7c56d
9863	CREDIT	\N	1000	USD	2017-05-08 22:59:15.573-07	2017-05-08 22:59:15.573-07	517	4711	2855	\N	\N	2750	50	100	52	USD	1	1000	798	\N	9d7712ee-dfac-828e-8026-efc59141fb8e	3178	9804	7371127e-9d54-45c2-84a0-d76239d9cbeb
5044	CREDIT	\N	10000	USD	2017-01-18 05:54:50.597-08	2017-01-18 05:54:50.597-08	48	2594	1647	\N	\N	1557	500	1000	250	USD	1	10000	8250	\N	ec7da94c-cee5-3458-f424-2a4777001d8d	3116	9804	ae2db105-8066-4d6b-95f7-e1b47be286b5
10051	CREDIT	\N	20000	USD	2017-05-15 05:07:59.63-07	2017-05-15 05:07:59.63-07	14	4834	2922	\N	\N	2817	1000	2000	470	USD	1	20000	16530	\N	7e4d6989-991d-26e9-f073-f905d1df9928	2984	9804	40aac85d-179e-47c9-bfe4-db132dc1f636
8210	CREDIT	\N	20000	USD	2017-04-04 12:51:04.916-07	2017-04-04 12:51:04.916-07	2	3999	2438	\N	\N	2332	1000	2000	700	USD	1	20000	16300	\N	7ad0a5b6-0a25-61be-15b9-45fa4d66d41a	2977	9804	075ca1d3-ea35-4f37-8e5c-05a89c08d7dc
4899	CREDIT	Recurring subscription	1000	USD	2017-01-14 09:12:01.244-08	2017-01-14 09:12:01.244-08	270	2549	1616	\N	\N	1531	50	100	52	USD	1	1000	798	\N	d5d58d24-b60a-d7e0-2be5-7bfea178baee	7262	9804	052f41f2-972e-4d72-bac4-2781c4909401
11067	CREDIT	monthly recurring subscription	500	USD	2017-06-01 11:15:05.625-07	2017-06-01 11:15:05.625-07	516	4550	2757	\N	\N	2644	25	50	41	USD	1	500	384	\N	a33fe69c-f9b2-1683-a779-74ac47ea3b5a	1788	9804	2681e067-a91d-4b6d-b43e-e576fd8ad2e2
9357	CREDIT	\N	500	USD	2017-05-01 10:13:34.851-07	2017-05-01 10:13:34.851-07	516	4550	2757	\N	\N	2644	25	50	41	USD	1	500	384	\N	b2d825bb-b974-29ed-7c5c-31a34b56fb4f	1788	9804	ab5e9f13-d835-498f-9a96-18c0a7ea08a1
475	CREDIT	Recurring subscription	100	USD	2016-05-02 17:15:49.65-07	2016-05-02 17:15:49.711-07	13	2	46	\N	\N	72	5	10	33	USD	1	100	52	\N	8518938a-52dd-8027-527d-5244e493e0f8	1729	9804	40efe1b2-ea0f-49b9-a048-a8528287a19c
4124	CREDIT	\N	2500	USD	2016-12-18 17:42:01.104-08	2016-12-18 17:42:01.104-08	259	2220	1472	2016-12-27 16:00:00-08	\N	1389	125	250	85	USD	1	2500	2040	\N	0d0a364d-6886-433d-901e-ecbeac82e82c	1831	9804	498efbca-1f14-4151-8e1a-a9eab83a2741
9879	CREDIT	\N	84000	USD	2017-05-09 11:14:23.283-07	2017-05-09 11:14:23.283-07	2	4720	2860	\N	\N	2755	4200	8400	1878	USD	1	84000	69522	\N	922469fe-8503-f03d-5492-f0debe37148f	1586	9804	7cd4a75e-9a6b-464e-aaf8-bc1bb8866c5f
837	CREDIT	Donation to WWCode Austin	150000	USD	2016-06-06 12:04:37.186-07	2016-06-06 12:04:37.308-07	2	551	377	\N	\N	312	7500	15000	4380	USD	1	150000	123120	\N	33c8c79b-bd84-b7cb-0799-d31a2033f887	1442	9804	01b62bf4-03ac-4c1a-a1a5-75a61ba7da11
4779	CREDIT	Recurring subscription	100	USD	2017-01-09 10:28:29.701-08	2017-01-09 10:28:29.701-08	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	701166b8-c807-0d3f-e1fc-09946f8224f8	8638	9804	6320bf14-9cc1-4b35-a5b8-70a19f16a5a7
4957	CREDIT	\N	50000	USD	2017-01-16 10:03:56.108-08	2017-01-16 10:03:56.108-08	48	2561	1622	\N	\N	1537	2500	5000	1130	USD	1	50000	41370	\N	62bb34ca-bf7d-7750-d25f-17998207166b	8146	9804	98c6e92a-f388-4fd1-9673-4c2f3b346695
5838	CREDIT	monthly recurring subscription	100	USD	2017-02-09 10:29:30.017-08	2017-02-09 10:29:30.017-08	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	f951b2cb-2322-bde9-4116-2179b7fec4b1	8638	9804	72a37c1b-ecc4-4ea3-accd-53a5855be9ce
6649	CREDIT	monthly recurring subscription	2500	USD	2017-03-01 10:37:53.591-08	2017-03-01 10:37:53.591-08	271	2906	1804	\N	\N	1712	125	250	85	USD	1	2500	2040	\N	a7d0bcb7-0924-0375-e0e0-aad36829f55e	4881	9804	9ac3a02c-91f3-491b-b910-a59315562f74
3669	CREDIT	Recurring subscription	1000	USD	2016-12-01 15:32:26.764-08	2016-12-01 15:32:26.764-08	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	9f865e82-1249-9783-7110-f0e97644b144	6616	9804	12f055f6-9346-4e70-9026-8e25903ff4a7
5578	CREDIT	monthly recurring subscription	1000	USD	2017-02-01 15:34:44.326-08	2017-02-01 15:34:44.326-08	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	b75e2a34-1f24-1499-2b49-179486822ebd	6616	9804	099ed3f8-8d7b-4dc0-b26d-783443f56f3d
5540	CREDIT	\N	2500	USD	2017-02-01 09:30:48.467-08	2017-02-01 09:30:48.467-08	271	2906	1804	\N	\N	1712	125	250	85	USD	1	2500	2040	\N	905680c7-c921-7d19-04c0-40ba59d0fa91	4881	9804	a4266384-cb0c-44aa-b7df-300e40b4b16f
2360	CREDIT	Recurring subscription	100	USD	2016-10-09 11:36:17.958-07	2016-10-09 11:36:17.958-07	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	783f47b3-27d0-3948-0de3-2963cc12afbb	8638	9804	82980a40-4c6e-4eb6-8711-964b5d2fcc97
1884	CREDIT	Recurring subscription	1000	USD	2016-09-09 20:42:56.392-07	2016-09-09 20:42:56.392-07	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	82802c29-7548-c466-3d3b-a03b66614b2a	6067	9804	9f7d907b-973e-4187-ae12-48eaad0a5165
3056	CREDIT	Recurring subscription	1000	USD	2016-11-09 20:43:57.271-08	2016-11-09 20:43:57.271-08	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	3b132306-16dc-502d-cde9-a0f37a3f0248	6067	9804	d13715c6-fbfe-4dca-8f9c-75f78c6ff03f
2887	CREDIT	Recurring subscription	1000	USD	2016-11-01 16:32:30.439-07	2016-11-01 16:32:30.439-07	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	564f5c00-9dcf-7b36-4337-b92d254bda25	6616	9804	1043a51d-a375-4ad3-9644-12ce4b916b15
1876	CREDIT	Recurring subscription	100	USD	2016-09-09 11:29:12.276-07	2016-09-09 11:29:12.276-07	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	eaa47f20-cfaa-9720-8bbc-67a429ee6cc7	8638	9804	e236a51f-f3dc-4fad-b908-45f0796762d8
2336	CREDIT	\N	2500	USD	2016-10-07 09:49:19.978-07	2016-10-07 09:49:19.978-07	241	1446	884	\N	\N	812	125	250	85	USD	1	2500	2040	\N	24750b18-7d54-c7ea-21cf-066a49b75a6b	5180	9804	7ff49318-abeb-4bb7-80b7-3d5c66d3a9e9
1792	CREDIT	Recurring subscription	1000	USD	2016-09-01 16:32:42.475-07	2016-09-01 16:32:42.475-07	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	569f91fb-33b4-ef34-927d-2c088b7d25f5	6616	9804	5c88aa54-d14f-4ba5-a0b2-6dcd7ca245dd
1174	CREDIT	Recurring subscription	100	USD	2016-07-09 11:31:14.547-07	2016-07-09 11:31:14.585-07	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	9cbbffea-ecbf-4497-dd66-9dd876f7820f	8638	9804	a03b0e11-a1f5-42ab-b685-47950a2e134e
9595	CREDIT	monthly recurring subscription	1000	USD	2017-05-01 16:34:11.708-07	2017-05-01 16:34:11.708-07	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	34df43e1-1963-a816-f3db-91543d0ef79a	6616	9804	0fd68a9a-b82c-427f-89a8-fa63ae82eb7f
9926	CREDIT	\N	1000	CAD	2017-05-10 16:45:46.737-07	2017-05-10 16:45:46.737-07	522	4749	2888	\N	\N	2783	36	71	46	USD	1.39860139860139854	715	786	\N	ae697880-7bf7-1d18-dcba-0e8dc46eb28f	2804	9804	63869fe6-bcd3-4c76-a78c-7e281dbdc301
9408	CREDIT	monthly recurring subscription	2500	USD	2017-05-01 11:32:00.085-07	2017-05-01 11:32:00.085-07	271	2906	1804	\N	\N	1712	125	250	85	USD	1	2500	2040	\N	bbc6086e-f572-a7c0-d900-fb9064b3cc9b	4881	9804	819f157e-4740-481f-bc2c-6c3c9bd06670
4435	CREDIT	Global Development for Meetup Fee	6000	CAD	2016-12-28 08:21:14.024-08	2016-12-28 08:21:10.449-08	291	3	\N	\N	\N	\N	\N	\N	\N	USD	0.736670000000000047	4420	6000	\N	b6e481ed-311f-b747-bcbd-614860a5c6fa	9804	9804	3091a66b-2b8e-473f-9e20-4dc010ae6af7
8398	CREDIT	\N	25000	USD	2017-04-10 18:09:50.621-07	2017-04-10 18:09:50.621-07	13	4153	2535	\N	\N	2421	1250	2500	580	USD	1	25000	20670	\N	f70696d7-b522-6787-c8ea-2ac070e8f29a	7368	9804	1e85738c-7cd8-4e1d-8cc9-17edd427533d
2310	CREDIT	\N	12500	USD	2016-10-06 11:36:38.382-07	2016-10-06 11:36:38.382-07	2	1438	880	\N	\N	808	625	1250	305	USD	1	12500	10320	\N	3cc3ec61-0d37-281d-e32b-5a7c98c9a43a	8045	9804	b33f2768-e994-4bd3-bcfd-1399e72bdd86
3047	CREDIT	Recurring subscription	100	USD	2016-11-09 10:29:23.967-08	2016-11-09 10:29:23.967-08	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	fd2143b8-df06-58d5-d6ec-29e5fe0b22e6	8638	9804	bc82c91c-64f5-4847-8a13-e649612a2519
6931	CREDIT	\N	6000	USD	2017-03-09 10:29:55.496-08	2017-03-09 10:29:55.496-08	259	3442	2104	\N	\N	2003	300	600	162	USD	1	6000	4938	\N	058cf60e-2923-0a0e-403a-b3912941b993	7809	9804	3fd34e33-3c0b-4ccd-bf9a-1f8bf5a5a96a
3518	CREDIT	Global Development	20000	USD	2016-11-29 13:56:45.442-08	2016-11-29 13:56:45.713-08	290	3	\N	\N	\N	\N	\N	\N	\N	USD	1	20000	20000	\N	0d30ba24-5937-b225-84f9-c56d902d6021	9804	9804	3351dbe8-48dc-4c91-a88b-987d5ef82875
1423	CREDIT	Recurring subscription	10000	USD	2016-08-03 10:47:25.319-07	2016-08-03 10:47:25.429-07	4	896	571	\N	\N	498	500	1000	250	USD	1	10000	8250	\N	4b1217d5-d191-fd92-38ea-2b5c6892fe45	8290	9804	4881210e-c123-484a-abf3-48fdde77d5b4
995	CREDIT	Donation to WWCode Austin	75000	USD	2016-06-22 13:09:46.403-07	2016-06-22 13:09:46.432-07	2	646	435	\N	\N	364	3750	7500	2625	USD	1	75000	61125	\N	c3ed9e7e-9655-edc9-9648-66ebafe72c95	7263	9804	611dfe54-3d67-409b-9202-3c79085dca7a
11087	CREDIT	monthly recurring subscription	2500	USD	2017-06-01 11:32:03.707-07	2017-06-01 11:32:03.707-07	271	2906	1804	\N	\N	1712	125	250	85	USD	1	2500	2040	\N	dc3cd763-8ec8-24d1-4e78-dcf3ab0322cb	4881	9804	c0db885e-d984-4929-9ead-cca448997dac
5969	CREDIT	monthly recurring subscription	1000	USD	2017-02-14 10:13:04.109-08	2017-02-14 10:13:04.109-08	270	2549	1616	\N	\N	1531	50	100	52	USD	1	1000	798	\N	a8f77db7-eb0a-11ed-ce65-f98817ea36a8	7262	9804	43bc3b11-2176-446e-8638-271690f2bf0a
10736	CREDIT	monthly recurring subscription	1000	USD	2017-05-31 23:59:32.906-07	2017-05-31 23:59:32.906-07	517	4711	2855	\N	\N	2750	50	100	52	USD	1	1000	798	\N	00b70b15-0e2e-d4ab-60d7-faf6d625fbfe	3178	9804	ebb832f9-add0-419c-94aa-e22fb166d4cf
4367	CREDIT	Global Development for Meetup Fee	6000	INR	2016-12-27 08:24:37.915-08	2016-12-27 08:24:38.038-08	47	3	\N	\N	\N	\N	\N	\N	\N	USD	0.0147019999999999998	88	6000	\N	9cbb7fc2-e1c5-fbda-49e5-cd66b1bf9012	9804	9804	7291f911-8057-4df8-bc6c-e711665c9bda
8617	CREDIT	\N	41000	GBP	2017-04-17 15:31:52.729-07	2017-04-17 15:31:52.729-07	278	3	\N	\N	\N	2486	0	0	0	USD	1.25409999999999999	51418	41000	\N	ff083af3-411d-bfae-c1d7-bd6109a8015e	9804	9804	759757f8-4574-4d09-8276-47f060ce6695
6709	CREDIT	monthly recurring subscription	1000	USD	2017-03-01 15:40:00.024-08	2017-03-01 15:40:00.024-08	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	fcda5d06-0825-987f-a33c-ae3974a15c1b	6616	9804	0c08f94b-0bad-4d4b-839b-b276277770ff
2253	CREDIT	Network Development	10000	USD	2016-10-04 14:44:54.4-07	2016-10-04 14:44:54.58-07	2	3	\N	\N	\N	\N	\N	\N	\N	USD	1	10000	10000	\N	26e04a6d-08cb-9afc-5167-4ea647876efd	9804	9804	76d39ba5-ae94-4603-a77f-02114258dd7d
4284	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 11:48:39.526-08	2016-12-23 11:48:39.685-08	270	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	0f529276-f4a5-aa27-6d09-6e40cb75e2dd	9804	9804	77742cc3-9644-4774-a28f-6e1b801e8d33
2411	CREDIT	Network Development	17750	USD	2016-10-11 12:17:21.991-07	2016-10-11 12:17:22.199-07	279	3	\N	\N	\N	\N	\N	\N	\N	USD	1	17750	17750	\N	aeb4eecf-a99a-2ec0-e1a3-48d46798eba7	9804	9804	779d2d17-5517-4f25-95c7-538e1f80607a
7525	CREDIT	\N	100000	USD	2017-03-27 10:52:38.123-07	2017-03-27 10:52:38.123-07	277	3	\N	\N	\N	2153	0	0	0	USD	1	100000	100000	\N	206bb94f-eaa0-e0c4-d972-0aa2cc40cc4b	9804	9804	78125014-e632-4e9a-a5ef-91c3a070e2c3
2342	CREDIT	Network Development +	50000	USD	2016-10-07 13:24:13.595-07	2016-10-07 13:24:13.706-07	300	3	\N	\N	\N	\N	\N	\N	\N	USD	1	50000	50000	\N	939e874e-3177-07d1-327a-3adb5e4d28cd	9804	9804	78bea586-4401-4d58-a221-fc46e5f8b250
2267	CREDIT	Network Development	15400	USD	2016-10-04 15:39:26.796-07	2016-10-04 15:39:26.9-07	273	3	\N	\N	\N	\N	\N	\N	\N	USD	1	15400	15400	\N	38ac5e4e-5730-df3a-e711-b3a123d0efb3	9804	9804	7909bbc3-01a4-4815-85d9-33ac2d0f9336
2415	CREDIT	Donation Ailia S.	9000	USD	2016-10-11 12:44:42.807-07	2016-10-11 12:44:43.161-07	270	3	\N	\N	\N	\N	\N	\N	\N	USD	1	9000	9000	\N	725f097d-372e-5804-0866-83db8c891ac2	9804	9804	793ec7ea-3e3b-4179-bdcc-896d8e1cf36b
4389	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 09:48:49.207-08	2016-12-27 09:48:49.297-08	280	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	822f0a5a-804b-ce2d-d8b8-bd62f3e40936	9804	9804	7ad2541e-e21a-42b1-b3c8-a9379cff43e3
5533	CREDIT	\N	22500	USD	2017-02-01 07:16:20.999-08	2017-02-01 07:16:20.999-08	48	2898	1801	\N	\N	1709	1125	2250	525	USD	1	22500	18600	\N	86b5a4ff-acd0-9cc4-8fab-f7d3c5e9570c	2232	9804	ddbdaab5-f947-461c-be76-cf577cb39403
2309	CREDIT	Network budget pre Open Collective 	406519	USD	2016-10-06 11:36:30.275-07	2016-10-06 11:36:30.298-07	13	3	\N	\N	\N	\N	\N	\N	\N	USD	1	406519	406519	\N	f444722a-474e-7cde-44f3-0e32d74e8685	9804	9804	7c5f37d1-f42a-4926-a3f5-b521e4d41a67
8673	CREDIT	\N	1400	USD	2017-04-18 17:31:31.942-07	2017-04-18 17:31:31.942-07	195	3	\N	\N	\N	2507	0	0	0	USD	1	1400	1400	\N	4664c758-e484-f96f-8dcb-aa6cf37451e4	9804	9804	7cc01b68-a9d7-45ea-b071-456f2b4665b2
7294	CREDIT	Travel Stipend for Google I/O	100000	USD	2017-03-20 08:17:43.622-07	2017-03-20 08:17:42.994-07	277	3	\N	\N	\N	\N	\N	\N	\N	USD	1	100000	100000	\N	83958858-1f96-c04b-bba6-72de7be4db6b	9804	9804	7d4d4006-a18b-4064-a502-53e3b5aa6f83
857	CREDIT	Recurring subscription	100	USD	2016-06-09 10:28:30.802-07	2016-06-09 10:28:30.841-07	3	8	385	\N	\N	320	5	10	33	USD	1	100	52	\N	c174c524-d0cd-ffdc-1f7b-966122ad49b7	8638	9804	025945cf-0f56-4134-9eab-c39ce14c6af4
306	CREDIT	Leslie Mollner: Thank you very much for all the help I've received from WWCode -TC so far. -Leslie	2250	USD	2016-04-06 11:17:07.204-07	2016-04-16 13:40:58.818-07	48	3	\N	\N	\N	\N	\N	\N	\N	USD	1	2250	2250	\N	4cdeb291-bb49-7a34-5068-1afab2dc52a5	9804	9804	7f2a866e-8ad8-49e5-afec-c0581382829d
277	CREDIT	Recurring subscription	100	USD	2016-04-02 08:43:33.706-07	2016-04-16 13:40:58.808-07	13	126	93	\N	\N	95	5	10	33	USD	1	100	52	\N	6313b75e-e133-cfed-b16f-831429caf77b	4228	9804	f562bf48-bfda-400e-9b7b-4f59a0f01140
726	CREDIT	Recurring subscription	100	USD	2016-06-01 22:48:36.714-07	2016-06-01 22:48:36.745-07	13	126	93	\N	\N	95	5	10	33	USD	1	100	52	\N	0f079c50-f460-4be6-89b7-321e38fbdf29	4228	9804	d8ffbfae-2ce5-40bc-9f8c-9ab4c80b447b
5023	CREDIT	WWCode t-shirt sales	1964	USD	2017-01-17 19:29:40.155-08	2017-01-17 19:29:40.284-08	273	3	\N	\N	\N	\N	\N	\N	\N	USD	1	1964	1964	\N	27a6634f-830c-910e-cf52-ea2fc24fcff5	9804	9804	97a9ec6a-eb37-4e19-a3db-973221d82132
330	CREDIT	Intel Donation	100000	USD	2016-04-12 13:32:35.997-07	2016-04-16 13:40:58.826-07	59	3	\N	\N	\N	\N	\N	\N	\N	USD	1	100000	100000	\N	06668b5d-932e-0834-f873-83c0adf6d6d4	9804	9804	9db41796-18d5-4b96-991f-28797dfb7953
2340	CREDIT	Hackbright support for hackathon	45000	USD	2016-10-07 13:04:15.299-07	2016-10-07 13:04:15.435-07	300	3	\N	\N	\N	\N	\N	\N	\N	USD	1	45000	45000	\N	1907f44a-0c51-d7ab-8492-fbcdf958bd84	9804	9804	9de1a588-b1a0-4b5a-8409-d80f276c2c9b
842	CREDIT	Donation to WWCode Washington DC	100000	USD	2016-06-06 17:53:47.603-07	2016-06-06 17:53:47.649-07	13	555	381	\N	\N	316	5000	10000	2930	USD	1	100000	82070	\N	9f51322a-89c4-1d47-d593-a123cf7c939d	1848	9804	e0adde43-a502-43dc-b07e-ca49eb5f8b50
1080	CREDIT	Recurring subscription	1000	USD	2016-07-01 15:38:37.594-07	2016-07-01 15:38:37.617-07	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	ea916b79-9bc2-5afa-32a6-54c658cd6b46	6616	9804	b369412c-61f5-4fc0-ba2d-0f50c0b609cd
4365	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 08:22:09.234-08	2016-12-27 08:22:09.351-08	13	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	1a8aba35-09bd-dc50-e3ad-6736fe8c77e4	9804	9804	9f5a7639-569d-4a14-a1cf-a639b04123a9
616	CREDIT	Donation to WWCode Austin	50000	USD	2016-05-19 12:24:43.134-07	2016-05-19 12:24:43.182-07	2	392	288	\N	\N	246	2500	5000	1480	USD	1	50000	41020	\N	5becc318-4720-50c2-8b34-9c022d4be328	1568	9804	1d486da0-bc61-4082-96b4-5ef0d814e058
232	DEBIT	Mar 7 Lightning Talks	-15316	USD	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.794-07	2	28	\N	2016-06-14 11:14:22.455-07	\N	\N	\N	\N	\N	USD	1	-15316	-15316	57	023c3fb7-0aa1-8d9e-eb9d-f626c85e3c2a	6280	9804	29cf1729-ffa3-412e-9964-54f1e30cc87e
3540	CREDIT	Donation from PB - fees 	1187	USD	2016-11-29 15:33:50.04-08	2016-11-29 15:33:50.206-08	4	3	\N	\N	\N	\N	\N	\N	\N	USD	1	1187	1187	\N	4f500887-e436-5b9a-46b0-dde79b4fef14	9804	9804	05f143a2-0b8b-4380-87df-151faa2df619
4263	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 09:20:13.429-08	2016-12-23 09:20:13.545-08	259	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	2e2d821b-1c3b-0212-a0f1-e5330c9b7aec	9804	9804	09efe2bf-7e54-43b5-9617-12554d89aebe
2406	CREDIT	Network Development	18200	USD	2016-10-11 10:02:51.621-07	2016-10-11 10:02:51.839-07	291	3	\N	\N	\N	\N	\N	\N	\N	USD	1	18200	18200	\N	e3a092ef-5898-ef78-6e5e-a40b73cea59b	9804	9804	11c8e843-b60c-45fa-831a-e7c5d3dd6b47
3957	CREDIT	Donation via meetup - fees and global development	775	USD	2016-12-13 12:20:15.375-08	2016-12-13 12:20:15.714-08	13	3	\N	\N	\N	\N	\N	\N	\N	USD	1	775	775	\N	0075c8ff-bbb7-47b8-6785-240cfae78c6f	9804	9804	1255631a-a7c6-4b65-935a-4fe55dedd063
3203	CREDIT	$1000 CDK Global event support - transaction and global development	87000	USD	2016-11-17 10:18:40.107-08	2016-11-17 10:18:40.436-08	59	3	\N	\N	\N	\N	\N	\N	\N	USD	1	87000	87000	\N	f6b402be-52b8-620c-b52d-948e96121fba	9804	9804	126b9177-c490-4e4f-bc3c-01e61ac71f77
2419	CREDIT	Network Development	20000	USD	2016-10-11 13:03:19.884-07	2016-10-11 13:03:20.084-07	271	3	\N	\N	\N	\N	\N	\N	\N	USD	1	20000	20000	\N	5a5a461e-aa86-2ea7-8b72-dbddcc2b86eb	9804	9804	12e4cc24-dbb2-4a3b-94c7-c683e662809b
3544	CREDIT	Donation via meetup	775	USD	2016-11-29 15:39:42.382-08	2016-11-29 15:39:42.512-08	13	3	\N	\N	\N	\N	\N	\N	\N	USD	1	775	775	\N	545a9282-6b97-644f-7395-bea743cee222	9804	9804	13ef38a0-04b9-4de0-a0f6-0b946c29d65f
3621	CREDIT	Regional Leadership Director Meeting 	7500	USD	2016-11-30 13:20:12.669-08	2016-11-30 13:20:16.148-08	269	3	\N	\N	\N	\N	\N	\N	\N	USD	1	7500	7500	\N	fe9bcf16-1c8e-d609-e5fa-2a6c7183a3d6	9804	9804	abd8e210-6db8-4a20-914f-46039294a6f5
4282	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 11:40:51.309-08	2016-12-23 11:40:51.479-08	269	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	6b9d8038-5411-72f3-5a8f-ccc580e93cc2	9804	9804	1bda1d50-b739-4117-a7e4-db9b6fa7ddf1
4248	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 08:45:15.022-08	2016-12-23 08:45:15.147-08	261	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	472a0671-eb0e-fb89-d495-990a3861ff9b	9804	9804	1ce1116a-a473-4508-8a2f-d9fb82c9d431
3535	CREDIT	Banner	2000	USD	2016-11-29 15:07:15.153-08	2016-11-29 15:07:15.39-08	289	3	\N	\N	\N	\N	\N	\N	\N	USD	1	2000	2000	\N	db85fa62-e48c-01cd-123a-03395fcdea78	9804	9804	42cea685-f336-43df-8790-a8d75340cd2e
2332	CREDIT	Course Hero Hackathon Support	315000	USD	2016-10-07 07:39:15.069-07	2016-10-07 07:39:15.23-07	300	3	\N	\N	\N	\N	\N	\N	\N	USD	1	315000	315000	\N	ac065ce4-bba1-ee6c-1b1e-a8b4b7e957b4	9804	9804	47f66a9b-d350-4494-8206-fa7f406ee2de
3620	CREDIT	Regional Leadership Director Meeting 	7500	USD	2016-11-30 13:20:06.733-08	2016-11-30 13:20:15.577-08	269	3	\N	\N	\N	\N	\N	\N	\N	USD	1	7500	7500	\N	59d73674-907e-b0c8-4182-4b5995f3a5b5	9804	9804	56d4ef7a-be51-4543-8fb3-2e9279e6eaf7
412	CREDIT	Andrea S	1500	USD	2016-04-27 13:05:44.711-07	2016-04-27 13:05:44.974-07	48	3	\N	\N	\N	\N	\N	\N	\N	USD	1	1500	1500	\N	8e22c7ee-b718-9aa8-e880-e8e9d6bba433	9804	9804	639d9863-f512-4311-9e58-d1d0bece5154
2265	CREDIT	Donation Hannah B.	9000	USD	2016-10-04 15:35:46.967-07	2016-10-04 15:35:47.153-07	273	3	\N	\N	\N	\N	\N	\N	\N	USD	1	9000	9000	\N	fa40ef5a-6b8e-497f-1030-f933fdf62ef5	9804	9804	64988f79-0952-48b0-8e1a-ed2a97ef06a5
7526	CREDIT	\N	100000	USD	2017-03-27 10:53:48.539-07	2017-03-27 10:53:48.539-07	277	3	\N	\N	\N	2154	0	0	0	USD	1	100000	100000	\N	531a995b-029e-c5c4-fc2d-ac90ea0a82e7	9804	9804	65770092-ea0a-42b3-a300-318229b890b2
3525	CREDIT	Network Development	44426	MXN	2016-11-29 14:29:22.958-08	2016-11-29 14:29:23.167-08	282	3	\N	\N	\N	5902	\N	\N	\N	USD	0.05627367011	2500	44426	\N	a0fe1a82-5ff2-9995-9b8a-0836e88f3694	9804	9804	65a57c27-c59a-401c-94aa-c845d3bd7d7f
4702	CREDIT	Donation - fees + global development	1187	USD	2017-01-05 06:58:39.771-08	2017-01-05 06:58:42.205-08	13	3	\N	\N	\N	\N	\N	\N	\N	USD	1	1187	1187	\N	2394595c-6e7d-0994-bff3-921a09589ca8	9804	9804	65f4170e-d466-4d0e-9d34-a29a820bc165
3519	CREDIT	Network Development - 10k member bonus	100000	USD	2016-11-29 13:58:23.625-08	2016-11-29 13:58:23.799-08	4	3	\N	\N	\N	\N	\N	\N	\N	USD	1	100000	100000	\N	88c08f13-b24b-07a7-1119-d47f5945beee	9804	9804	6bbd39f3-7891-4062-83d6-34445a9e8b74
3534	CREDIT	Stephen	450	USD	2016-11-29 14:55:31.534-08	2016-11-29 14:55:31.727-08	273	3	\N	\N	\N	\N	\N	\N	\N	USD	1	450	450	\N	3e60f495-f6c8-147b-51c1-ee0ab511fa9d	9804	9804	6cc2c2f8-1642-4595-b1e1-3fb3eeb6238d
2270	CREDIT	Network Development	13286	USD	2016-10-04 15:57:17.136-07	2016-10-04 15:57:17.293-07	260	3	\N	\N	\N	\N	\N	\N	\N	USD	1	13286	13286	\N	ab885e14-06f2-a229-4ff5-b8ec7827497d	9804	9804	721daf48-7ca3-4e04-b3a9-014616fdc521
4407	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 11:48:41.246-08	2016-12-27 11:48:41.318-08	288	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	5cc9514c-472d-def0-433c-60aa88d48f22	9804	9804	72343886-f6b6-4e91-9b79-044f1d08288d
2312	CREDIT	Network Development (100%)	10000	USD	2016-10-06 11:42:47.682-07	2016-10-06 11:42:47.71-07	13	3	\N	\N	\N	\N	\N	\N	\N	USD	1	10000	10000	\N	215237bc-aed4-373b-2c04-870c6ae8ec76	9804	9804	727221d2-b179-437e-9c4e-077f7e760c17
3542	CREDIT	Donation from Margaret - fees	2012	USD	2016-11-29 15:37:14.82-08	2016-11-29 15:37:15.082-08	272	3	\N	\N	\N	\N	\N	\N	\N	USD	1	2012	2012	\N	a81aee78-8b1e-da64-f9a3-dab02c90fe99	9804	9804	81f45379-1ae0-4c88-80e4-e4fbbd46e428
2255	CREDIT	Network Development	10000	USD	2016-10-04 14:50:13.582-07	2016-10-04 14:50:13.787-07	15	3	\N	\N	\N	\N	\N	\N	\N	USD	1	10000	10000	\N	f23c214e-31bd-b2f0-ad7f-03bf6cfe555a	9804	9804	8293a892-46cc-48e4-9bac-c89930aecd66
4246	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 08:32:00.456-08	2016-12-23 08:32:00.622-08	260	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	e5711271-54a8-bba2-efa5-44bf6c1d97e3	9804	9804	83e9b97f-1e65-4304-8b63-2d90aae40f42
4391	CREDIT	Global Development for Meetup Fee	6000	AUD	2016-12-27 09:52:16.09-08	2016-12-27 09:52:16.167-08	281	3	\N	\N	\N	\N	\N	\N	\N	USD	0.718759999999999954	4313	6000	\N	de8f1f5b-054a-4903-f5e5-31953c4b4c65	9804	9804	8d0d66cd-059f-4fc1-b4ac-6c059b46515c
4439	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-28 08:27:36.9-08	2016-12-28 08:27:33.309-08	292	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	b17ddb3d-3646-abbe-6c92-d6bef820ed6b	9804	9804	94a34e44-7605-4b5b-8fbd-e02039ed8058
4360	CREDIT	Global Development for Meetup Fee	6000	MXN	2016-12-27 08:10:30.416-08	2016-12-27 08:10:30.529-08	299	3	\N	\N	\N	\N	\N	\N	\N	USD	0.0485049999999999995	291	6000	\N	f3575f18-1209-a624-2992-1a6547e7ccaa	9804	9804	94f40b58-e3bc-4a22-b595-4af152b044dd
858	CREDIT	Dalia donated to WWCode SF	1500	USD	2016-06-09 11:40:21.124-07	2016-06-09 11:40:21.833-07	4	3	\N	\N	\N	\N	\N	\N	\N	USD	1	1500	1500	\N	5aa49dc4-4458-6b11-899d-fe5964c38bb7	9804	9804	955c332a-0cd1-4185-8db9-ac94716a5558
2418	CREDIT	Network support - Regional Leadership (thanks VMWare)	370000	USD	2016-10-11 12:51:45.723-07	2016-10-11 12:51:45.897-07	262	3	\N	\N	\N	\N	\N	\N	\N	USD	1	370000	370000	\N	11bda4ff-aafb-147f-5adf-e7c38cd5bdcc	9804	9804	970dd5ae-27bb-4564-a51f-eef5e9adc34a
2412	CREDIT	Network development - thanks Atlassian	50000	USD	2016-10-11 12:30:14.934-07	2016-10-11 12:30:15.155-07	297	3	\N	\N	\N	\N	\N	\N	\N	USD	1	50000	50000	\N	b7c1acec-9ad6-5fb3-3798-550b6b522845	9804	9804	a7e82f25-7450-4aee-a7bc-c83c58338a42
4443	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-28 08:31:33.43-08	2016-12-28 08:31:29.837-08	294	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	25be1840-6705-1a55-b056-56f46806aa5f	9804	9804	a8eb0c35-4e89-470d-a36b-e00492199943
4402	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 10:37:31.611-08	2016-12-27 10:37:31.721-08	59	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	6f5be4c4-ed7b-9fe6-4790-259328e0c2f3	9804	9804	abd4c468-9556-42c8-a267-73377a1b3498
2311	CREDIT	Donations via Meetup	3937	USD	2016-10-06 11:41:35.464-07	2016-10-06 11:41:35.487-07	13	3	\N	\N	\N	\N	\N	\N	\N	USD	1	3937	3937	\N	a7a3aa2f-4825-e0f6-575a-ee08094fab64	9804	9804	ae91ebd0-c421-4713-b68a-b0073f6f25a7
3531	CREDIT	Regional Leadership Director Training	631	USD	2016-11-29 14:38:57.006-08	2016-11-29 14:38:57.13-08	47	3	\N	\N	\N	\N	\N	\N	\N	USD	1	631	631	\N	82416660-5cb0-2449-dbef-ccb30405ec8a	9804	9804	aeaece62-7c7d-4d05-9e0c-557039aa0efd
4437	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-28 08:24:49.292-08	2016-12-28 08:24:45.838-08	48	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	17cfc358-a429-911e-7126-88bcdc89d84f	9804	9804	af8d60a3-a963-4008-a78c-3a2d41cd1247
2404	CREDIT	Network Development	10000	USD	2016-10-11 09:52:38.277-07	2016-10-11 09:52:38.455-07	59	3	\N	\N	\N	\N	\N	\N	\N	USD	1	10000	10000	\N	caa45744-8b55-0d09-d0fa-b6888f62a108	9804	9804	af9927cf-f025-4460-b7cf-87b85e3451d5
2268	CREDIT	Network budget pre Open Collective	6264	USD	2016-10-04 15:51:25.324-07	2016-10-04 15:51:26.129-07	260	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6264	6264	\N	1afa4a6c-8399-285e-c972-7547e48e4959	9804	9804	afd2dde1-9235-459d-91d8-3fdc2534ba97
2405	CREDIT	Donation Scott Z. in honor of his sister	1800	USD	2016-10-11 10:01:23.313-07	2016-10-11 10:01:23.731-07	291	3	\N	\N	\N	\N	\N	\N	\N	USD	1	1800	1800	\N	df0914d1-5d62-1c72-7c6f-24385d1a6920	9804	9804	b0290c43-e2fa-44cd-9660-cae7f400725d
4270	CREDIT	Global Development for Meetup Fee	4900	GBP	2016-12-23 09:55:42.091-08	2016-12-23 09:55:42.249-08	267	3	\N	\N	\N	\N	\N	\N	\N	USD	1.2249000000000001	6002	4900	\N	834acd80-9ae1-f1d2-d443-372b84389648	9804	9804	bacf63c4-c810-4f36-911b-de1bb249b722
568	CREDIT	Women Techmaker/WWCode Partnership Grant	50000	USD	2016-05-16 13:01:14.238-07	2016-05-16 13:01:14.49-07	10	3	\N	\N	\N	\N	\N	\N	\N	USD	1	50000	50000	\N	6ee5e749-7cff-3291-9a0f-e576b56259cc	9804	9804	bd6043a1-c131-49ff-9af0-21d8a6d3469b
2329	CREDIT	Google I/O stipend	39585	GBP	2016-10-07 06:35:45.945-07	2016-10-07 06:35:46.151-07	278	3	\N	\N	\N	\N	\N	\N	\N	USD	1.23290000000000011	48804	39585	\N	e1f48c4e-a001-1959-66e3-948c0eede904	9804	9804	c1432bf4-cc8e-41f3-a823-2c0f2858f6fc
5026	CREDIT	WWCode t-shirt sales	4742	USD	2017-01-17 19:31:50.631-08	2017-01-17 19:31:50.774-08	2	3	\N	\N	\N	\N	\N	\N	\N	USD	1	4742	4742	\N	6083260c-a39a-9ddc-1413-7984378635e2	9804	9804	c1765c11-5ae4-4f78-bd4f-06e6a05bd248
2410	CREDIT	From Lucas in honor of Rachel M. She learned Python and HTML/CSS	2250	USD	2016-10-11 12:13:57.013-07	2016-10-11 12:13:57.265-07	279	3	\N	\N	\N	\N	\N	\N	\N	USD	1	2250	2250	\N	a8aedbb8-8e98-e3a8-936e-b62acd3c73c0	9804	9804	c1d79f81-28a1-42d7-8c46-45cd9868ea17
3514	CREDIT	CONNECT 2016	4536939	USD	2016-11-29 13:44:20.041-08	2016-11-29 13:44:20.185-08	14	3	\N	\N	\N	\N	\N	\N	\N	USD	1	4536939	4536939	\N	dfb93e0d-378a-e37e-bc26-375597421449	9804	9804	c29a69ce-93d3-4d28-9f25-fec62f501724
3520	CREDIT	Global Development	15600	USD	2016-11-29 14:08:18.065-08	2016-11-29 14:08:18.213-08	241	3	\N	\N	\N	\N	\N	\N	\N	USD	1	15600	15600	\N	6e228499-6d02-c60f-9338-b2b159db50cb	9804	9804	c491d8a9-38c2-4a07-8abc-8a210a250c56
537	CREDIT	WOMEN TECHMAKER/WWCODE PARTNERSHIP GRANT	110000	USD	2016-05-10 14:15:06.327-07	2016-05-10 14:15:06.677-07	48	3	\N	\N	\N	\N	\N	\N	\N	USD	1	110000	110000	\N	5ad8c046-ab86-82f7-b669-fbc1532ff6c3	9804	9804	c74c00a8-eb9a-41c2-833b-c85a3df9e356
3208	CREDIT	WWCode DC t-shirts sales	9524	USD	2016-11-17 10:37:58.038-08	2016-11-17 10:37:58.232-08	13	3	\N	\N	\N	\N	\N	\N	\N	USD	1	9524	9524	\N	d430da90-0c4a-6893-4516-570b8571bfff	9804	9804	c8b35a4a-e93a-42f4-99cc-17659c748192
2306	CREDIT	I am an active member and WWC has taken my career in tech to the next level. All the support and lessons from the WWC DC chapter are instrumental in me remaining in this field.	2250	USD	2016-10-06 10:23:39.409-07	2016-10-06 10:23:39.459-07	13	3	\N	\N	\N	\N	\N	\N	\N	USD	1	2250	2250	\N	d46feb59-e343-23ac-f739-95ee72cc97c9	9804	9804	cdae8625-b8d8-4474-a1aa-67e424c99ba5
3547	CREDIT	Network Development	20000	USD	2016-11-29 16:23:24.87-08	2016-11-29 16:23:24.511-08	285	3	\N	\N	\N	\N	\N	\N	\N	USD	1	20000	20000	\N	93c19b85-fcef-0ab0-ac79-3d729769e4f4	9804	9804	d0e0b600-d25b-40b2-bb10-c004c2aeb0fd
4393	CREDIT	Global Development for Meetup Fee	6000	MXN	2016-12-27 09:56:03.911-08	2016-12-27 09:56:03.985-08	282	3	\N	\N	\N	\N	\N	\N	\N	USD	0.0485049999999999995	291	6000	\N	2e61e66d-401c-173d-71b1-9fb833d124f1	9804	9804	d1ef9616-2de1-4f1c-b90a-100155491fa4
7511	CREDIT	Leadership Development: Google I/O travel grant for Gen A. 	85000	USD	2017-03-27 06:25:14.008-07	2017-03-27 06:25:14.169-07	278	3	\N	\N	\N	\N	\N	\N	\N	USD	1	85000	85000	\N	b49ce1db-9a96-699a-12ee-ea0d89c6706b	9804	9804	d568912d-05e4-4ec3-93a4-2643344fd055
8671	CREDIT	\N	1198	USD	2017-04-18 17:19:14.321-07	2017-04-18 17:19:14.321-07	12	3	\N	\N	\N	2505	0	0	0	USD	1	1198	1198	\N	98f796ea-2c43-223f-05a4-305c201e16c3	9804	9804	e064a148-f0d5-4c3a-8d8b-b21837527a80
4267	CREDIT	Global Development for Meetup Fee	6000	AUD	2016-12-23 09:41:14.029-08	2016-12-23 09:41:14.193-08	266	3	\N	\N	\N	\N	\N	\N	\N	USD	0.717149999999999954	4303	6000	\N	51b66f71-427a-4dae-a4f1-dadc231a2900	9804	9804	e1ec5d2e-bfd9-489f-894f-21000689d544
4441	CREDIT	Global Development for Meetup Fee	6000	CAD	2016-12-28 08:29:31.983-08	2016-12-28 08:29:28.409-08	293	3	\N	\N	\N	\N	\N	\N	\N	USD	0.736670000000000047	4420	6000	\N	3b53d08e-f6cd-154f-6dcd-63cf34ae4290	9804	9804	e215e6ef-ab49-488d-a321-ac7aa7114fcf
3205	CREDIT	$5000 Intel Hackathon support - global development	450000	USD	2016-11-17 10:23:08.268-08	2016-11-17 10:23:08.461-08	59	3	\N	\N	\N	\N	\N	\N	\N	USD	1	450000	450000	\N	14815883-b5f4-88f0-872a-d47063c09a87	9804	9804	e2866f2b-b8fc-4d8b-8766-d241f0a918f6
334	CREDIT	From Deepa	1500	USD	2016-04-12 14:19:00.212-07	2016-04-12 14:19:00.529-07	4	3	\N	2016-04-14 14:19:00.529-07	\N	\N	\N	\N	\N	USD	1	1500	\N	\N	c27acb4b-1dba-7974-a60d-9953c6673b54	9804	9804	e3b447d4-551e-4f32-9fe1-e5c9d54e91f4
5024	CREDIT	WWCode t-shirt sales	982	USD	2017-01-17 19:30:10.748-08	2017-01-17 19:30:10.906-08	259	3	\N	\N	\N	\N	\N	\N	\N	USD	1	982	982	\N	95bad0da-dc23-636c-b45f-6746d3258f22	9804	9804	e4e9f09c-f92b-491e-9eb6-fd4d1e827a89
2422	CREDIT	Donation from Marie W.	900	USD	2016-10-11 17:26:47.2-07	2016-10-11 17:26:47.59-07	284	3	\N	\N	\N	\N	\N	\N	\N	USD	1	900	900	\N	374e1873-8bc0-397e-693c-ec2069095601	9804	9804	e6e5d6ea-ec69-4bf7-8def-8837010d2317
2263	CREDIT	Network Development	17375	USD	2016-10-04 15:15:45.133-07	2016-10-04 15:15:45.269-07	272	3	\N	\N	\N	\N	\N	\N	\N	USD	1	17375	17375	\N	31dd1e7d-be80-c908-f250-36f5f28e6962	9804	9804	e7876338-ae92-47ff-ab0a-7be605d16b43
8608	CREDIT	\N	100000	USD	2017-04-17 13:41:37.627-07	2017-04-17 13:41:37.627-07	517	3	\N	\N	\N	2472	0	0	0	USD	1	100000	100000	\N	0d9d2beb-889d-7dd6-6741-640ae495b3b4	9804	9804	e9a08405-09f6-4d66-9979-ac0008414ec5
2414	CREDIT	Network Development	17500	USD	2016-10-11 12:35:59.115-07	2016-10-11 12:35:59.305-07	301	3	\N	\N	\N	\N	\N	\N	\N	USD	1	17500	17500	\N	ca65a873-2593-1850-eaae-c5c5bb5e9bfc	9804	9804	eacd7b56-9597-470e-939d-6ed93cfafb28
5025	CREDIT	WWCode t-shirt sales	2778	USD	2017-01-17 19:30:54.132-08	2017-01-17 19:30:54.465-08	3	3	\N	\N	\N	\N	\N	\N	\N	USD	1	2778	2778	\N	81c19ea8-5dfd-c7e3-517f-bad97fabe227	9804	9804	f0f3f96d-b6e9-48d7-9a21-ee06981807e3
4250	CREDIT	Global Development for Meetup Fees	6000	USD	2016-12-23 08:50:35.869-08	2016-12-23 08:50:36.131-08	12	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	c88c1e46-bb19-10c3-8bed-1da3b7b4fea0	9804	9804	f7e17a24-95a2-4767-b2d8-f99bf990d61d
5029	CREDIT	WWCode t-shirt sales	7570	USD	2017-01-17 19:34:31.424-08	2017-01-17 19:34:31.75-08	300	3	\N	\N	\N	\N	\N	\N	\N	USD	1	7570	7570	\N	aad8a770-9f19-a076-f1f3-cb65c19912bc	9804	9804	f9a207ac-36b6-4437-87e6-6cd950a9c46a
2264	CREDIT	Diana A. Scholarship Google I/O	25000	USD	2016-10-04 15:19:06.989-07	2016-10-04 15:19:07.108-07	272	3	\N	\N	\N	\N	\N	\N	\N	USD	1	25000	25000	\N	ac252d9a-6572-2bd7-3752-5177cdc53b14	9804	9804	fb3b97be-94a1-4b11-88e6-b579b714f47d
4280	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 11:37:32.49-08	2016-12-23 11:37:32.668-08	268	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	bc670b03-0cf3-7e55-60b4-32a74512fb7b	9804	9804	fc85c17f-1bfc-4cac-a401-7d6a10d2d16c
3510	CREDIT	Global Development	80000	GBP	2016-11-29 13:14:00.118-08	2016-11-29 13:14:01.107-08	278	3	\N	\N	\N	\N	\N	\N	\N	USD	1.2468999999999999	99752	80000	\N	5c15ec5c-f5b6-8c46-994f-a10fb014350c	9804	9804	fd2fa1d5-5564-479e-8aa2-37fd3686bfed
5284	DEBIT	Drinks (La Croix water) for Jan HackNight	-2093	USD	2017-01-25 10:41:33.613-08	2017-01-25 10:41:34.163-08	48	142	1476	\N	\N	\N	\N	\N	\N	USD	1	-2093	-2093	724	2f1a9931-ca67-f439-c71a-ac215070b1ce	8492	9804	80995f78-d7d2-45c1-9fca-84089d6e6abc
230	DEBIT	Feb 1, Lightning Talks	-22568	USD	2016-03-20 11:06:09.887-07	2016-03-29 13:37:47.75-07	2	28	\N	2016-03-28 17:00:00-07	\N	\N	\N	\N	\N	USD	1	-22568	\N	\N	3ef6c542-9f53-6c6a-1cf3-cb29b9ebde17	6280	9804	1afbbdbb-0d3c-4f73-9a1e-52bfa557f877
4265	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 09:31:16.26-08	2016-12-23 09:31:16.392-08	195	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	1cde374d-fc16-02b3-43c0-d220ecdb1b88	9804	9804	19fb9605-a6bd-414e-8d9d-2b3baabd0b3b
326	DEBIT	Global Developement	-150	USD	2016-04-12 11:46:49.263-07	2017-11-02 14:23:27.91-07	4	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-150	-150	79	ccf98ae6-a841-67d5-94e3-3b81dca144c6	9804	9804	ce4aa999-6cf0-404b-b985-03d4be5d6727
670	DEBIT	FedEx Office	-3418	USD	2016-01-24 16:00:00-08	2017-11-02 14:23:29.498-07	48	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-3418	-3418	195	5b284a6b-2108-6b01-34aa-ce1db73567bf	9804	9804	5eb8f014-f1ce-4c59-9d3c-d51e977c2edf
2424	DEBIT	Career development event w/ Mike Ross	-65000	USD	2016-10-11 17:42:04.584-07	2016-10-11 17:42:04.834-07	48	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-65000	-65000	\N	73fea503-fae4-92b3-1a19-f489b76d7e0d	51	9804	89819d45-d210-4342-a5ec-c39257e24fa7
3200	CREDIT	Portland t-shirt proceeds	6915	USD	2016-11-17 10:01:32.1-08	2016-11-17 10:01:32.49-08	59	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6915	6915	\N	4a17e7b3-9430-a153-4ef9-8405f6c6cf7d	9804	9804	66f52fc4-b4c9-4f51-a77e-b906bf9727b6
3201	CREDIT	T-shirt payout	1092	USD	2016-11-17 10:03:13.726-08	2016-11-17 10:03:13.862-08	59	3	\N	\N	\N	\N	\N	\N	\N	USD	1	1092	1092	\N	4cb1dbec-8d2d-bda1-332f-74ff8fd51f9f	9804	9804	9be6ddf6-b846-4ee2-a583-8ea7860c958f
3541	CREDIT	Global Development	20000	USD	2016-11-29 15:34:32.59-08	2016-11-29 15:34:32.817-08	259	3	\N	\N	\N	\N	\N	\N	\N	USD	1	20000	20000	\N	41f2fb0c-79b4-441d-9ed2-bf2cd353880b	9804	9804	9c1410bd-ec00-4adb-94d0-9765c2400f3f
4188	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-21 10:49:47.667-08	2016-12-21 10:49:47.892-08	2	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	5fb45b5e-d542-cc33-a2e5-ed05775f46c0	9804	9804	4ce9a3b0-7870-4af8-87fb-1806487604dc
2266	DEBIT	 Network budget balance pre Open Collective	-4356	USD	2016-10-04 15:37:57.159-07	2016-10-04 15:37:57.359-07	273	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-4356	-4356	\N	0c118fa3-b52e-b60d-3b2c-f1dd1294da49	51	9804	5bbfcfa2-5ab6-4efc-8d9d-2c56cd8662e0
370	DEBIT	Global Development	-150	USD	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.883-07	4	3	\N	2016-06-14 11:14:22.479-07	\N	\N	\N	\N	\N	USD	1	-150	-150	93	123294cb-bf7a-6f56-ccda-f71dcccb55a1	51	9804	00741993-7d16-4dcb-894a-65359800a845
2417	DEBIT	Network support - Regional Leadership (thanks VMWare)	-370000	USD	2016-10-11 12:51:28.361-07	2016-10-11 12:51:28.677-07	262	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-370000	-370000	\N	168c71da-4c85-8540-c5a5-1dbf57079b3d	51	9804	078f7e41-73e9-42c3-8eda-eda6c3c03e06
335	DEBIT	Global Development	-150	USD	2016-04-12 11:52:16.188-07	2016-04-12 14:19:43.124-07	4	3	\N	2016-04-12 14:19:43.124-07	\N	\N	\N	\N	\N	USD	1	-150	\N	\N	8c0872b0-ac76-b054-50c0-7949dcf68bba	51	9804	7ada63a5-9f33-4ff8-9d5f-58eade41c950
99	DEBIT	IVA Libretas Hackathon	-166080	MXN	2016-02-16 10:58:04.663-08	2016-06-14 11:14:21.738-07	10	7	\N	2016-06-14 11:14:22.436-07	\N	\N	\N	\N	\N	USD	0.053054999999999998	-8811	-166080	34	fd69b94d-344f-b0d4-d1bc-db1c384f7126	5788	9804	d90d8ac4-b83c-4fe8-ac84-b12f9dab1a44
229	DEBIT	Mar 3 hack night	-4951	USD	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.784-07	2	28	26	\N	\N	\N	\N	\N	\N	USD	1	-4951	-4951	55	2c9e66f5-f26d-75b8-cd4d-f652ae1da459	6280	9804	74ed50a9-b1f7-4c35-92cc-dddf926305d1
231	DEBIT	Feb 1, Lightning Talks	-22568	USD	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.794-07	2	28	26	\N	\N	\N	\N	\N	\N	USD	1	-22568	-22568	56	fce9d733-a1fc-1b5b-7e3d-34512fb767b5	6280	9804	839ec193-7e98-4076-9599-c667a5d393a7
2817	DEBIT	Almond milk for coffee (ATXDivHack)	-1192	USD	2016-10-31 14:13:53.591-07	2016-10-31 14:13:53.747-07	2	28	1043	\N	\N	\N	\N	\N	\N	USD	1	-1192	-1192	446	fc4e3ac4-f890-3817-d3b2-6520885f0019	6280	9804	38b690a7-41dc-4f6e-b9c3-a80f725564bb
273	DEBIT	Connect 2016 event setup day dinner	-6800	USD	2016-03-17 17:00:00-07	2016-06-14 11:14:21.838-07	14	32	26	\N	\N	\N	\N	\N	\N	USD	1	-6800	-6800	72	756f025c-0e07-0b8f-e6cb-0cadbfbbb586	6353	9804	53d5e969-a15d-4d93-a03c-f45c29172178
571	DEBIT	Connect Conference video footage review	-2948	USD	2016-05-16 17:31:54.682-07	2016-06-14 11:14:22.053-07	14	31	26	\N	\N	\N	\N	\N	\N	USD	1	-2948	-2948	167	c54c4636-f562-8a9c-c51c-e6d3c149395c	7538	9804	ed99b4d5-f390-488a-b255-426cd1417ff4
350	DEBIT	Global Development	-100	USD	2016-04-15 10:29:50.291-07	2017-11-02 14:23:28.065-07	13	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-100	-100	86	67864b23-cadd-1025-f8fc-7ac9068d0d38	9804	9804	61eac8d5-fee8-4100-be51-501827c46c4f
401	DEBIT	CONNECT 2016	-2452	USD	2016-04-25 17:00:00-07	2017-11-02 14:23:28.187-07	14	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-2452	-2452	99	36b78b83-0a07-8a16-39f6-80450482646f	9804	9804	5122145b-4b78-497a-875e-37cd85aedd69
408	DEBIT	Global Development	-100	USD	2016-04-26 20:56:08.086-07	2017-11-02 14:23:28.239-07	13	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-100	-100	101	975c3aea-aeeb-0c04-cc2e-57636cb10c02	9804	9804	fc71d09c-9e63-4f33-8380-ac72a5331fcc
413	DEBIT	Global Development	-150	USD	2016-04-27 09:21:00.228-07	2017-11-02 14:23:28.305-07	48	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-150	-150	103	0071ca13-d806-b2ca-be88-e1a795fab5a0	9804	9804	90184a69-df7b-4bb5-973d-93623a82f9b8
669	DEBIT	Photographer: Mike Ross	-65000	USD	2016-01-05 16:00:00-08	2017-11-02 14:23:29.43-07	48	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-65000	-65000	193	9ecfd6ad-ce8b-c186-3037-da80a748f565	9804	9804	851fc7ce-2c03-4a3a-bd43-b192c6d50df3
2400	DEBIT	Test	-1000	USD	2016-10-11 09:18:39.252-07	2017-11-02 14:23:30.364-07	195	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-1000	-1000	413	1764cae6-374d-73bf-1748-1dae99c9e060	9804	9804	f4b4a620-d1c9-468f-9896-edadf60b203f
3956	CREDIT	Donation via Meetup - fees + Global Development	1187	USD	2016-12-13 12:17:57.936-08	2016-12-13 12:17:58.19-08	272	3	\N	\N	\N	\N	\N	\N	\N	USD	1	1187	1187	\N	eab8622c-7007-14d1-a9bd-b468f6c3e2e9	9804	9804	143ef45a-8106-439a-8730-274d7ff7549c
2300	CREDIT	Network development	6000	USD	2016-10-06 09:01:48.321-07	2016-10-06 09:01:48.667-07	4	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	2bf9b50a-bd6d-d972-80ea-66e925e13cdb	9804	9804	b33c765a-d35f-48d9-9b52-9c2df566e9a2
5031	CREDIT	Donation via meetup	775	USD	2017-01-17 19:48:10.558-08	2017-01-17 19:48:10.699-08	272	3	\N	\N	\N	\N	\N	\N	\N	USD	1	775	775	\N	1616c553-fbfc-17da-b8e2-96d18986deed	9804	9804	069ab872-2620-4663-90d4-e67a69276e48
5028	CREDIT	WWCode t-shirt sales	2371	USD	2017-01-17 19:33:30.061-08	2017-01-17 19:33:30.587-08	271	3	\N	\N	\N	\N	\N	\N	\N	USD	1	2371	2371	\N	65dfb1da-e476-0cd6-6a3f-db850cf29536	9804	9804	2fbf22c1-f68e-4e3a-9235-d4b8167ee4eb
6733	CREDIT	Event sponsorship - transaction fees and global development 	856500	USD	2017-03-01 22:00:43.46-08	2017-03-01 22:00:44.182-08	12	3	\N	\N	\N	\N	\N	\N	\N	USD	1	856500	856500	\N	e3194cf7-7b12-e682-1cec-a4b42059be05	9804	9804	a5b1d311-01b7-45af-b0bc-b5c172eb2a4c
298	DEBIT	Reimbursement to Kamila for coffee purchased for volunteers at CONNECT 2016	-11815	USD	2016-04-05 12:44:01.338-07	2017-11-02 14:23:27.808-07	14	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-11815	-11815	74	06823b23-bfc6-5987-6fe9-091c4ac1f6d9	9804	9804	a9bc9d67-70ab-4630-9451-db828180399c
7527	DEBIT	To redeem travel stipend to Google I/O	-100000	USD	2017-03-27 10:54:16.729-07	2017-03-27 10:54:16.758-07	277	1331	2266	\N	\N	\N	\N	\N	4430	USD	1	-100000	-104430	935	a890c5b3-fa3d-3ec2-5d3a-8c600185135f	5791	9804	1d3c0dce-b322-46b7-a54b-ab48d23a29a0
10135	DEBIT	Google I/O Travel Stipend	-100000	USD	2017-05-16 15:00:40.275-07	2017-05-16 15:00:40.275-07	48	142	\N	\N	\N	\N	\N	\N	0	USD	1	-100000	-100000	1088	2482075d-61be-645e-bd8d-5df98f8f9f37	8492	9804	a46e092f-dcb2-4e78-a5be-7db838612345
414	DEBIT	WePay Fee	-400	USD	2016-04-10 17:00:00-07	2017-11-02 14:23:28.335-07	48	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-400	-400	104	7e93a414-16b3-ebbc-0e5a-09ce0478de5c	9804	9804	cfb73ea7-92a9-4f09-ac0e-68a361f53ab1
615	DEBIT	Conference Grant	-70000	USD	2016-05-19 12:07:13.723-07	2017-11-02 14:23:29.232-07	3	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-70000	-70000	178	a72c8412-b75f-f2dc-6c40-24af836272ad	9804	9804	f33cbc27-4130-43a6-92c9-39b47ad1b689
676	DEBIT	CONFERENCE GRANT	-34750	USD	2016-05-26 12:05:53.771-07	2017-11-02 14:23:29.603-07	59	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-34750	-34750	197	cfd3bd33-13f2-dc02-c02c-2ec5268c46f3	9804	9804	149cbfd4-4359-4a93-928d-03f13d60c012
8618	DEBIT	Travel Scholarship for WWCode Director	-40970	GBP	2017-04-17 15:32:02.724-07	2017-11-02 14:23:33.091-07	278	3	\N	\N	\N	\N	\N	\N	0	USD	1.25409999999999999	-51380	-40970	768	1525c16d-7cce-fa80-08ef-bb9f413dde31	9804	9804	d0b076ef-dc9c-46a4-84e3-6b27957adb5d
8616	DEBIT	Network Development: Attend CapOne WIT 2017 Kickoff to announce partnership for re-launch	-100000	USD	2017-04-17 15:12:22.995-07	2017-11-02 14:23:34.14-07	270	3	\N	\N	\N	\N	\N	\N	0	USD	1	-100000	-100000	1027	504c4bfc-27f4-b3f0-0465-4c5afeb2cc1f	9804	9804	649452e8-25d9-469b-8be9-6f1b71925d5b
7662	CREDIT	\N	79600	GBP	2017-03-31 10:20:23.917-07	2017-03-31 10:20:23.917-07	267	3	\N	\N	\N	2206	0	0	0	USD	1.24960000000000004	99468	79600	\N	0b7fc199-232f-b083-d2a2-6fab431ff53c	9804	9804	3974d9e5-45e9-4567-af83-704bfde7c25d
7661	CREDIT	\N	50000	USD	2017-03-31 10:17:51.695-07	2017-03-31 10:17:51.695-07	2	3	\N	\N	\N	2204	0	0	0	USD	1	50000	50000	\N	2143f467-6226-9d0e-0c03-5967cc98585d	9804	9804	51311839-3e87-4a1e-b238-e829fa69693c
7665	CREDIT	\N	80500	GBP	2017-03-31 10:54:33.461-07	2017-03-31 10:54:33.461-07	278	3	\N	\N	\N	2208	0	0	0	USD	1.24960000000000004	100593	80500	\N	825342af-b29b-627e-328d-b2dfa2bc06a4	9804	9804	640fa650-3836-4ba9-afa0-224836c5c2c3
3843	DEBIT	Leadership Event in Sofia	-6444	EUR	2016-12-07 13:38:07.287-08	2016-12-07 13:38:07.429-08	301	1379	1191	\N	\N	\N	\N	\N	\N	USD	1.07299999999999995	-6914	-6444	471	8929c239-0075-24dd-92d6-feba5b114183	3869	9804	375e8ef4-15ee-49a1-b8e6-0081c5ca5cf6
4140	DEBIT	Leadership - Planning for 2017 - Evening Coffee	-875	USD	2016-12-19 10:43:53.809-08	2016-12-19 10:43:54.334-08	48	142	1191	\N	\N	\N	\N	\N	\N	USD	1	-875	-875	603	9f9c000c-e0d3-808f-288d-d5ecd613ed7b	8492	9804	425cae04-b1a8-4d6e-ae89-4159170a45b4
4139	DEBIT	Leadership - Planning for 2017 - Afternoon Coffee	-1175	USD	2016-12-19 10:42:59.021-08	2016-12-19 10:42:59.545-08	48	142	1191	\N	\N	\N	\N	\N	\N	USD	1	-1175	-1175	601	8b02e4b8-ede2-92e5-fbdc-47c6cd2160b4	8492	9804	59a4ddff-3c85-4224-8fd3-c2fc4b4188cd
336	DEBIT	Meetup Transaction Fee	-163	USD	2016-04-12 11:52:16.188-07	2016-06-14 11:14:21.849-07	4	3	\N	2016-06-14 11:14:22.458-07	\N	\N	\N	\N	\N	USD	1	-163	-163	82	b4810b79-5cbd-0e35-fb36-ea01b9ae8707	51	9804	2f72916f-8bfb-48e8-8bb3-c6715593f5fd
369	DEBIT	Stacey Schipper Reimbursement	-2322	USD	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.873-07	15	3	\N	2016-06-14 11:14:22.471-07	\N	\N	\N	\N	\N	USD	1	-2322	-2322	92	64a424e6-37e6-ab2f-d660-1ac1e503771d	51	9804	d8daff55-9143-4022-9476-2c245545b2d6
96	CREDIT	Donation to WWCode Mexico City	100	MXN	2016-02-15 10:46:05.92-08	2016-04-01 07:32:17.223-07	10	7	64	2016-04-07 07:32:17.381-07	\N	83	\N	\N	\N	USD	0.0530079999999999996	5	\N	\N	63f0e0e0-bfa2-cc97-30c9-a24f4e8acd11	5788	9804	dfcf78f9-189a-4a68-ae27-5f4f3b93c6c0
129	CREDIT	Recurring subscription	100	USD	2016-03-02 10:26:05.731-08	2016-04-16 13:40:58.833-07	13	30	44	\N	\N	70	5	10	33	USD	1	100	52	\N	ae03e582-7bad-2b90-bc0c-fc4a77a25129	2385	9804	8a6a2d3b-144a-417b-92b5-9ec619bbbfce
299	DEBIT	Reimburse Caterina for travel expenses to CONNECT 2016	-6500	USD	2016-04-05 12:44:01.338-07	2017-11-02 14:23:27.85-07	59	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6500	-6500	75	650a7a72-ae11-a2de-a811-ab0996d8b610	9804	9804	cde85570-38f7-4b56-9865-106cb8b8dd12
569	DEBIT	Conference Grant	-50000	MXN	2016-05-16 07:49:37.27-07	2017-11-02 14:23:29.169-07	10	3	\N	\N	\N	\N	\N	\N	\N	USD	0.0549229999999999996	-2746	-50000	164	258051fd-a472-942a-8e0e-7df35f15fe2f	9804	9804	e5d5972c-8e3a-4d9a-9765-5fd94b58be66
668	DEBIT	Leadership Tools (director tees)	-2698	USD	2015-12-14 16:00:00-08	2017-11-02 14:23:29.393-07	48	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-2698	-2698	192	71aadbef-53df-ab3a-d815-ff26eea4ad28	9804	9804	0e180c36-d84c-484f-8b72-eb6f33b7629c
865	DEBIT	Reimburse Caterina Paun for supplies and mailing expenses	-5504	USD	2015-12-14 16:00:00-08	2017-11-02 14:23:29.755-07	59	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-5504	-5504	225	99cc081b-14ba-ab4f-db89-533ca3e8ac3b	9804	9804	069a75e2-2862-49ca-9607-c7bebffc3534
459	DEBIT	WWC Boulder- April event's food	-14100	USD	2016-04-06 17:00:00-07	2016-06-14 11:14:21.989-07	15	68	320	\N	\N	\N	\N	\N	\N	USD	1	-14100	-14100	137	866e2568-b7a1-5d05-9543-e98b9ac37ffd	8203	9804	8df92771-cef0-4a18-aa86-f1c8b4346361
460	DEBIT	Mile High Agile outreach- supplies	-1115	USD	2016-04-02 17:00:00-07	2016-06-14 11:14:21.989-07	15	68	26	\N	\N	\N	\N	\N	\N	USD	1	-1115	-1115	136	b009698d-37fb-ed52-15af-5db15d251f8c	8203	9804	fea769f8-5f29-4130-b4d4-1af0d8affbc9
2235	CREDIT	Turner Matching Donation	5000	USD	2016-10-04 08:46:59.013-07	2016-10-04 08:46:59.134-07	12	3	\N	\N	\N	\N	\N	\N	\N	USD	1	5000	5000	\N	36ddc662-ae47-f2bd-bb04-c845d0dcac9d	9804	9804	3d44013c-0165-4593-a5d2-ab4fd2cd7e02
3533	CREDIT	Network Development	20000	USD	2016-11-29 14:43:53.719-08	2016-11-29 14:43:53.971-08	286	3	\N	\N	\N	\N	\N	\N	\N	USD	1	20000	20000	\N	f931af35-7c4f-1a2a-a464-de7d6a05fb7a	9804	9804	9f837628-186f-432e-ba2f-9cf5b3c8a547
2262	CREDIT	Donation via meetup	2363	USD	2016-10-04 15:14:59.695-07	2016-10-04 15:14:59.884-07	272	3	\N	\N	\N	\N	\N	\N	\N	USD	1	2363	2363	\N	b31b72f1-f74b-1708-793f-b33bcea55e7d	9804	9804	bf37a7b8-a5d5-49b2-8583-0d921056140d
349	CREDIT	Jasna Rodulfa	1000	USD	2016-04-15 07:17:21.126-07	2016-04-16 13:40:58.829-07	13	3	\N	\N	\N	\N	\N	\N	\N	USD	1	1000	1000	\N	e89dbc30-b2bc-17f3-57a0-1e8ae91e58c4	9804	9804	da2c23c0-aea8-4031-8532-9dce28c9eac2
2539	DEBIT	Director t-shirt	-3325	USD	2016-10-17 14:01:02.872-07	2016-10-17 14:01:02.925-07	298	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-3325	-3325	\N	c9b53e12-ef9d-309f-f738-b288a90655a1	51	9804	d1fe8690-b916-42f2-a2f3-d01e8545d3eb
3532	DEBIT	Leadership Development - speaking event	-25000	USD	2016-11-29 14:39:25.11-08	2016-11-29 14:39:25.31-08	47	3	\N	2016-11-28 16:00:00-08	\N	\N	\N	\N	\N	USD	1	-25000	-25000	\N	017f47d4-403f-95d7-73d9-25953bc17ec7	51	9804	8ccd1d44-a6aa-4131-ab8e-58d6e97cbb61
3536	DEBIT	Banner	-2000	USD	2016-11-29 15:07:29.03-08	2016-11-29 15:07:29.148-08	289	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-2000	-2000	\N	2cf82503-764d-3937-ef34-771eb0e3e68f	51	9804	5ebd1f0a-19e8-4d42-9f54-a499c19d3001
4183	DEBIT	45 webcam covers + shipping	-9685	USD	2016-12-21 07:39:46.852-08	2016-12-21 07:39:47.49-08	59	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-9685	-9685	\N	6c7af409-e28a-b8a6-c17d-3f9af883c334	51	9804	f07fcb73-9f80-415c-87db-301bf27a58ca
539	DEBIT	Conference Expense	-8320	USD	2016-05-10 12:19:21.785-07	2016-06-14 11:14:22.042-07	48	3	\N	2016-06-14 11:14:22.515-07	\N	\N	\N	\N	\N	USD	1	-8320	-8320	158	1a2d3a71-c32f-520a-a98b-f83ca1044169	51	9804	58870d95-bf27-4f0c-803b-87870e1cd1dd
387	DEBIT	Global Developement	-100	USD	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.883-07	13	3	\N	2016-06-14 11:14:22.48-07	\N	\N	\N	\N	\N	USD	1	-100	-100	97	2966fddc-df92-bb72-19ff-ffb1947d6d66	51	9804	996e3757-7b7c-4caa-9295-e08f71e7788a
131	CREDIT	Recurring subscription	100	USD	2016-03-02 15:01:26.771-08	2016-04-16 13:40:58.719-07	14	8	45	\N	\N	71	5	10	33	USD	1	100	52	\N	b3f668d8-8ef9-20a0-1a1a-448d58e3cac8	8638	9804	eba76a60-68c1-4dae-87b9-7400def0c00d
77	CREDIT	Donation to WWCode Seattle	100	USD	2016-02-02 13:46:44.866-08	2016-04-16 13:40:58.7-07	14	8	45	\N	\N	71	5	10	33	USD	1	100	52	\N	0808395e-e085-5395-ca22-896c0ae4c2ce	8638	9804	d89bc70d-550f-40bf-975b-ad62e07f7bb7
103	CREDIT	Donation to WWCode Austin	30000	USD	2016-02-18 11:54:08.531-08	2016-04-16 13:40:58.717-07	2	108	71	\N	\N	15	0	3000	900	USD	1	30000	26100	\N	1ac5612a-db6a-8753-e35c-0f8cf880f52c	8253	9804	a996d3a4-7e02-4c5e-b265-7e40c4f200ca
703	DEBIT	CONFERENCE GRANT	-80000	USD	2016-05-31 10:47:01.276-07	2017-11-02 14:23:29.639-07	13	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-80000	-80000	198	074d77ae-1384-fc1b-ee2f-c5547a606614	9804	9804	eb306caf-e34a-4607-ac22-e3ff3bfc6b4e
4258	DEBIT	Meetup Fees	-4900	GBP	2016-12-23 09:05:41.927-08	2017-11-02 14:23:31.572-07	264	3	\N	\N	\N	\N	\N	\N	\N	USD	1.2249000000000001	-6002	-4900	618	b8e3bbaf-12a0-2491-da11-9e38345867da	9804	9804	7d022b37-c744-4fc3-866d-afa8b5db2264
4262	DEBIT	Meetup Fees	-5700	EUR	2016-12-23 09:15:16.054-08	2017-11-02 14:23:31.63-07	301	3	\N	\N	\N	\N	\N	\N	\N	USD	1.04459999999999997	-5954	-5700	620	c79e091d-a0a5-90d3-dbdb-16e4a2520283	9804	9804	74ea716f-9628-450c-b441-5b28f217c621
4264	DEBIT	Meetup Fees	-6000	USD	2016-12-23 09:21:53.018-08	2017-11-02 14:23:31.664-07	259	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	621	6cf1662f-bcc3-05a4-1c47-f1398884dab3	9804	9804	100ea589-7404-4218-a298-3b7b990f3217
4268	DEBIT	Meetup Fees	-6000	AUD	2016-12-23 09:42:18.688-08	2017-11-02 14:23:31.722-07	266	3	\N	\N	\N	\N	\N	\N	\N	USD	0.717149999999999954	-4303	-6000	623	78684481-fb06-21fc-bdbd-3495f662a1f7	9804	9804	a6dbb176-568e-49f7-8da5-f430ae2db04c
4271	DEBIT	Meetup Fees	-4900	GBP	2016-12-23 10:04:05.755-08	2017-11-02 14:23:31.751-07	267	3	\N	\N	\N	\N	\N	\N	\N	USD	1.2249000000000001	-6002	-4900	624	b73c3b31-7878-bc8d-10c3-6db93f62908e	9804	9804	c6ff7126-3f7f-40e2-bb18-f55e2f9c05f0
4371	DEBIT	Meetup Fees	-5700	EUR	2016-12-27 08:36:05.296-08	2017-11-02 14:23:32.045-07	298	3	\N	\N	\N	\N	\N	\N	\N	USD	1.04449999999999998	-5954	-5700	637	6f5c8693-8b67-1b0d-3b74-88392cd101d1	9804	9804	94a7f86a-429e-491c-83a9-a381ac936b61
4379	DEBIT	Meetup Fees	-6000	USD	2016-12-27 08:55:07.385-08	2017-11-02 14:23:32.161-07	275	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	641	7cdf9ff6-0078-3979-6132-4ad3b3f36604	9804	9804	bdebe28e-1dd1-4666-8ea0-7dbdc5bcabe0
4383	DEBIT	Meetup Fees	-6000	USD	2016-12-27 09:03:23.101-08	2017-11-02 14:23:32.219-07	277	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	643	b85364e3-1e8a-e45d-0a11-4fc9e60e5e3d	9804	9804	f544c231-ffd3-4867-a25e-b6ac906d4ecd
4385	DEBIT	Meetup Fees	-6000	USD	2016-12-27 09:27:09.602-08	2017-11-02 14:23:32.247-07	279	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	644	00848eb8-8a04-7793-bf4b-659106e1dd13	9804	9804	fde808eb-6487-4194-a088-999bddab57fd
4442	DEBIT	Meetup Fees	-6000	CAD	2016-12-28 08:30:16.279-08	2017-11-02 14:23:32.933-07	293	3	\N	\N	\N	\N	\N	\N	\N	USD	0.736670000000000047	-4420	-6000	666	0ebf6de8-37d3-bbfa-245e-0ff56a9691a6	9804	9804	2a38b8b1-4737-44bf-8f14-6226181b753b
4444	DEBIT	Meetup Fees	-6000	USD	2016-12-28 08:32:19.412-08	2017-11-02 14:23:32.965-07	294	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	667	f7a95355-c1bb-9476-9abe-b0dc7089ba10	9804	9804	a845c6dc-86ac-4088-a506-9330b8290f99
654	DEBIT	Conference Grant	-15000	USD	2016-05-24 12:42:50.307-07	2017-11-02 14:23:29.268-07	13	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-15000	-15000	188	4ec7667c-14ea-b6df-a8ca-bcba2dd1e6ed	9804	9804	34043479-7a3b-4504-ba5e-92d81fe2165e
660	DEBIT	Conference Grant - Sarah Olson	-20000	USD	2016-05-25 09:39:09.882-07	2017-11-02 14:23:29.357-07	48	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-20000	-20000	190	dda97b01-71f2-0d84-2f94-a2ee764ec508	9804	9804	be805c8c-dedf-4974-993e-f18d87a0ff1d
637	DEBIT	April 7 South Hack Night	-5037	USD	2016-05-22 16:46:04.647-07	2016-06-14 11:14:22.083-07	2	28	26	\N	\N	\N	\N	\N	\N	USD	1	-5037	-5037	180	3a7e77b2-c82b-c57a-fd40-1f23ceac243a	6280	9804	1f0aa71c-a8eb-43c3-b6d9-6227af7d17fb
638	DEBIT	May 5 South Hack Night	-5325	USD	2016-05-22 16:46:04.647-07	2016-06-14 11:14:22.083-07	2	28	26	\N	\N	\N	\N	\N	\N	USD	1	-5325	-5325	181	17c6a37e-fd3f-88f6-5562-c8cca2adeb90	6280	9804	967e0c31-6c72-4502-9ee4-064b2939dd20
507	DEBIT	Quarterly planning meeting	-14000	USD	2016-05-05 17:18:43.265-07	2016-06-14 11:14:22.011-07	14	32	26	\N	\N	\N	\N	\N	\N	USD	1	-14000	-14000	147	e2bd7fa9-ffbe-4953-3e1f-3a4c10bfaf0b	6353	9804	b11e652b-3930-4e43-a965-26c6a7ae837e
666	CREDIT	Generous donation from Target to support WWCode Twin Cities	500000	USD	2016-05-26 11:37:24.922-07	2016-05-26 11:37:23.286-07	48	3	\N	\N	\N	\N	\N	\N	\N	USD	1	500000	500000	\N	516be8e9-5732-d404-bce6-c167fb0c78fe	9804	9804	14c8dee4-8aa3-4f93-8452-7b46794e65bc
667	CREDIT	Proceeds from teespring	10022	USD	2016-05-26 11:38:50.077-07	2016-05-26 11:38:48.41-07	48	3	\N	\N	\N	\N	\N	\N	\N	USD	1	10022	10022	\N	95241274-990b-9ee8-6dad-ed306ff3c93f	9804	9804	bcff5cb0-e070-415c-9d4e-7552d3ea2f03
859	DEBIT	Global Development 	-150	USD	2016-06-09 11:38:16.857-07	2017-11-02 14:23:29.694-07	4	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-150	-150	222	70ffb860-75cf-fe9d-02fb-a5ddb2cc6eb1	9804	9804	0a30c706-fb02-4277-bd05-620a776788a3
867	DEBIT	Global Development	-5000	USD	2016-02-21 16:00:00-08	2017-11-02 14:23:29.786-07	59	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-5000	-5000	227	7abf9a38-2aea-800c-7920-e44c843eac82	9804	9804	e11df430-3af7-492a-9533-d4ad946eae62
2403	DEBIT	Network Budget pre Open Collective	-11797	USD	2016-10-11 09:52:07.045-07	2016-10-11 09:52:07.303-07	59	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-11797	-11797	\N	3a304b90-b767-65bf-46e7-a0d9cdac4108	51	9804	3f890544-389c-4090-b521-a0e692e4067e
2328	DEBIT	Conference stipend Olivia F.	-39585	GBP	2016-10-07 06:35:08.613-07	2016-10-07 06:35:08.724-07	278	3	\N	\N	\N	\N	\N	\N	\N	USD	1.23290000000000011	-48804	-39585	\N	dce9855e-678f-14d4-13b7-4dad2ffa9568	51	9804	5e8859d7-a5e8-4729-b71e-665170881f8c
3837	DEBIT	Food/Drinks for Leadership Team Meeting - Gen, Claire - Oct 2016	-4000	GBP	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	278	1333	\N	\N	\N	\N	\N	\N	\N	USD	1.26089999999999991	-5044	-4000	507	86c79976-65b2-5ceb-7432-d5d3b89bcc79	8487	9804	e14a0a77-b4a0-4036-8f3c-2fdc9af18db5
2380	DEBIT	WWCode Portland Stickers	-31950	USD	2016-10-10 13:12:33.813-07	2017-11-02 14:23:30.331-07	59	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-31950	-31950	411	61c35bee-0aa8-2a23-fc79-2be2986629f7	9804	9804	f7371450-7bc9-4a82-a57b-d6fec226e18c
4266	DEBIT	Meetup Fees	-6000	USD	2016-12-23 09:32:55.31-08	2017-11-02 14:23:31.693-07	195	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	622	b76ef4f6-50da-7e8b-0c81-4a4c6deab2eb	9804	9804	407c9615-8d5e-4803-b3d5-d64e0ee83144
4375	DEBIT	Meetup Fees	-6000	USD	2016-12-27 08:50:06.414-08	2017-11-02 14:23:32.103-07	273	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	639	a9fdf859-56f6-c5dc-ce5d-242fa80903f6	9804	9804	cbac7370-082d-4bfd-adef-a01da31e3a6c
4372	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 08:38:50.944-08	2016-12-27 08:38:51.039-08	272	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	59cbee2a-b9be-8a5b-14dc-a7802c719411	9804	9804	1e735aff-4936-4031-9e1b-03c67462f260
3618	CREDIT	Banner	2000	USD	2016-11-30 13:19:37.017-08	2016-11-30 13:19:37.251-08	269	3	\N	\N	\N	\N	\N	\N	\N	USD	1	2000	2000	\N	b8ad6098-dd11-83b8-6f5d-9bf0b4218603	9804	9804	5a283598-e6a7-47d9-b485-45a68f1a6997
325	CREDIT	From:\tThao Le	1500	USD	2016-04-12 11:49:06.645-07	2016-04-16 13:40:58.815-07	4	3	\N	\N	\N	\N	\N	\N	\N	USD	1	1500	1500	\N	ca9394b0-19d5-653a-30d6-0c8c78e91e86	9804	9804	8e2bb9f1-aa36-4b79-847a-621445e76f05
4377	DEBIT	Meetup Fee	-6000	USD	2016-12-27 08:52:46.242-08	2017-11-02 14:23:32.133-07	274	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	640	c83b998a-b458-8c1c-c106-bd0a54955c8d	9804	9804	dacd730d-446e-44bb-95e8-ac42e6245c66
3526	DEBIT	Banner	-2000	USD	2016-11-29 14:34:04.252-08	2016-11-29 14:34:04.435-08	47	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-2000	-2000	\N	979d8fda-c197-f5d4-a92d-351c863bac1e	51	9804	7de0e64c-34eb-46b1-8bab-d76d931db7a5
3545	DEBIT	Network budget pre open collective	-55923	USD	2016-11-29 16:18:08.154-08	2016-11-29 16:18:07.832-08	285	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-55923	-55923	\N	384c0d2d-a06f-ec60-67ba-c9d48eaeed52	51	9804	08d8f7ed-3061-445e-912b-cd639b68cbba
3625	DEBIT	Conference Travel Stipend - Google I/O Elese	-75000	USD	2016-11-30 13:25:56.197-08	2016-11-30 13:25:56.423-08	276	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-75000	-75000	\N	8176336a-16dd-53a0-f3d4-121260f3cc03	51	9804	30b77acc-625c-4886-ba70-daaf52bf2da9
3628	DEBIT	Banner	-2000	USD	2016-11-30 13:33:38.691-08	2016-11-30 13:33:38.827-08	263	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-2000	-2000	\N	683e75c4-9bcd-8bfc-a69f-efd129cd4ee3	51	9804	9fcb84c3-45f2-4457-9374-51668110a9a1
10558	DEBIT	Event supplies	-3306	USD	2017-05-30 09:54:37.073-07	2017-05-30 09:54:37.073-07	59	171	\N	\N	\N	\N	\N	\N	0	USD	1	-3306	-3306	1003	692f6270-0c69-2d4e-5024-be4b26214e1c	6057	9804	9ce0de3f-38ac-4286-b390-d9fd98af6a45
3517	DEBIT	Lodging and meals for our WWC Seattle 7 team members leadership development retreat. Under approved budget!	-227646	USD	2016-11-29 13:46:42.259-08	2016-11-29 13:46:42.259-08	14	31	\N	\N	\N	\N	\N	\N	\N	USD	1	-227646	-227646	474	f5a976d4-6f2d-e467-df57-59f3af1d5214	7538	9804	d7bf6f92-b4d8-4d45-ae59-f2e1aacccdf1
3516	DEBIT	Matthews Group - Leadership Development for Seattle team	-60000	USD	2016-11-29 13:46:31.384-08	2017-11-02 14:23:30.42-07	14	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-60000	-60000	464	df671bd1-cc16-50d7-efe1-fc913554c5e2	9804	9804	96f2806c-0cdb-4d4a-a29e-07e94967f8e1
3624	CREDIT	Conference Travel Stipend - Google I/O Elese	75000	USD	2016-11-30 13:25:31.161-08	2016-11-30 13:25:41.165-08	276	3	\N	\N	\N	\N	\N	\N	\N	USD	1	75000	75000	\N	53ed1582-2227-bf95-292b-31fdbec33c21	9804	9804	9224ec3e-a3df-4252-8efa-ba0585c5fef6
3627	CREDIT	Banner	2000	USD	2016-11-30 13:33:30.25-08	2016-11-30 13:33:30.386-08	263	3	\N	\N	\N	\N	\N	\N	\N	USD	1	2000	2000	\N	7d658682-593e-b391-cd9f-705e77eddd62	9804	9804	db7f48d6-bfac-4949-b714-681b53023472
4247	DEBIT	Meetup Fees	-6000	USD	2016-12-23 08:37:59.322-08	2017-11-02 14:23:31.423-07	260	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	613	1ce8d5b2-08bb-260d-1b42-a31524fdf0f4	9804	9804	c7e6c3c5-d461-4d63-9c8e-368d7aaac1a3
4249	DEBIT	Meetup Fees	-6000	USD	2016-12-23 08:49:17.444-08	2017-11-02 14:23:31.454-07	261	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	614	ed796e93-29ee-e3b0-f988-0159803e4af8	9804	9804	72cef9cc-24b8-4881-9d71-7043e962ecd9
4251	DEBIT	Meetup Fees	-6000	USD	2016-12-23 08:52:20.827-08	2017-11-02 14:23:31.485-07	12	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	615	469651e6-18b3-af4a-46f8-44cdae00622f	9804	9804	0beeffdc-83e0-4bc8-8496-1402dc36486f
4254	DEBIT	Meetup Fees	-6000	USD	2016-12-23 08:56:04.579-08	2017-11-02 14:23:31.513-07	262	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	616	641bc307-2020-9ff1-ce0e-06f652f121f0	9804	9804	44f0b0bc-61a3-49f4-9770-ace977706081
4285	DEBIT	Meetup Fees	-6000	USD	2016-12-23 11:50:08.539-08	2017-11-02 14:23:31.87-07	270	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	628	b1baf700-e41f-2db3-4d3b-fb69fb242a60	9804	9804	d7b894c2-4042-491f-ac69-24b370e3197d
4406	DEBIT	Meetup Fees	-6000	USD	2016-12-27 11:46:50.958-08	2017-11-02 14:23:32.526-07	287	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	655	75482201-320e-2cc5-08cb-ce58198a9eaf	9804	9804	99aed55d-3d1b-4b3f-9043-3a6d193557e3
4408	DEBIT	Meetup Fees	-6000	USD	2016-12-27 11:50:16.992-08	2017-11-02 14:23:32.557-07	288	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	656	8fbbc976-47c5-7a93-6a8b-1600c83e8456	9804	9804	aed45f0c-1d85-45b6-80e0-1d1f0083298f
4410	DEBIT	Meetup Fees	-6000	USD	2016-12-27 11:53:07.2-08	2017-11-02 14:23:32.592-07	14	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	657	941e2586-a40d-c0c0-9abe-32141cecefc2	9804	9804	f2ba5aee-1543-4a13-83f4-016fd052cd83
4281	DEBIT	Meetup Fees	-6000	USD	2016-12-23 11:38:46.818-08	2017-11-02 14:23:31.803-07	268	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	626	767da353-b7ea-0a8a-1e5d-723a5dad06d3	9804	9804	2514b1be-0bc2-4e22-8237-b42e89ec385e
4586	CREDIT	Recurring subscription	1000	USD	2017-01-01 15:32:21.416-08	2017-01-01 15:32:21.416-08	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	099ddb45-d060-5b62-841a-d76cf78cb994	6616	9804	c85111ab-2fef-408e-bdd8-c8fe73a79b65
4425	DEBIT	Meetup Fees	-6000	USD	2016-12-28 07:44:44.222-08	2017-11-02 14:23:32.624-07	4	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	658	81006e5d-41ed-f3b3-4eaa-ad26caf04a71	9804	9804	3d6b38eb-cfd8-49fd-aa13-ff3d93fd4390
4427	DEBIT	Meetup Fees	-6000	USD	2016-12-28 07:49:16.255-08	2017-11-02 14:23:32.656-07	300	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	659	e25355c2-ce6b-9613-9bc8-efe9a6e460e6	9804	9804	22fa7e2e-0a73-4e1f-8d4a-5a08e3f92d74
4429	DEBIT	Meetup Fees	-6000	USD	2016-12-28 07:53:05.613-08	2017-11-02 14:23:32.692-07	289	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	660	eead738b-1c5e-f844-35f3-ce6327e5fcbd	9804	9804	7556ab03-99bb-468e-8d61-e3a829abcf2f
4431	DEBIT	Meetup Fees	-6000	AUD	2016-12-28 07:56:28.934-08	2017-11-02 14:23:32.741-07	297	3	\N	\N	\N	\N	\N	\N	\N	USD	0.717709999999999959	-4306	-6000	661	1dad4043-4be1-0821-2570-5715cbca9ac6	9804	9804	63fe3f63-b8ec-4928-867a-d1837bef3bd6
4428	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-28 07:51:42.465-08	2016-12-28 07:51:38.84-08	289	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	f3950fdb-4dc7-b89a-b3a4-9e346e4b7821	9804	9804	670b50b3-0e18-40e5-bcf4-7df2ddaa98ed
4430	CREDIT	Global Development for Meetup Fee	6000	AUD	2016-12-28 07:55:25.022-08	2016-12-28 07:55:21.475-08	297	3	\N	\N	\N	\N	\N	\N	\N	USD	0.717709999999999959	4306	6000	\N	dbb66160-a3af-21bb-97cf-0eaa5855214c	9804	9804	f6d27392-01a0-428f-bc1d-e4454cd91a34
7519	DEBIT	Google I/O	-50000	USD	2017-03-27 10:11:39.25-07	2017-03-27 10:11:39.275-07	12	69	2265	\N	\N	\N	\N	\N	1480	USD	1	-50000	-51480	952	3ae7f4f3-2bdb-5f49-8018-7cd37b1bd0ab	5147	9804	9c9fe6ab-f414-4103-8044-e5ff44601c43
7520	DEBIT	Google I/O ticket	-37500	USD	2017-03-27 10:12:00.118-07	2017-03-27 10:12:00.138-07	12	69	2265	\N	\N	\N	\N	\N	1118	USD	1	-37500	-38618	949	e1f6208c-bf33-aad7-bd32-e99f4e576140	5147	9804	69158bc2-e967-4c05-a77e-e6cc1db97bc9
3835	DEBIT	Leadership Event in Sofia	-1019	EUR	2016-12-07 13:30:48.339-08	2016-12-07 13:30:48.523-08	301	1379	1191	\N	\N	\N	\N	\N	\N	USD	1.07299999999999995	-1093	-1019	470	bc63944e-fe7a-ff2d-0766-6fc12e3bb8fb	3869	9804	d9fda61a-deb8-45f7-9fef-535336d51663
4161	DEBIT	Mugs for WWCode-SV	-46419	USD	2016-12-20 10:57:28.399-08	2016-12-20 10:57:28.525-08	300	1374	1476	\N	\N	\N	\N	\N	\N	USD	1	-46419	-46419	605	606b382f-4843-663f-1060-57d524cf9503	8405	9804	e248d26e-52af-4062-bed0-648dbadd5ffc
4137	DEBIT	Robotics: Coding with Your Kids HackNight Supplies	-20397	USD	2016-12-19 08:20:39.625-08	2016-12-19 08:20:40.499-08	48	142	1191	\N	\N	\N	\N	\N	\N	USD	1	-20397	-20397	604	bee4c5db-d134-78cb-25ec-4b5ddb7e1a29	8492	9804	c3b31238-7390-4982-a07a-a4a3a97bf88c
2820	DEBIT	Painters tape for signs  	-1136	USD	2016-10-31 14:14:51.746-07	2016-10-31 14:14:51.945-07	2	28	1043	\N	\N	\N	\N	\N	\N	USD	1	-1136	-1136	445	354a1125-ddd2-ef05-26c5-75099c4b4a6c	6280	9804	561701cd-1074-4058-bcc7-215ac8755f6a
3313	DEBIT	Thank you gift to an amazing sponsor!	-1700	USD	2016-11-22 04:31:00.49-08	2016-11-22 04:31:00.691-08	59	171	1191	\N	\N	\N	\N	\N	\N	USD	1	-1700	-1700	501	48a2e715-dbd3-b38e-8b84-759eaccaa0b1	6057	9804	c4bab2f9-3bbf-4f78-92c1-544ab6f0c831
2813	DEBIT	September Ruby Tuesday	-6497	USD	2016-10-31 14:11:36.488-07	2016-10-31 14:11:36.731-07	2	28	1042	\N	\N	\N	\N	\N	\N	USD	1	-6497	-6497	450	20b1093c-fba1-f588-0501-1b0e617e305c	6280	9804	2a06fa9f-dec4-489a-9862-b9a8d72b54e0
2939	DEBIT	Event Food	-6471	USD	2016-11-03 12:43:50.827-07	2016-11-03 12:43:51.096-07	59	171	1117	\N	\N	\N	\N	\N	\N	USD	1	-6471	-6471	377	fbaf09b1-9e1f-7350-e900-518e2d8acebc	6057	9804	4ebce1fe-0902-442e-b74f-44f6377bf78d
2842	DEBIT	Transportation to get to GeekWire Summit social event 	-729	USD	2016-11-01 09:16:02.625-07	2016-11-01 09:16:02.953-07	14	31	1044	\N	\N	\N	\N	\N	\N	USD	1	-729	-729	402	bdc04c5a-bcac-4a60-a10c-dbbfa26faf06	7538	9804	346123a4-0c7e-4d48-9929-e8ad5a7d2357
2941	DEBIT	Order for stickers of our official WWC Boulder/Denver chapter logo	-7800	USD	2016-11-03 12:45:23.582-07	2016-11-03 12:45:24.25-07	15	68	1117	\N	\N	\N	\N	\N	\N	USD	1	-7800	-7800	48	dfe11d53-7c3e-e44e-0fa3-fccc7c383dd1	8203	9804	af62ec42-ebeb-4e74-880c-466eb755c1e3
3794	DEBIT	Marketing for IoT Hackathon	-1082	USD	2016-12-06 08:50:56.549-08	2016-12-06 08:50:57.046-08	59	171	1191	\N	\N	\N	\N	\N	\N	USD	1	-1082	-1082	502	ddb49d78-3b62-76a0-e73a-e2a6b9b36060	6057	9804	e799e5c9-859f-4859-890a-70ff576de8d0
3796	DEBIT	T-shirt order - Design Lead	-2698	USD	2016-12-06 08:51:54.984-08	2016-12-06 08:51:55.379-08	59	171	1191	\N	\N	\N	\N	\N	\N	USD	1	-2698	-2698	509	a3df653e-0930-5c74-7156-b6a9df5a66ca	6057	9804	756d1311-662e-4408-a2c4-3601c4d4db5e
3234	DEBIT	Food (ATXDivHack)	-119954	USD	2016-11-18 13:01:43.887-08	2016-11-18 13:01:44.336-08	2	28	1189	\N	\N	\N	\N	\N	\N	USD	1	-119954	-119954	466	bae20172-8ac2-ce27-36fa-05e697c22464	6280	9804	9d5bf933-983a-4d92-9bcb-a52d30fe4fa1
6421	CREDIT	\N	30000	CAD	2017-02-27 16:25:20.325-08	2017-02-27 16:25:20.325-08	522	3301	2030	\N	\N	1935	1121	1120	523	USD	1.33832976445396135	22416	26301	\N	76f0dd42-dc90-3eff-778c-520722e99f9e	4726	9804	14232775-f1a0-4165-ac34-6b6913bb8fd6
613	DEBIT	Conference Grant	-120000	USD	2016-05-19 12:07:13.723-07	2017-11-02 14:23:29.202-07	12	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-120000	-120000	175	a994ab5c-5e1e-d1c0-fb04-339b09bc7e28	9804	9804	3fb98d8f-a89a-4780-82dd-48988538820b
1921	DEBIT	Event food	-3224	USD	2016-09-13 07:57:04.698-07	2016-09-13 07:57:05.111-07	59	171	573	\N	\N	\N	\N	\N	\N	USD	1	-3224	-3224	346	6ecf07c1-4de6-50ae-589c-269c6ac3b60c	6057	9804	3058320d-3999-44f0-9375-f673f6363056
2286	DEBIT	Event supplies	-2715	USD	2016-10-05 09:44:00.394-07	2016-10-05 09:44:00.521-07	59	171	573	\N	\N	\N	\N	\N	\N	USD	1	-2715	-2715	375	3894915d-2e38-5d3f-81bf-c2b64dcf3a3a	6057	9804	fe72efe1-5993-4aae-9c45-13944f70487c
2285	DEBIT	Event Food	-2077	USD	2016-10-05 09:43:28.448-07	2016-10-05 09:43:28.644-07	59	171	573	\N	\N	\N	\N	\N	\N	USD	1	-2077	-2077	374	93da60da-174c-08b9-4f4c-232a6c65dece	6057	9804	f7472dae-0e5b-4b33-a8c6-957dbafd1ccc
2287	DEBIT	Event Food	-7167	USD	2016-10-05 09:44:47.862-07	2016-10-05 09:44:48.013-07	59	171	573	\N	\N	\N	\N	\N	\N	USD	1	-7167	-7167	378	cc23b3e0-df61-467b-6505-16fffd3a4911	6057	9804	822a49fa-7a9c-4785-a7c1-abaeb50b8b29
2288	DEBIT	Marketing Materials	-2475	USD	2016-10-05 09:45:14.357-07	2016-10-05 09:45:14.485-07	59	171	573	\N	\N	\N	\N	\N	\N	USD	1	-2475	-2475	376	0ff9344e-44bb-04c0-f612-886f8df29734	6057	9804	a19f1d0f-8397-4c6f-9a70-7d37ee9e16d5
3332	DEBIT	Thank you cards, Christmas cards, stamps (for hackathon and all 2016 sponsors)	-4874	USD	2016-11-22 13:55:10.575-08	2016-11-22 13:55:10.713-08	59	171	1191	\N	\N	\N	\N	\N	\N	USD	1	-4874	-4874	498	091296e8-5be5-da82-f5e8-1dbeff8ad52f	6057	9804	8abdd907-aed0-4055-9590-e8326788c3dc
3793	DEBIT	We Code Hackathon 2016	-2374	USD	2016-12-06 08:50:34.842-08	2016-12-06 08:50:35.964-08	59	171	1191	\N	\N	\N	\N	\N	\N	USD	1	-2374	-2374	500	699e20c1-05c9-6f83-af36-2f8523f4b479	6057	9804	ab2263d4-c8f6-4f1e-878c-056d0b4f2961
3833	DEBIT	Goodie Bags	-1058	USD	2016-12-07 12:49:55.814-08	2016-12-07 12:49:56.33-08	59	171	1191	\N	\N	\N	\N	\N	\N	USD	1	-1058	-1058	573	be53168f-0916-a438-4f49-37750c973e77	6057	9804	f7967449-be8c-4821-b8e0-9ea3280de081
2799	DEBIT	Google DevFest event that WWC sponsored and attended. Two large banners. Table cloth. Plus my luggage since I went directly from airport. 	-1305	USD	2016-10-31 10:52:11.82-07	2016-10-31 10:52:12.734-07	14	31	1024	\N	\N	\N	\N	\N	\N	USD	1	-1305	-1305	427	c2a2ccbd-037c-0b4a-15a5-0902ce0b8eae	7538	9804	52c209e4-ac29-48cb-b15f-b3387c94b75e
2763	DEBIT	lunch ordered at Costco	-64978	USD	2016-10-28 14:30:59.537-07	2016-10-28 14:30:59.772-07	300	1371	1024	\N	\N	\N	\N	\N	\N	USD	1	-64978	-64978	418	a87d97bd-93bb-89d1-ac53-b50bd0022503	1060	9804	aa79946d-3549-463e-af31-b3ed07780d5c
66	CREDIT	Donation to WWCode Atlanta	1000	USD	2016-01-29 14:23:53.315-08	2016-04-16 13:40:58.701-07	12	30	39	\N	\N	13	0	50	59	USD	1	1000	891	\N	132c4eae-85bd-9de6-ea80-550c3a44d09e	2385	9804	907ff056-0f0a-46cf-b729-50a64cf1eb11
3841	DEBIT	Food/Drinks for Anniversary Reception with guest WWCode Directors!	-4400	USD	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	273	1325	\N	\N	\N	\N	\N	\N	\N	USD	1	-4400	-4444	486	8f3deb1b-7a02-a86a-bdcb-f12ab31a909f	3210	9804	35d9d569-c5bc-4972-bbf7-6369ff406a60
3842	DEBIT	Food for Anniversary Reception	-700	USD	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	273	1325	\N	\N	\N	\N	\N	\N	\N	USD	1	-700	-713	492	cd7b2d77-00fa-999a-2c4f-2bce8ef055fe	3210	9804	67b008b7-f9ec-4fc0-9b03-fdd4e7e69745
3864	DEBIT	European Leadership Development Workshop -- Transportation, Flight	-4700	EUR	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	301	1378	\N	\N	\N	\N	\N	\N	\N	USD	1.07299999999999995	-5043	-4728	494	46f91118-6938-a30b-8527-cbc31c5b057e	5394	9804	0b285d79-47df-46cf-933e-fc3d519862fd
10560	DEBIT	Flights for Connect 2017	-13896	USD	2017-05-30 10:02:21.464-07	2017-05-30 10:02:21.464-07	59	171	\N	\N	\N	\N	\N	\N	0	USD	1	-13896	-13896	1055	17745124-4134-f9fe-6a3e-3ee720d47e85	6057	9804	572b5b42-00c5-4f08-bb54-b121ed04248e
8350	CREDIT	monthly recurring subscription	100	USD	2017-04-09 11:28:49.104-07	2017-04-09 11:28:49.104-07	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	54be9d8d-0ce6-771f-f220-c7a3e5d0223d	8638	9804	c9795eb6-8e70-4f34-b26e-5adedc2b3a6e
11311	CREDIT	monthly recurring subscription	1000	USD	2017-06-01 16:32:37.119-07	2017-06-01 16:32:37.119-07	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	dfd5c8b9-fcd5-0ab3-f27c-2e50adef9097	6616	9804	da79cd9d-222b-4434-b498-e9c35a121391
10559	DEBIT	Hotel - Connect 2017	-33534	USD	2017-05-30 10:00:20.777-07	2017-05-30 10:00:20.777-07	59	171	\N	\N	\N	\N	\N	\N	0	USD	1	-33534	-33534	1056	f058731d-8ef6-ac16-2140-3796e619cb2c	6057	9804	4a4f531d-5576-4068-8c7c-e03a268077b7
10557	DEBIT	Small thank you gifts for workshop instructors,	-2085	USD	2017-05-30 09:54:12.717-07	2017-05-30 09:54:12.717-07	59	171	\N	\N	\N	\N	\N	\N	0	USD	1	-2085	-2085	967	f5a6eb58-23b1-6544-3d1e-a6e7e649e203	6057	9804	38036c55-d7a7-4d35-bba1-78683d72859f
3838	DEBIT	Food for monthly hack night from Antonino Bertolo's Pizza & Wine Bar.	-4300	USD	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	273	1325	\N	\N	\N	\N	\N	\N	\N	USD	1	-4300	-4351	483	7b934570-876b-8451-8849-2e9330c154d6	3210	9804	df571f07-0ebe-4aa1-b4e3-3baf02bb4294
2942	DEBIT	food/drink for organizers of NODE workshop (had to buy from on-site snack bar)	-2838	USD	2016-11-03 14:13:31.956-07	2016-11-03 14:13:32.241-07	12	70	1117	\N	\N	\N	\N	\N	\N	USD	1	-2838	-2838	409	8052f60c-d515-e783-75e9-ee0df4627a2a	1115	9804	abee04d8-a665-40cc-bfc8-897ed9f9c04c
7510	DEBIT	payment to artists (spoken word) for performance at IWD event	-20000	USD	2017-03-27 05:47:25.654-07	2017-03-27 05:47:25.894-07	12	70	2218	\N	\N	\N	\N	\N	610	USD	1	-20000	-20610	907	2016c4a5-361a-a06c-6501-5a733afdda22	1115	9804	5bfffa39-7f93-4ea9-b5aa-3f781ef59bec
474	CREDIT	Recurring subscription	100	USD	2016-05-02 15:49:03.545-07	2016-05-02 15:49:03.612-07	14	8	45	\N	\N	71	5	10	33	USD	1	100	52	\N	36fb30df-3588-8ce8-d279-3d97925762fc	8638	9804	e3777860-6e04-46fa-bf79-2c5d50f8dc9f
4230	DEBIT	Website - Domain Name	-2200	USD	2016-12-22 14:19:51.088-08	2016-12-22 14:19:52.143-08	48	142	1476	\N	\N	\N	\N	\N	\N	USD	1	-2200	-2200	372	830f8a4d-ecad-099f-12f8-78562c16121b	8492	9804	5d558ff7-08f0-4d1d-8a12-aa78c34199fb
3795	DEBIT	Supplies	-3918	USD	2016-12-06 08:51:20.162-08	2016-12-06 08:51:20.661-08	59	171	1191	\N	\N	\N	\N	\N	\N	USD	1	-3918	-3918	508	46b33ec4-ae64-536d-cda8-395a1aad8ea4	6057	9804	de4ac075-dd6a-4d16-8a78-51c697c77605
2396	DEBIT	Conference stipend Elizabeth M.	-75000	USD	2016-10-11 09:01:27.317-07	2016-10-11 09:01:28.351-07	195	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-75000	-75000	\N	e0baad49-cd44-2404-97e1-8f9d15c722ee	51	9804	5cc4b7a3-66ee-41a4-b42c-ecb7fb7e6097
1498	CREDIT	Recurring subscription	100	USD	2016-08-09 11:30:50.866-07	2016-08-09 11:30:50.915-07	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	84c5af1d-5860-f41b-2fb5-dc92916fe438	8638	9804	01d4b23d-64a5-4bb7-bc2b-d2b9d74ed4b3
10133	DEBIT	Supplies for decorating our robots	-9777	USD	2017-05-16 15:00:15.557-07	2017-05-16 15:00:15.557-07	48	142	\N	\N	\N	\N	\N	\N	0	USD	1	-9777	-9777	1085	00f979a0-feba-0a24-2148-405daa49bec2	8492	9804	62d6042a-51e1-4d28-a67a-dd6bb57d11e3
202	CREDIT	Recurring subscription	100	MXN	2016-03-15 13:05:22.15-07	2016-04-01 07:32:17.381-07	10	7	64	2016-04-07 07:32:17.381-07	\N	83	5	\N	\N	USD	0.0559730000000000019	6	\N	\N	33e3d06a-6ad4-43dc-ee5e-90cda3b12223	5788	9804	795fcbd2-f3ec-4e90-971a-22d9fcbac9e1
132	CREDIT	Recurring subscription	100	USD	2016-03-02 16:24:57.083-08	2016-04-16 13:40:58.834-07	13	2	46	\N	\N	72	5	10	33	USD	1	100	52	\N	4d72cd4b-57ba-7ad9-532c-bd1e14fe7e90	1729	9804	0145f60b-69bf-43b5-93b5-d0da31246c39
211	DEBIT	Order for stickers of our official WWC Boulder/Denver chapter logo	-7800	USD	2016-03-17 20:23:34.628-07	2016-06-14 11:14:21.77-07	15	68	\N	2016-06-14 11:14:22.448-07	\N	\N	\N	\N	\N	USD	1	-7800	-7800	48	8ff0478d-55d6-7ce6-21f7-e5e76c69fe62	8203	9804	c2267b92-0081-4b21-b098-1a285939732a
254	DEBIT	WwConnect2016	-1025	USD	2016-03-19 17:00:00-07	2016-06-14 11:14:21.806-07	14	31	26	\N	\N	\N	\N	\N	\N	USD	1	-1025	-1025	64	44f0373c-a43a-598c-72bb-cf42a7718ef9	7538	9804	042fecaf-c734-455f-8728-ade6b18293e3
5285	DEBIT	Amazon Echo Dot devices for HackNight and first book for our book club.	-22137	USD	2017-01-25 10:44:31.311-08	2017-01-25 10:44:33.251-08	48	142	1718	\N	\N	\N	\N	\N	\N	USD	1	-22137	-22137	725	8f42cb56-5816-fdc7-3ddd-c8ec4eb25618	8492	9804	c5615387-acf0-467c-86df-229a5e450450
407	CREDIT	Mary Griffus	1000	USD	2016-04-26 21:41:38.126-07	2016-04-26 21:41:38.474-07	13	3	\N	\N	\N	\N	\N	\N	\N	USD	1	1000	1000	\N	356f2bec-87f7-23b7-baf3-bbec31aa52db	9804	9804	55fc8561-59c7-4c8a-868c-735f5adc7340
1631	DEBIT	Coding books for our study groups (Humble Bundle -- Joy of Coding)	-1500	USD	2016-08-19 13:58:54.527-07	2016-08-19 13:58:54.67-07	48	142	573	\N	\N	\N	\N	\N	\N	USD	1	-1500	-1500	318	18f56f87-9d4b-1a80-bae3-2863c2ed9964	8492	9804	b416ed44-80d8-4448-9765-e45fa31ea086
2110	DEBIT	Two VR headsets for our AR/VR event at Best Buy.	-4898	USD	2016-09-27 12:31:43.164-07	2016-09-27 12:31:43.42-07	48	142	573	\N	\N	\N	\N	\N	\N	USD	1	-4898	-4898	366	9b85c552-5298-a529-63bd-a6e315c0b3fc	8492	9804	3867a1aa-3a72-4d45-99f3-d96e0d5d419a
2111	DEBIT	My coworker donated his evening to giving demos of his personal Oculus Rift for our AR/VR event, so I sent him a gift card to thank him for his help with the event.	-2500	USD	2016-09-27 12:33:54.08-07	2016-09-27 12:33:54.272-07	48	142	573	\N	\N	\N	\N	\N	\N	USD	1	-2500	-2500	367	2e1e1461-176c-9e05-107a-64a428579a00	8492	9804	f76d22f1-5c0f-4691-83c0-d4c309065a50
2946	DEBIT	Conference Travel	-53720	USD	2016-11-03 14:27:22.46-07	2016-11-03 14:27:22.847-07	48	142	1117	\N	\N	\N	\N	\N	\N	USD	1	-53720	-53720	333	634d30bb-f142-20be-3519-f433a9702626	8492	9804	c0d30f3d-546a-4976-9bb7-d085db328e54
2805	DEBIT	Food for JavaScript Study Night - Oct. 11th	-1446	USD	2016-10-31 11:19:11.822-07	2016-10-31 11:19:12.067-07	59	171	1024	\N	\N	\N	\N	\N	\N	USD	1	-1446	-1446	419	9d259358-e03e-841d-0e31-3776db99460b	6057	9804	56f059d2-8e3b-4f6f-8458-9407e82b4454
841	DEBIT	May expense: Travel and expense costs for mentoring at StartUp Weekend, Meeting w Northeeastern University for future WWC events 	-5161	USD	2016-06-06 17:21:31.531-07	2016-06-14 11:14:22.165-07	14	31	320	\N	\N	\N	\N	\N	\N	USD	1	-5161	-5161	218	9a776eb6-180b-cc74-bb25-4e9b26e9bd26	7538	9804	d71ad632-1800-4e6c-be28-68a9b006e8c3
290	CREDIT	Recurring subscription	100	USD	2016-04-02 19:02:46.616-07	2016-04-16 13:40:58.82-07	14	8	45	\N	\N	71	5	10	33	USD	1	100	52	\N	6a6ac44f-bf21-c7d6-78c3-1970ed9ffcfc	8638	9804	84501d0c-6a97-4edb-bb98-5d21d2585bf0
5017	CREDIT	WWCode t-shirt sales	4397	USD	2017-01-17 19:20:52.226-08	2017-01-17 19:20:52.436-08	273	3	\N	\N	\N	\N	\N	\N	\N	USD	1	4397	4397	\N	20c57769-4199-2506-132e-85514ab102bf	9804	9804	6269c0e4-6e6c-4d3a-b737-7e98c6c03589
43	CREDIT	Donation to WWCode Mexico City	500	USD	2016-01-18 15:54:06.439-08	2016-04-16 13:40:58.672-07	10	2	34	\N	\N	65	25	50	45	USD	1	500	380	\N	d38f5ca1-5837-850c-0e7d-79c278338ed2	1729	9804	56e72bea-9fab-4195-a2a0-70b3420d0945
2307	CREDIT	Donation Pamela V.	4500	USD	2016-10-06 11:09:54.319-07	2016-10-06 11:09:54.357-07	13	3	\N	\N	\N	\N	\N	\N	\N	USD	1	4500	4500	\N	b1324bed-26c4-aca8-4d53-9e48fdceed26	9804	9804	51125e52-02c9-4f0c-81ba-59db269e6cb5
2244	CREDIT	Donation via Meetup	1203	USD	2016-10-04 09:46:07.882-07	2016-10-04 09:46:07.993-07	13	3	\N	\N	\N	\N	\N	\N	\N	USD	1	1203	1203	\N	4930467d-c9b1-0b6c-1da6-45bcd3f501bc	9804	9804	31e84643-ff36-4df3-bebc-0904319ab826
2522	CREDIT	from Code2040	90000	USD	2016-10-17 08:43:12.71-07	2016-10-17 08:43:13.113-07	2	3	\N	\N	\N	\N	\N	\N	\N	USD	1	90000	90000	\N	55211be7-ec57-dcc8-8783-5697566135ca	9804	9804	ec5ccd87-1583-483a-b0d2-0c6b45ca6f1d
4378	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 08:53:55.856-08	2016-12-27 08:53:55.969-08	275	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	fe961bb7-c2d4-3a50-c38b-971e1b1339a6	9804	9804	c45f62d2-1bde-4899-a52b-e3cfd862f6d3
69	CREDIT	Donation to WWCode Mexico City	500	MXN	2016-02-02 08:52:02.237-08	2016-04-16 13:40:58.703-07	10	80	42	\N	\N	68	1	2	16	USD	18.5100000000000016	27	148	\N	f47ca90c-602e-47d1-6424-16f8e7e36666	4356	9804	faa878f0-5331-411e-8e4f-72ee68f643c2
7198	CREDIT	WTM Google I/O Travel Stipend	50000	USD	2017-03-17 07:09:18.868-07	2017-03-17 07:09:18.344-07	195	3	\N	\N	\N	\N	\N	\N	\N	USD	1	50000	50000	\N	ea744a80-7f98-31a5-0cc6-2ec66f57db60	9804	9804	ab683102-5fc9-46e9-84dc-06d96f9596ab
4376	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 08:52:05.93-08	2016-12-27 08:52:06.061-08	274	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	d5d82764-f9b6-40a8-41d8-744e6e40806b	9804	9804	54249aae-74f3-4325-98f8-61ca4113d228
4432	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-28 07:57:55.359-08	2016-12-28 07:57:51.831-08	241	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	dc070921-674f-315c-9453-77eff26d7e8b	9804	9804	cb181af8-8d53-4dc1-85ef-9c81a14dd5cd
655	CREDIT	Women Techmaker WWcode Partnership Grant	100000	USD	2016-05-24 13:23:16.28-07	2016-05-24 13:23:16.552-07	3	3	\N	\N	\N	\N	\N	\N	\N	USD	1	100000	100000	\N	232691f1-71fd-8ee3-c3a4-9105496a7080	9804	9804	883fe211-e941-4314-b74b-9cd2fc7ad2f6
8619	CREDIT	\N	25000	MXN	2017-04-17 15:34:32.259-07	2017-04-17 15:34:32.259-07	511	3	\N	\N	\N	2487	0	0	0	USD	0.0537790000000000004	1344	25000	\N	c185e85b-0b3c-4278-2e8b-3e2216283b27	9804	9804	63ce69cf-689f-4d2e-a008-85321a30760a
2338	CREDIT	VMWare Network Support	195000	USD	2016-10-07 12:55:50.273-07	2016-10-07 12:55:50.509-07	300	3	\N	\N	\N	\N	\N	\N	\N	USD	1	195000	195000	\N	bdae43a4-c48f-f10f-f65b-68614f42fe2c	9804	9804	2bd8249f-7be5-403f-8b8b-eb72c5ff72d0
2298	CREDIT	Network Development (Stickers)	62984	USD	2016-10-06 08:49:44.329-07	2016-10-06 08:49:44.472-07	4	3	\N	\N	\N	\N	\N	\N	\N	USD	1	62984	62984	\N	7989ab1b-cc74-d378-6f4b-b5845cde9e4a	9804	9804	13049fde-52ae-4262-9d8a-f6717c437596
78	CREDIT	Donation to WWCode Washington DC	100	USD	2016-02-02 15:09:05.702-08	2016-04-16 13:40:58.699-07	13	2	46	\N	\N	72	5	10	33	USD	1	100	52	\N	ab66cdbb-397b-969d-d12b-584e78c1fe99	1729	9804	ec66686d-050d-413e-b960-86b90d48309a
289	CREDIT	Recurring subscription	100	USD	2016-04-02 18:49:19.352-07	2016-04-16 13:40:58.819-07	13	2	46	\N	\N	72	5	10	33	USD	1	100	52	\N	da7e311e-9d10-7827-3d82-88659e000aeb	1729	9804	0022f10b-0a85-46ea-b84c-102031562b96
278	CREDIT	Recurring subscription	100	USD	2016-04-02 11:13:51.122-07	2016-04-16 13:40:58.81-07	13	30	43	\N	\N	69	5	10	33	USD	1	100	52	\N	2bed80fd-fefe-9122-03b9-3639bca799a5	2385	9804	a8fb01a3-6044-4d7f-ad9f-f42f83dc0764
281	CREDIT	Recurring subscription	100	USD	2016-04-02 12:27:54.641-07	2016-04-16 13:40:58.809-07	13	30	44	\N	\N	70	5	10	33	USD	1	100	52	\N	60e0bd7b-b913-7e45-7522-8cc689d7d2e2	2385	9804	ebc27eca-79a8-494c-8f35-051b019e9568
4426	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-28 07:46:26.348-08	2016-12-28 07:46:22.824-08	300	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	056780c5-46ca-eae4-f20e-420daba9a94a	9804	9804	b7b1da0e-798c-4e0a-8a5a-1742dbae0116
4368	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 08:30:02.12-08	2016-12-27 08:30:02.272-08	15	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	7787385b-b113-85d0-c38a-f2b88fb65052	9804	9804	a770840c-0fde-4f6b-bff3-c1886fc346c8
2421	CREDIT	Donation Elizabeth B.	9000	USD	2016-10-11 17:22:08.455-07	2016-10-11 17:22:08.557-07	288	3	\N	\N	\N	\N	\N	\N	\N	USD	1	9000	9000	\N	53186638-94e1-a19d-3b8a-cacb0c41ec88	9804	9804	199ca534-43ec-4b48-91fb-11abf66c7465
2423	CREDIT	Network Development	19100	USD	2016-10-11 17:28:02.718-07	2016-10-11 17:28:03.121-07	284	3	\N	\N	\N	\N	\N	\N	\N	USD	1	19100	19100	\N	ee3e949f-6314-7ea7-4d1f-2be2293f327d	9804	9804	2f197592-90ef-4429-af63-eaaab6ee55e7
4363	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 08:14:47.836-08	2016-12-27 08:14:47.951-08	271	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	c9246ba9-c02c-94af-db5f-096d1233b7d8	9804	9804	4b110427-ee8f-4fa8-a881-5bfeb5506e79
4255	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 08:59:24.039-08	2016-12-23 08:59:24.291-08	263	3	\N	\N	\N	\N	\N	\N	\N	USD	1	6000	6000	\N	38cf022c-5dea-7c63-a42c-193d422d47e8	9804	9804	4bc4a0e7-b959-4478-acce-7c32321fca8f
2327	CREDIT	Google I/O conference stipend	102409	GBP	2016-10-07 06:10:42.97-07	2016-10-07 06:10:43.753-07	278	3	\N	\N	\N	\N	\N	\N	\N	USD	1.23290000000000011	126260	102409	\N	4b804482-ae97-c162-7bc1-52b21a76fa64	9804	9804	4c49a9aa-afe8-4ecc-b48f-c3200c5ae277
659	CREDIT	Women Techmaker WWCode Partnership Grant	20000	USD	2016-05-25 09:45:53.797-07	2016-05-25 09:45:54.045-07	48	3	\N	\N	\N	\N	\N	\N	\N	USD	1	20000	20000	\N	ea81d815-6d70-91fb-f2c9-89c487e4c0fe	9804	9804	4dd7b8ad-82c4-416f-a421-ea2d908af064
2397	CREDIT	Google I/O stipend	75000	USD	2016-10-11 09:01:42.326-07	2016-10-11 09:01:43.286-07	195	3	\N	\N	\N	\N	\N	\N	\N	USD	1	75000	75000	\N	532d9f7e-1271-46e4-ddb8-a8e7fb7501c2	9804	9804	4eee1a68-8d97-40e1-942a-c09daab156ca
3537	CREDIT	Global Development - thanks VMWare	50000	USD	2016-11-29 15:07:50.964-08	2016-11-29 15:07:51.154-08	289	3	\N	\N	\N	\N	\N	\N	\N	USD	1	50000	50000	\N	df4d4d15-0948-4906-0018-1fee227c9ebb	9804	9804	4f74bc04-4983-426a-8cf8-42f44ca0aafa
2299	CREDIT	Donations via Meetup	2823	USD	2016-10-06 08:53:38.156-07	2016-10-06 08:53:38.231-07	4	3	\N	\N	\N	\N	\N	\N	\N	USD	1	2823	2823	\N	927e120f-671c-e8bb-c368-cc34da797d49	9804	9804	51fa6f6b-e71a-42f3-b3f6-b33cc4d3e8af
3614	CREDIT	Leadership development - conference stipend Google I/O	130000	USD	2016-11-30 13:07:12.142-08	2016-11-30 13:07:12.419-08	241	3	\N	\N	\N	\N	\N	\N	\N	USD	1	130000	130000	\N	ef68c81d-96ec-8d83-3371-2220e929fdb9	9804	9804	89fa2124-e92c-4583-bda8-70932e1f7a96
3600	CREDIT	Banner	2000	USD	2016-11-30 10:40:32.021-08	2016-11-30 10:40:32.139-08	292	3	\N	\N	\N	\N	\N	\N	\N	USD	1	2000	2000	\N	53a5a472-08ad-9041-f990-798eaafd5c2b	9804	9804	8c1f344f-1fa3-436f-a1f3-f00c6a1c0e1f
3612	CREDIT	Network Development	20000	USD	2016-11-30 12:59:29.087-08	2016-11-30 12:59:29.921-08	280	3	\N	\N	\N	\N	\N	\N	\N	USD	1	20000	20000	\N	756eacfe-2bfd-e7d7-ba05-061b422e7191	9804	9804	8ca98a3a-33ab-4f9d-8513-bb972614b0ee
4394	DEBIT	Meetup Fees	-6000	MXN	2016-12-27 09:57:54.314-08	2017-11-02 14:23:32.373-07	282	3	\N	\N	\N	\N	\N	\N	\N	USD	0.0485049999999999995	-291	-6000	650	c00f46d0-ac21-2543-4ed1-95ebf348f7bd	9804	9804	f72ed6f5-76e3-4783-8871-3dee94e6d298
4396	DEBIT	Meetup Fees	-6000	MXN	2016-12-27 10:01:07.417-08	2017-11-02 14:23:32.401-07	10	3	\N	\N	\N	\N	\N	\N	\N	USD	0.0485049999999999995	-291	-6000	651	32a8bb2e-2751-a7fb-7871-9093aeea06b0	9804	9804	2bc65dbb-b463-4a05-bc44-ea8751cad59d
4398	DEBIT	Meetup Fees	-5700	EUR	2016-12-27 10:11:51.873-08	2017-11-02 14:23:32.43-07	283	3	\N	\N	\N	\N	\N	\N	\N	USD	1.04449999999999998	-5954	-5700	652	deb8dadf-e288-668e-12df-bd98fc9ef7ee	9804	9804	b9f20c65-62fa-4ea6-96ba-ef6e8f517096
4401	DEBIT	Meetup Fee	-6000	USD	2016-12-27 10:35:08.624-08	2017-11-02 14:23:32.46-07	284	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	653	f54923ce-1d80-b3cd-1ebc-c3c7886d4d1f	9804	9804	4cad7e70-31ed-4bc1-a5a2-ff65c61ee07c
4403	DEBIT	Meetup Fees	-6000	USD	2016-12-27 10:38:46.887-08	2017-11-02 14:23:32.496-07	59	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	654	3177d7e3-1899-6505-14e7-dbca3014c4ae	9804	9804	ea0e564e-f673-4aa3-a588-a195aab381ae
4433	DEBIT	Meetup Fees	-6000	USD	2016-12-28 07:58:50.078-08	2017-11-02 14:23:32.81-07	241	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	662	1599c29a-4315-a37e-62b9-aef4f16aaa78	9804	9804	5228a0ed-482f-407f-a609-e5a377431100
4436	DEBIT	Meetup Fees	-6000	CAD	2016-12-28 08:21:52.469-08	2017-11-02 14:23:32.84-07	291	3	\N	\N	\N	\N	\N	\N	\N	USD	0.736670000000000047	-4420	-6000	663	cc66f4be-fcae-9487-b8a4-c2293bd590ff	9804	9804	dd280431-642f-4c10-9794-94bd1dbb43df
4438	DEBIT	Meetup Fees	-6000	USD	2016-12-28 08:25:48.743-08	2017-11-02 14:23:32.871-07	48	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	664	8299624b-5485-1766-5bc6-be190705aae1	9804	9804	f3678491-93a3-4151-ade1-1fbd70c29bde
4440	DEBIT	Meetup Fees	-6000	USD	2016-12-28 08:28:15.901-08	2017-11-02 14:23:32.902-07	292	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-6000	-6000	665	b2efcc36-d214-2e9b-052a-6160bdfac6f8	9804	9804	d9179e6d-df9f-41f1-b767-8b7e4a1b0843
3972	DEBIT	3D Printer & Supplies	-30496	USD	2016-12-14 05:03:21.144-08	2016-12-14 05:03:21.949-08	48	142	1191	\N	\N	\N	\N	\N	\N	USD	1	-30496	-30496	591	e071548d-5d22-07e1-072f-e6d14c5366a2	8492	9804	f0d605e3-f80b-4474-8543-a0bf2be83a93
2416	CREDIT	Network support - thanks VMWare	200000	USD	2016-10-11 12:50:00.045-07	2016-10-11 12:50:00.312-07	262	3	\N	\N	\N	\N	\N	\N	\N	USD	1	200000	200000	\N	903dd103-6cc2-4c60-c0df-959942fb2009	9804	9804	33b9cf32-f5f7-42a3-be0c-75b5b0630099
3524	CREDIT	Network Budget Balance Pre Open Collective	310535	MXN	2016-11-29 14:28:03.065-08	2016-11-29 14:28:03.231-08	282	3	\N	\N	\N	5903	\N	\N	\N	USD	0.05627367011	17475	310535	\N	7186a82e-1856-56bc-b220-2de538d948bd	9804	9804	9ba10b01-47e8-4b9c-955c-7442b21fe208
4434	CREDIT	Global Development for Meetup Fee	6000	JPY	2016-12-28 08:00:53.27-08	2016-12-28 08:00:49.939-08	295	3	\N	\N	\N	\N	\N	\N	\N	USD	0.00849819999999999916	51	6000	\N	3c9754ef-fcd9-d6d9-66d7-c0f30052ba5f	9804	9804	1cf9393a-cb7a-42fe-8323-cbd6fd43dacd
\.


                                                                                                                                                                                                                                                                                                                                                                                                                              4029.dat                                                                                            0000600 0004000 0002000 00000065334 13212311737 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        3206	f273adb6794a59ff4c5de1b6286f0041@gmail.com	*****	*****	*****	2017-02-21 08:55:29.631-08	2017-05-16 09:49:19.822-07	\N	\N	*****	*****	\N	WWCode		\N	5903
4173	9eef7a9574c5e480cdabed9d928bc332@gmail.com	*****	*****	*****	2017-04-11 19:05:32.736-07	2017-04-11 19:06:03.772-07	\N	\N	*****	*****	\N	Anne	Brown	\N	4475
2906	706175d396a028f82557f1d8b85a43bd@gmail.com	*****	*****	*****	2017-02-01 09:30:43.176-08	2017-02-01 10:35:36.827-08	\N	\N	*****	*****	\N	\N	\N	\N	4881
4720	c3d3eb9fbc3fd48a78eaca11ba6be80c@gmail.com	*****	*****	*****	2017-05-09 11:14:19.572-07	2017-05-09 11:14:20.294-07	\N	\N	*****	*****	\N	Nicole	Giannone	\N	1586
1331	88b07715c4357f1a0e3c58a8cf05a7d9@gmail.com	*****	*****	*****	2016-09-29 11:10:43.391-07	2017-03-27 22:13:36.913-07	\N	\N	*****	*****	\N	Chee	Yim Goh	\N	5791
74	185e9667ac90d40586027a1c6b7bf492@gmail.com	*****	*****	*****	2016-01-29 15:19:36.407-08	2016-09-28 03:15:16.735-07	\N	\N	*****	*****	\N	Chantal		\N	4128
1325	d5b08af6ff925309c88c7be99d160858@gmail.com	*****	*****	*****	2016-09-29 11:06:00.962-07	2017-10-15 16:30:12.977-07	\N	\N	*****	*****	\N	Pamela	Wood Browne	\N	3210
4843	5a206f2c54a58c9868430b0eaf0389c7@gmail.com	*****	*****	*****	2017-05-15 09:21:27.312-07	2017-05-15 10:06:05.001-07	\N	\N	*****	*****	\N	Stella	Kim	\N	4989
4153	7f56c05548a8c4a84caf1b1084ef66d2@gmail.com	*****	*****	*****	2017-04-10 18:09:47.41-07	2017-04-10 18:09:51.31-07	\N	\N	*****	*****	\N	Nikko	Patten	\N	7368
3419	9bc47c609bb5ad22d1a29f9566c28b21@gmail.com	*****	*****	*****	2017-03-07 11:01:52.704-08	2017-03-07 11:02:04.53-08	\N	\N	*****	*****	\N	Erin	Spiceland	\N	3898
3301	d861eda80ba20387a54b94ee33cd3d0c@gmail.com	*****	*****	*****	2017-02-27 16:25:15.503-08	2017-02-27 16:25:19.402-08	\N	\N	*****	*****	\N	Sue	Sinclair	\N	4726
7537	91638ce1fc758edc4b7b6fccd68e4445@gmail.com	*****	*****	*****	2017-09-19 16:54:14.846-07	2017-09-19 16:54:20.217-07	\N	\N	*****	*****	\N	Tzmanics	\N	\N	2170
1343	60465701e54c9a3022621f6fca281374@gmail.com	*****	*****	*****	2016-09-29 11:19:11.446-07	2017-08-19 10:23:42.095-07	\N	\N	*****	*****	\N	Andreza	Leite de Alencar	\N	3418
5616	25c03dc535ac6f2f8b26624e6acfbb50@gmail.com	*****	*****	*****	2017-06-26 05:59:53.458-07	2017-06-26 05:59:54.193-07	\N	\N	*****	*****	\N	Jennifer	Bland	\N	3440
3999	b69fc90130900934133fc782f0f39ce5@gmail.com	*****	*****	*****	2017-04-04 12:51:02.718-07	2017-04-04 12:51:03.29-07	\N	\N	*****	*****	\N	Allie	Winkelman	\N	2977
1329	8ddae0029c8aa9807de5d078fa4188f7@gmail.com	*****	*****	*****	2016-09-29 11:09:42.785-07	2016-09-29 11:09:42.785-07	\N	\N	*****	*****	\N	Dana	Dalling	\N	1037
1327	29ddcf74fe0ee6595f1467a511108ee7@gmail.com	*****	*****	*****	2016-09-29 11:08:19.487-07	2016-09-29 11:08:19.487-07	\N	\N	*****	*****	\N	Karen	Farzam	\N	2319
7542	cf361c9bc87911c1d722b2584d2ec0e2@gmail.com	*****	*****	*****	2017-09-19 18:48:29.74-07	2017-09-19 18:48:35.153-07	\N	\N	*****	*****	\N	Claire	Moss	\N	5599
1358	ca8a13a08ff94d25010ce92260248957@gmail.com	*****	*****	*****	2016-09-29 11:32:00.983-07	2016-09-29 11:32:00.983-07	\N	\N	*****	*****	\N	Laura	Scholl	\N	1650
1332	9c637ea4319d8e49f38b2ee7b57c375d@gmail.com	*****	*****	*****	2016-09-29 11:10:43.392-07	2017-03-20 09:33:13.852-07	\N	\N	*****	*****	\N	Jecelyn		\N	7243
1361	493d072089e730832d7d0cb101ca440c@gmail.com	*****	*****	*****	2016-09-29 11:33:37.095-07	2016-09-29 11:33:37.095-07	\N	\N	*****	*****	\N	Mami	Enomoto	\N	1477
1359	feb62fb34a2d2c301622ae769256ee93@gmail.com	*****	*****	*****	2016-09-29 11:33:37.087-07	2016-09-29 11:33:37.087-07	\N	\N	*****	*****	\N	Himi	Sato	\N	3529
1370	6f7ad1084a0eb726a11dc2d1430c9d86@gmail.com	*****	*****	*****	2016-09-29 11:38:54.951-07	2016-09-29 11:38:54.951-07	\N	\N	*****	*****	\N	Viv	Del Rio	\N	7312
36	ae410705abb11aede9db04632d575d1f@gmail.com	*****	*****	*****	2016-01-11 11:01:43.411-08	2016-02-15 14:33:12.306-08	\N	\N	*****	*****	\N	Dayra		\N	6017
7	5cb7e9982ece10951718a637421eac42@gmail.com	*****	*****	*****	2015-11-19 02:09:51.192-08	2017-04-12 13:22:46.946-07	\N	\N	*****	*****	\N	Marcela	Lango	\N	5788
34	6e825354c25de93e998e69f04e7d68e0@gmail.com	*****	*****	*****	2016-01-11 10:58:47.796-08	2016-01-11 10:58:47.796-08	\N	\N	*****	*****	\N	Kelly		\N	1781
37	b2ef7abb1ae0efd6f8234dcfbadb5b9a@gmail.com	*****	*****	*****	2016-01-11 11:02:41.058-08	2016-02-15 14:33:29.118-08	\N	\N	*****	*****	\N	Fernanda		\N	3441
1360	527a6f591aa4d4256258e160065fa759@gmail.com	*****	*****	*****	2016-09-29 11:33:37.088-07	2016-09-29 11:33:37.088-07	\N	\N	*****	*****	\N	Aya	Nakagawa	\N	7760
33	1d6ed080031a2dda5b45f4981dafcd28@gmail.com	*****	*****	*****	2016-01-11 10:57:18.467-08	2016-01-11 10:57:18.467-08	\N	\N	*****	*****	\N	Kaylyn		\N	2745
1362	25976859e49cd08a774f77dcef455fd4@gmail.com	*****	*****	*****	2016-09-29 11:34:59.499-07	2016-09-29 11:34:59.499-07	\N	\N	*****	*****	\N	Daphne	Chong	\N	3229
8512	6f2133e61be3fbfeaf20b1010570c65d@gmail.com	*****	*****	*****	2017-10-24 11:04:44.212-07	2017-10-24 11:04:44.304-07	\N	\N	*****	*****	\N	\N	\N	\N	9451
1363	cc862933cbdf7ced62307d06fd1484d4@gmail.com	*****	*****	*****	2016-09-29 11:34:59.504-07	2016-09-29 11:34:59.504-07	\N	\N	*****	*****	\N	Lucy	Bain	\N	6930
71	a98ddb2b8274e1daa406571cf628637d@gmail.com	*****	*****	*****	2016-01-29 15:19:12.899-08	2016-09-28 03:15:16.707-07	\N	\N	*****	*****	\N	Brenda		\N	8429
108	05b45a8fec6fe3920be5f3a08f068bba@gmail.com	*****	*****	*****	2016-02-18 11:54:08.5-08	2016-09-28 03:15:16.811-07	\N	\N	*****	*****	\N	Emily	Heist Moss	\N	8253
1364	0b76ea86b80b3fa637b6bff31d294d10@gmail.com	*****	*****	*****	2016-09-29 11:34:59.505-07	2016-09-29 11:34:59.505-07	\N	\N	*****	*****	\N	Peggy	Kuo	\N	8451
1328	1cedb1650e3e666334204f54a2b241ef@gmail.com	*****	*****	*****	2016-09-29 11:08:19.492-07	2016-09-29 11:08:19.492-07	\N	\N	*****	*****	\N	Michelle	Sun	\N	7288
1890	df02c99ce451262a6a393b6c4dd2e42b@gmail.com	*****	*****	*****	2016-11-28 07:33:11.726-08	2016-11-28 07:33:31.466-08	\N	\N	*****	*****	\N	Jamie	Lu	\N	6014
1365	e8e10f751f7254bccb052bf36ce564bf@gmail.com	*****	*****	*****	2016-09-29 11:37:07.337-07	2016-09-29 11:37:07.337-07	\N	\N	*****	*****	\N	Laura	Uzcátegui	\N	3031
1366	fe6c85dca8b3d6361e13dd7945db34bb@gmail.com	*****	*****	*****	2016-09-29 11:37:07.344-07	2016-09-29 11:37:07.344-07	\N	\N	*****	*****	\N	Vicky	Twomey-Lee	\N	2685
170	9ef42200ea39a3c8b9e06f533e883534@gmail.com	*****	*****	*****	2016-03-19 15:11:44.881-07	2016-03-19 15:11:44.881-07	\N	\N	*****	*****	\N	Paige	Hubbell	\N	3413
1368	bb6216b20b6a629e261ed3e638dc4136@gmail.com	*****	*****	*****	2016-09-29 11:38:54.934-07	2016-09-29 11:38:54.934-07	\N	\N	*****	*****	\N	Ana	Castro	\N	3353
686	675af9e989570cdee25c09412078feb5@gmail.com	*****	*****	*****	2016-07-01 15:31:42.541-07	2016-09-28 03:15:17.556-07	\N	\N	*****	*****	\N	\N	\N	\N	6616
1369	fb322eedc857a9b5c0aa76fce5ea22ea@gmail.com	*****	*****	*****	2016-09-29 11:38:54.935-07	2016-09-29 11:38:54.935-07	\N	\N	*****	*****	\N	Erika	Aguayo	\N	1900
1379	f07df3b09f910fff30cc5177a589db67@gmail.com	*****	*****	*****	2016-09-29 11:43:49.211-07	2016-09-29 11:43:49.211-07	\N	\N	*****	*****	\N	Aleksandra	Gavriloska	\N	3869
2898	6c187a69ea0a024e36c966aa0797ec4f@gmail.com	*****	*****	*****	2017-02-01 07:16:17.461-08	2017-02-01 07:16:17.461-08	\N	\N	*****	*****	\N	\N	\N	\N	2232
4834	8e4780814796cc93cbbe92ad8a8dac04@gmail.com	*****	*****	*****	2017-05-15 05:07:56.682-07	2017-05-15 05:09:17.931-07	\N	\N	*****	*****	\N	Brian	Vinci	\N	2984
1371	cf0cf5ceb5a0a89ba290fdb7fa4b9405@gmail.com	*****	*****	*****	2016-09-29 11:41:11.052-07	2016-09-29 11:41:11.052-07	\N	\N	*****	*****	\N	Guiti	Nabavi	\N	1060
1372	f3f13d6aa9ad89366841c9de889e35ff@gmail.com	*****	*****	*****	2016-09-29 11:41:11.058-07	2016-09-29 11:41:11.058-07	\N	\N	*****	*****	\N	Radhika	Rayadu	\N	4521
1378	3c83fec56632917462d7d78e8f028d84@gmail.com	*****	*****	*****	2016-09-29 11:43:49.205-07	2017-05-29 12:14:34.589-07	\N	\N	*****	*****	\N	Glenna	Buford	\N	5394
1373	3fbb01097397ff33f984c6efefaacfdc@gmail.com	*****	*****	*****	2016-09-29 11:41:11.058-07	2016-09-29 11:41:11.058-07	\N	\N	*****	*****	\N	Sonia	Prabhu	\N	7479
1335	7aec4a3d11163abf25e127a722562d85@gmail.com	*****	*****	*****	2016-09-29 11:12:58.838-07	2016-09-29 11:12:58.838-07	\N	\N	*****	*****	\N	Irina	Muchnik	\N	6674
1375	da04b8535e3140705dc97a77069e64e3@gmail.com	*****	*****	*****	2016-09-29 11:43:49.04-07	2016-09-29 11:43:49.04-07	\N	\N	*****	*****	\N	Anouk	Ruhaak	\N	5622
1311	fdc42afffa7c0dd8198f9426868e27de@gmail.com	*****	*****	*****	2016-09-29 10:53:00.502-07	2016-09-29 10:53:00.502-07	\N	\N	*****	*****	\N	Lucy	Shang	\N	6020
1376	fe5c8c00b52681ec629c20fd8f6e6a11@gmail.com	*****	*****	*****	2016-09-29 11:43:49.157-07	2016-09-29 11:43:49.157-07	\N	\N	*****	*****	\N	Carola	Nitz	\N	3271
67	ef17d2c6ab35e0a670731ca5de0b63b6@gmail.com	*****	*****	*****	2016-01-29 15:16:09.038-08	2016-09-28 03:15:16.707-07	\N	\N	*****	*****	\N	Nupur	Kapoor	\N	7099
4550	a8f64dd384346a6d56d33697d657db64@gmail.com	*****	*****	*****	2017-05-01 10:13:32.139-07	2017-05-01 10:13:35.793-07	\N	\N	*****	*****	\N	Lacey	Reinoehl	\N	1788
1339	294f7ed454d1328d15a4c530d8836a20@gmail.com	*****	*****	*****	2016-09-29 11:15:23.931-07	2017-07-10 16:12:46.704-07	\N	\N	*****	*****	\N	Grisel	Ancona	\N	4268
551	88ebb213c08ed1370ce0852a8403b6b2@gmail.com	*****	*****	*****	2016-06-06 12:04:33.418-07	2016-09-28 03:15:17.39-07	\N	\N	*****	*****	\N	Allison	Canestaro	\N	1442
1377	14b3bef349f69a027f2bafdabc9ec7c6@gmail.com	*****	*****	*****	2016-09-29 11:43:49.189-07	2016-09-29 11:43:49.189-07	\N	\N	*****	*****	\N	Silvia	Pina	\N	1804
1305	892d43bfa28414c15cfa2df2421eb5b4@gmail.com	*****	*****	*****	2016-09-29 10:44:40.429-07	2016-09-29 10:44:40.429-07	\N	\N	*****	*****	\N	Judith	Agbotse	\N	2028
1307	c4071cb98404650ec190ea81faed2c18@gmail.com	*****	*****	*****	2016-09-29 10:49:43.051-07	2016-09-29 10:49:43.051-07	\N	\N	*****	*****	\N	Fatma	Djoudjou	\N	5922
78	8e5acb6ad69fdecc88b9b1f0967103c1@gmail.com	*****	*****	*****	2016-01-29 15:20:00.061-08	2016-09-28 03:15:16.735-07	\N	\N	*****	*****	\N	Fanya		\N	1504
75	32f65d101aede93c22129bc14e5bb7d1@gmail.com	*****	*****	*****	2016-01-29 15:19:43.713-08	2016-09-28 03:15:16.708-07	\N	\N	*****	*****	\N	Gabriela	Adamova	\N	3994
1308	23006e8e8c74687ce0faf589d2d16318@gmail.com	*****	*****	*****	2016-09-29 10:49:43.061-07	2016-09-29 10:49:43.061-07	\N	\N	*****	*****	\N	Racha	Bella	\N	7531
1367	825698108453b324e731f826438df5e9@gmail.com	*****	*****	*****	2016-09-29 11:37:07.344-07	2016-09-29 11:37:07.344-07	\N	\N	*****	*****	\N	Christina	Lynch	\N	8042
72	9c4a740609a310e46710111b79a17905@gmail.com	*****	*****	*****	2016-01-29 15:19:22.243-08	2017-06-13 09:40:27.037-07	\N	\N	*****	*****	2017-06-13 09:40:27.036-07	Elizabeth	Ferrao	\N	5560
642	b4608ca43454a40bde54eef56dbb31f9@gmail.com	*****	*****	*****	2016-06-21 09:02:52.874-07	2016-09-28 03:15:17.476-07	\N	\N	*****	*****	\N	Joey	Rosenberg	\N	3533
1309	e69c6bc1ca494d98077db174abbcbede@gmail.com	*****	*****	*****	2016-09-29 10:51:29.333-07	2016-09-29 10:51:29.333-07	\N	\N	*****	*****	\N	Shwetha	Lakshman Rao	\N	6108
77	349ea7221b76bb3c312023c2c98ec2f6@gmail.com	*****	*****	*****	2016-01-29 15:19:53.922-08	2016-09-28 03:15:16.734-07	\N	\N	*****	*****	\N	Zoe	Madden-Wood	\N	8375
1310	214786f93d6b0ba35d41cdd09a4a596e@gmail.com	*****	*****	*****	2016-09-29 10:51:29.334-07	2016-09-29 10:51:29.334-07	\N	\N	*****	*****	\N	Smitha	Radhakrishnan	\N	2349
646	f1dcff1278b85c4b557c4389d65826ba@gmail.com	*****	*****	*****	2016-06-22 13:09:43.896-07	2016-09-28 03:15:17.513-07	\N	\N	*****	*****	\N	Lindsey	Barrett	\N	7263
1312	08c6b9ee5725d8921368769dc9532e0d@gmail.com	*****	*****	*****	2016-09-29 10:53:00.503-07	2016-09-29 10:53:00.503-07	\N	\N	*****	*****	\N	Xinhui	Li	\N	2383
31	78110f3c17a8e51a9638cb4c6f5c7d5f@gmail.com	*****	*****	*****	2016-01-11 10:53:43.73-08	2016-07-04 13:12:12.413-07	\N	\N	*****	*****	\N	Sandra		\N	7538
1314	a868760cf72d76bf7348d952606766e3@gmail.com	*****	*****	*****	2016-09-29 10:54:53.462-07	2016-09-29 10:54:53.462-07	\N	\N	*****	*****	\N	Sheree	Atcheson	\N	4788
1313	86ba2130228ecc009b5cecdef792ea5b@gmail.com	*****	*****	*****	2016-09-29 10:54:53.45-07	2016-09-29 10:54:53.45-07	\N	\N	*****	*****	\N	Gillian	Colan-O'Leary	\N	8030
70	3eed030ce6790da16dc514703a0041f6@gmail.com	*****	*****	*****	2016-01-29 15:18:53.83-08	2017-03-12 11:10:38.549-07	\N	\N	*****	*****	\N	beth	laing	\N	1115
1315	3bfbfd7c15b7ab5052bb60aa071315c9@gmail.com	*****	*****	*****	2016-09-29 10:58:16.63-07	2016-09-29 10:58:16.63-07	\N	\N	*****	*****	\N	Isabella	Oliveira	\N	2014
2549	76f6318af1c7a8ad6c0edb8fa86f5ef1@gmail.com	*****	*****	*****	2017-01-14 09:11:39.224-08	2017-02-22 16:10:36.94-08	\N	\N	*****	*****	\N	Eileen	C	\N	7262
1316	30d9e88377100d49da4ce71a77674cc6@gmail.com	*****	*****	*****	2016-09-29 10:59:15.428-07	2016-09-29 10:59:15.428-07	\N	\N	*****	*****	\N	Mia	Zhu	\N	4923
1317	24d6637174e1e08c1ed6e31789f35a31@gmail.com	*****	*****	*****	2016-09-29 11:01:04.636-07	2016-09-29 11:01:04.636-07	\N	\N	*****	*****	\N	Amber	Joyner	\N	6567
1318	5f0fa47a16d482069d9a067735a47555@gmail.com	*****	*****	*****	2016-09-29 11:01:04.636-07	2016-09-29 11:01:04.636-07	\N	\N	*****	*****	\N	Sally	Kingston	\N	4932
68	402188428323c6dce89fba709768df53@gmail.com	*****	*****	*****	2016-01-29 15:18:13.688-08	2016-09-28 03:15:17.148-07	\N	\N	*****	*****	\N	Rylee		\N	8203
3442	d5a06e73347a6f09b24b67b1bca7d1d6@gmail.com	*****	*****	*****	2017-03-09 10:29:51.939-08	2017-03-09 10:30:24.238-08	\N	\N	*****	*****	\N	Polson	& Polson, P.C.	\N	7809
1319	51cbe559870793032e8a8cb5f55aa854@gmail.com	*****	*****	*****	2016-09-29 11:01:49.703-07	2016-09-29 11:01:49.703-07	\N	\N	*****	*****	\N	Neha	Kaura	\N	3151
1321	7b0dfe49c62e6de3a9bfb03b3b6af518@gmail.com	*****	*****	*****	2016-09-29 11:02:54.555-07	2016-09-29 11:02:54.555-07	\N	\N	*****	*****	\N	Candice	Haddad	\N	3495
1320	3c1679182f521e8573bcc7be26f7764e@gmail.com	*****	*****	*****	2016-09-29 11:02:54.546-07	2016-09-29 11:02:54.546-07	\N	\N	*****	*****	\N	Amber	Houle	\N	4703
898	be200e9ee9f423d411e06e4d2caa479b@gmail.com	*****	*****	*****	2016-08-02 17:00:00-07	2016-08-02 17:00:00-07	\N	\N	*****	*****	\N	Casey	Gruppioni	\N	1734
4749	f834cdcae909f70ac61f9f9c60cea87c@gmail.com	*****	*****	*****	2017-05-10 16:45:43.307-07	2017-05-10 16:45:44.074-07	\N	\N	*****	*****	\N	Elijah	Van Der Giessen	\N	2804
1323	cd054f296c9aac144abb066170ecdb57@gmail.com	*****	*****	*****	2016-09-29 11:05:19.073-07	2016-09-29 11:05:19.073-07	\N	\N	*****	*****	\N	Maira	Bejamin	\N	2255
897	928f59072623644b2e34ff3cc57bf4b1@gmail.com	*****	*****	*****	2016-08-02 17:00:00-07	2017-04-17 09:41:26.051-07	\N	\N	*****	*****	\N	Radhika	Malik	\N	5439
1322	5cbd2972b747e6a673f9ea2ae21f5bee@gmail.com	*****	*****	*****	2016-09-29 11:03:46.798-07	2017-09-04 19:56:02.354-07	\N	\N	*****	*****	\N	Carole	Bennett	\N	8136
1324	eb856e11952228ec228bf0e9112d742f@gmail.com	*****	*****	*****	2016-09-29 11:05:19.079-07	2016-09-29 11:05:19.079-07	\N	\N	*****	*****	\N	Candace	Lazarou	\N	6808
1326	d84078f98b334b9d15743bd334b1c839@gmail.com	*****	*****	*****	2016-09-29 11:06:44.745-07	2016-09-29 11:06:44.745-07	\N	\N	*****	*****	\N	KeSha	Shah	\N	2929
1330	20a571fbd120711b37d05f0299886dbf@gmail.com	*****	*****	*****	2016-09-29 11:09:42.794-07	2016-09-29 11:09:42.794-07	\N	\N	*****	*****	\N	FJ	Genus	\N	1460
555	401a3ac1af7a9fddde8e13233cac0652@gmail.com	*****	*****	*****	2016-06-06 17:53:44.829-07	2016-09-28 03:15:17.29-07	\N	\N	*****	*****	\N	Shahnaz	Kamberi	\N	1848
1145	460b8ed5ec3e58689d8cc72e582c4359@gmail.com	*****	*****	*****	2016-09-07 15:13:23.624-07	2016-09-28 03:15:18.184-07	\N	\N	*****	*****	\N	Jane	Shih	\N	3917
1158	9b77e12d2e34b73c29281af16f21c5e6@gmail.com	*****	*****	*****	2016-09-09 20:42:48.933-07	2016-09-28 03:15:18.225-07	\N	\N	*****	*****	\N	Pieceofr		\N	6067
1334	40f3d76b56b1064f4b8d51bb022c4415@gmail.com	*****	*****	*****	2016-09-29 11:11:53.843-07	2016-09-29 11:11:53.843-07	\N	\N	*****	*****	\N	Vinita	Khandelwal Rathi	\N	2023
1336	de68d980ebb2b2b60787e8aec1b19bfd@gmail.com	*****	*****	*****	2016-09-29 11:12:58.852-07	2016-09-29 11:12:58.852-07	\N	\N	*****	*****	\N	Tiffany	Andrews	\N	2136
1337	bc702b9a63c34a45b6c05f6dd44bd37c@gmail.com	*****	*****	*****	2016-09-29 11:13:48.772-07	2016-09-29 11:13:48.772-07	\N	\N	*****	*****	\N	Isabel	Yepes	\N	5606
1338	f337282c7c6bc2eaf509d02c19762aff@gmail.com	*****	*****	*****	2016-09-29 11:14:46.606-07	2016-09-29 11:14:46.606-07	\N	\N	*****	*****	\N	Princy	James	\N	1368
1340	bc649faaffb583c14baf6d296c772204@gmail.com	*****	*****	*****	2016-09-29 11:16:17.115-07	2016-09-29 11:16:17.115-07	\N	\N	*****	*****	\N	Emily	Reese	\N	3492
1342	83fb03307c1c407be1e7200973eb60c9@gmail.com	*****	*****	*****	2016-09-29 11:17:47.289-07	2016-09-29 11:17:47.289-07	\N	\N	*****	*****	\N	Veronica	Cannon	\N	6283
6653	0ff47d39cf60925192e75ddc03523ade@gmail.com	*****	*****	*****	2017-08-15 17:24:32.881-07	2017-08-15 17:24:36.51-07	\N	\N	*****	*****	\N	Nina	Wilson	\N	2086
1345	2522320ffcfdbb2b48768b99b70df29a@gmail.com	*****	*****	*****	2016-09-29 11:24:17.802-07	2016-09-29 11:24:17.802-07	\N	\N	*****	*****	\N	Ashma	Sethi	\N	4595
1346	d87cd0b50a9244c07fb9f23ed827a1fd@gmail.com	*****	*****	*****	2016-09-29 11:24:17.81-07	2016-09-29 11:24:17.81-07	\N	\N	*****	*****	\N	Shruti	Sethi	\N	4542
1348	7747cfb9b216e12a28e77a0bb1dffe38@gmail.com	*****	*****	*****	2016-09-29 11:25:21.969-07	2016-09-29 11:25:21.969-07	\N	\N	*****	*****	\N	Roxane	Castelein	\N	2824
1347	aa32a18e9286ce9aeb3d03a0df3fb470@gmail.com	*****	*****	*****	2016-09-29 11:25:21.95-07	2016-09-29 11:25:21.95-07	\N	\N	*****	*****	\N	Marisol	Acuna	\N	7955
1349	d096072806ea6be0412ce3d893c89fd2@gmail.com	*****	*****	*****	2016-09-29 11:26:35.133-07	2016-09-29 11:26:35.133-07	\N	\N	*****	*****	\N	Qianyi	Zheng	\N	1190
73	9152cad9bec3004245ab27f3a4f716f5@gmail.com	*****	*****	*****	2016-01-29 15:19:28.648-08	2016-09-28 03:15:18.347-07	\N	\N	*****	*****	\N	Barbara		\N	5513
1353	2690400ab981ca2818949923b38354b1@gmail.com	*****	*****	*****	2016-09-29 11:28:54.276-07	2016-09-29 11:28:54.276-07	\N	\N	*****	*****	\N	Ria	Riaz	\N	2269
1351	4f7119c46d51f48f1b84959e3af121bf@gmail.com	*****	*****	*****	2016-09-29 11:28:08.47-07	2016-09-29 11:28:08.47-07	\N	\N	*****	*****	\N	Kathy	Trammell	\N	3851
1350	8bbb061b0205702a4200dc6589abe4bb@gmail.com	*****	*****	*****	2016-09-29 11:26:35.139-07	2016-09-29 11:26:35.139-07	\N	\N	*****	*****	\N	Yoka	Liu	\N	4847
392	959f0eaa7ccd38fbc66e93df5367838b@gmail.com	*****	*****	*****	2016-05-19 12:24:40.738-07	2016-09-28 03:15:18.36-07	\N	\N	*****	*****	\N	Travis	Swicegood	\N	1568
1244	420711929e9255ea0ee8c65617bff50f@gmail.com	*****	*****	*****	2016-09-20 13:58:49.633-07	2016-09-28 03:15:18.662-07	\N	\N	*****	*****	\N	Grain		\N	4301
1356	505cd94037cd46ece1ddfe3a9912d926@gmail.com	*****	*****	*****	2016-09-29 11:30:54.244-07	2016-09-29 11:30:54.244-07	\N	\N	*****	*****	\N	Dinah	Shi	\N	5975
1354	83e81f9be3765f8e548fafae0b40e7c1@gmail.com	*****	*****	*****	2016-09-29 11:30:08.971-07	2016-09-29 11:30:08.971-07	\N	\N	*****	*****	\N	Ksenia	Barshchyk	\N	1210
1352	d3867964f042fc9a1085c5431c7baf8c@gmail.com	*****	*****	*****	2016-09-29 11:28:08.475-07	2017-09-26 17:08:37.095-07	\N	\N	*****	*****	\N	Sarrah	Vesselov	\N	3042
1357	971159faeb2a2d422f182c9c2c98cdad@gmail.com	*****	*****	*****	2016-09-29 11:32:00.979-07	2016-09-29 11:32:00.979-07	\N	\N	*****	*****	\N	Britten	Kuckelman	\N	3483
1355	7f058d2bac58659d5ec989955a895bdf@gmail.com	*****	*****	*****	2016-09-29 11:30:08.978-07	2016-09-29 11:30:08.978-07	\N	\N	*****	*****	\N	Oksana	Denesiuk	\N	5334
1446	92e0e5d0c9a9bc7fbe4aa4ba8e7677cf@gmail.com	*****	*****	*****	2016-10-07 09:49:14.297-07	2016-10-07 09:49:50.24-07	\N	\N	*****	*****	\N	Wei-Juin	Lin	\N	5180
1438	deab0618203a611df9e80b349c83d587@gmail.com	*****	*****	*****	2016-10-06 11:36:34.986-07	2016-10-06 11:37:42.185-07	\N	\N	*****	*****	\N	Hector	Torres	\N	8045
6656	44cfee556b690e7e24e10b4f377bc9e9@gmail.com	*****	*****	*****	2017-08-15 18:57:30.922-07	2017-08-15 18:57:31.419-07	\N	\N	*****	*****	\N	Christina	Williams	\N	3919
4711	ddac794592ab5afcd32d444ee13ef9e1@gmail.com	*****	*****	*****	2017-05-08 22:59:11.628-07	2017-05-08 22:59:13.896-07	\N	\N	*****	*****	\N	Kristine	Paas	\N	3178
1957	0b84de324a15a6f924fa5133382dea59@gmail.com	*****	*****	*****	2016-11-30 08:11:38.749-08	2016-11-30 08:12:01.534-08	\N	\N	*****	*****	\N	Maddy	Lau	\N	4960
2416	bdd285c300fdb6abba71818a230ba0cd@gmail.com	*****	*****	*****	2017-01-03 12:59:33.995-08	2017-01-03 12:59:33.995-08	\N	\N	*****	*****	\N	Kelly	Erickson	\N	3538
1374	0d72e47cec16ec566abc0d5483f4ee2b@gmail.com	*****	*****	*****	2016-09-29 11:41:11.059-07	2017-12-05 11:52:52.49-08	\N	\N	*****	*****	\N	Snehal	Patil	\N	8405
9296	7aa69ebc975d86583d027a162bf64fc8@gmail.com	*****	*****	*****	2017-11-28 09:54:46.357-08	2017-12-02 02:38:04.64-08	\N	\N	*****	*****	\N	Dionne 	Toussaint	\N	10660
1304	b155be20c8a360661ab9b5e5e59793fd@gmail.com	*****	*****	*****	2016-09-29 10:44:40.419-07	2016-12-29 10:39:36.018-08	\N	\N	*****	*****	\N	Afia	Owusu-Forfie	\N	1811
126	a4fd48c5d3e32cf47a4703a51dd11e6a@gmail.com	*****	*****	*****	2016-03-01 20:41:59.905-08	2016-12-01 12:04:48.511-08	\N	\N	*****	*****	\N	Alaina	Percival	\N	4228
2431	e66f5a107ee8007af86f0169ee718e9e@gmail.com	*****	*****	*****	2017-01-03 16:00:00-08	2017-08-10 09:00:44.328-07	\N	\N	*****	*****	\N	Nataliia	Ilchenko	\N	3980
1303	0bd7d643be174b5f3215b80b59fe10fe@gmail.com	*****	*****	*****	2016-09-29 10:43:14.052-07	2016-11-22 23:21:46.01-08	\N	\N	*****	*****	\N	Shirley	Hicks	\N	5251
2561	a5a90327ec20b12256cc22294e80b7ff@gmail.com	*****	*****	*****	2017-01-16 10:03:53.479-08	2017-01-16 10:03:53.479-08	\N	\N	*****	*****	\N	Amanda	Folson	\N	8146
2220	9d489e39fe2013175a113095a03082c9@gmail.com	*****	*****	*****	2016-12-18 17:41:26.473-08	2017-01-06 23:47:05.144-08	\N	\N	*****	*****	\N	Cameron	🐳✨	\N	1831
1344	4acd835591304143a68a278bee207ac4@gmail.com	*****	*****	*****	2016-09-29 11:19:11.45-07	2017-05-29 17:46:09.055-07	\N	\N	*****	*****	\N	Karina		\N	6285
2594	cbdb678e89fd7bbaa2649fcc6ab547b0@gmail.com	*****	*****	*****	2017-01-18 05:49:53.082-08	2017-12-03 08:57:46.507-08	\N	\N	*****	*****	\N	Tamouse	Temple	\N	3116
35	2f92d2130ec1edd904f8a2ccc0f387fc@gmail.com	*****	*****	*****	2016-01-11 10:59:41.948-08	2017-07-06 15:38:20.374-07	\N	\N	*****	*****	\N	Erica		\N	5849
896	6ba6e92c80b1e203f4edbd535c0cb9e9@gmail.com	*****	*****	*****	2016-08-03 10:47:13.173-07	2017-07-19 14:22:47.568-07	\N	\N	*****	*****	\N	Geoff	Domoracki	\N	8290
32	9fdf9277100ae1df1b16cab1afd1e740@gmail.com	*****	*****	*****	2016-01-11 10:54:33.296-08	2017-08-07 23:01:47.429-07	\N	\N	*****	*****	\N	Saranya	Karuppusamy	\N	6353
5256	2579e3c2764a73c9adff5eaf48b6649d@gmail.com	*****	*****	*****	2017-06-07 03:44:36.582-07	2017-06-07 03:44:46.788-07	\N	\N	*****	*****	\N	юлія	навка	\N	8319
6604	bd00883e9841746fec4c6732bd4d0d74@gmail.com	*****	*****	*****	2017-08-14 14:46:20.881-07	2017-08-14 14:46:48.562-07	\N	\N	*****	*****	\N	Nah		\N	7701
577	cfc925a705ebbae4b5758a21bece2e65@gmail.com	*****	*****	*****	\N	2017-08-31 11:30:46.738-07	\N	\N	*****	*****	\N	Georgia	Andrews	\N	3845
6100	bbb2e1d78fb776fee5dbd4c92043f52e@gmail.com	*****	*****	*****	2017-07-16 20:18:20.74-07	2017-07-16 20:19:22.865-07	\N	\N	*****	*****	\N	Eric	Keathley	\N	4802
5267	19cd60ed4add8fd4107729cb5d6e0dc1@gmail.com	*****	*****	*****	2017-06-07 09:24:53.498-07	2017-06-07 09:24:53.93-07	\N	\N	*****	*****	\N	Rachel	C	\N	2300
8	df3f98c846a320fcc022f27954d54163@gmail.com	*****	*****	*****	2015-11-30 12:20:11.257-08	2017-11-03 12:23:15.224-07	\N	\N	*****	*****	\N	Aseem	Sood	\N	8638
5939	dee24f8bfed7ab7b2a51acadfca4d731@gmail.com	*****	*****	*****	2017-07-08 12:45:50.65-07	2017-07-08 12:46:12.123-07	\N	\N	*****	*****	\N	Jordan	McBride	\N	4707
1333	da7761fec57d05e6182a7f866eccb793@gmail.com	*****	*****	*****	2016-09-29 11:11:53.842-07	2017-09-06 11:27:06.46-07	\N	\N	*****	*****	\N	Gen	Ashley	\N	8487
1341	9178940f018a94dce6537350a038f3c6@gmail.com	*****	*****	*****	2016-09-29 11:16:52.099-07	2017-08-31 15:15:08.193-07	\N	\N	*****	*****	\N	Jennifer 	Carlson	\N	2405
7136	ba7b59fe544e60984cc48b6d6a605c9e@gmail.com	*****	*****	*****	2017-09-08 04:51:35.448-07	2017-11-01 18:33:30.044-07	\N	\N	*****	*****	\N	Fair	Inso	\N	3022
7079	97947527fbc815122b42d9144aef907b@gmail.com	*****	*****	*****	2017-09-06 18:04:11.287-07	2017-09-06 20:41:17.417-07	\N	\N	*****	*****	\N	Rachel	Minto	\N	7229
69	a399f1273a111e8fe5efc364f9e7413f@gmail.com	*****	*****	*****	2016-01-29 15:18:47.287-08	2017-09-29 06:59:37.335-07	\N	\N	*****	*****	\N	alicia		\N	5147
76	cc48b2653566814ec3e391d774db18a4@gmail.com	*****	*****	*****	2016-01-29 15:19:47.116-08	2017-08-22 12:33:18.483-07	\N	\N	*****	*****	\N	Rose	THERESA	\N	2245
7543	e6430e229fc8d14a9372ffed0fc49670@gmail.com	*****	*****	*****	2017-09-19 18:51:02.726-07	2017-09-20 09:42:18.272-07	\N	\N	*****	*****	\N	Tanika	Spates	\N	3056
171	c0ce59c544e4a77a145d3f0fbbf20836@gmail.com	*****	*****	*****	2016-03-19 15:11:53.101-07	2017-12-05 23:55:39.668-08	\N	\N	*****	*****	\N	Caterina	Paun	\N	6057
4285	0187d06563895a4c0817b622fd6b7efc@gmail.com	*****	*****	*****	2017-04-17 20:31:05.906-07	2017-09-21 14:23:43.468-07	\N	\N	*****	*****	\N	Stephanie	Nguyen	\N	4898
3825	abb2d67e78edde7544c5770708d8255a@gmail.com	*****	*****	*****	2017-03-29 18:47:22.813-07	2017-09-07 03:54:18.816-07	\N	\N	*****	*****	\N	Vanessa	Sampang	\N	4527
4921	bbd0c873035e385218c05a0b67ed1c1f@gmail.com	*****	*****	*****	2017-05-20 04:50:16.138-07	2017-10-14 22:16:19.71-07	\N	\N	*****	*****	\N	Abi	Aryan	\N	5783
80	3249c4d54e586e47cebcc1982f65b2d7@gmail.com	*****	*****	*****	2016-02-02 08:52:02.222-08	2017-09-25 23:40:37.478-07	\N	\N	*****	*****	\N	Maru	Lango	\N	4356
4283	e87a025da46a27ca7e32d6cfeca6a8a1@gmail.com	*****	*****	*****	2017-04-17 17:52:23.452-07	2017-09-08 08:32:59.556-07	\N	\N	*****	*****	\N	Betty	Li	\N	2776
141	ff78fb2eb61bd0490e71851aa63d87c0@gmail.com	*****	*****	*****	2016-03-07 01:50:58.721-08	2017-08-06 14:00:03.284-07	\N	\N	*****	*****	\N	Jigyasa	Grover	\N	1204
3	6754e3b188e4a79781069788451c582e@gmail.com	*****	*****	*****	2015-11-19 02:07:53.479-08	2017-12-06 06:42:05.593-08	\N	\N	*****	*****	2017-03-01 21:58:23.993-08	WWCode		\N	9814
28	bbce7beadfe8fe68c36e85b18931fb8c@gmail.com	*****	*****	*****	2015-12-21 08:34:26.053-08	2017-10-23 06:22:23.803-07	\N	\N	*****	*****	\N	Holly		\N	6280
8410	722465df322446e33b2e2360be781c1b@gmail.com	*****	*****	*****	2017-10-19 08:22:05.383-07	2017-10-19 08:22:05.518-07	\N	\N	*****	*****	\N	\N	\N	\N	9308
9152	c26d96d4cc56410246d88ee2e9be4002@gmail.com	*****	*****	*****	2017-11-21 02:46:25.394-08	2017-11-21 02:46:25.423-08	\N	\N	*****	*****	\N	Kate	Ageenko	\N	10465
2	8ff91ffbb03890ca7bb97286653da941@gmail.com	*****	*****	*****	2015-11-05 05:44:30.93-08	2017-12-06 06:46:13.655-08	\N	\N	*****	*****	2016-03-03 16:07:14.176-08	Xavier	Damman	\N	1729
30	1fef3a25096ab770bd8c5f92715c26c3@gmail.com	*****	*****	*****	2016-01-09 13:31:01.954-08	2017-12-06 07:54:49.186-08	\N	\N	*****	*****	\N	pia	mancini	\N	2385
8430	98b187467a0af73c8584723480f4c5b9@gmail.com	*****	*****	*****	2017-10-20 07:35:50.312-07	2017-10-20 07:35:50.369-07	\N	\N	*****	*****	\N	Nathan	Selvidge	\N	9333
8432	4b32c86175e482e5174d51bc943767c5@gmail.com	*****	*****	*****	2017-10-20 08:17:09.178-07	2017-10-20 08:17:09.306-07	\N	\N	*****	*****	\N	Semyon	Feldman	\N	9335
142	428875e595bc3341657bfa1e30d1d402@gmail.com	*****	*****	*****	2016-03-07 01:51:08.328-08	2017-12-04 07:23:23.217-08	\N	\N	*****	*****	\N	Sarah	Olson	\N	8492
\.


                                                                                                                                                                                                                                                                                                    3752.dat                                                                                            0000600 0004000 0002000 00000000005 13212311740 0014237 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           restore.sql                                                                                         0000600 0004000 0002000 00000155134 13212311740 0015367 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_CollectiveId_fkey";
ALTER TABLE ONLY public."Members" DROP CONSTRAINT "UserGroups_UserId_fkey";
ALTER TABLE ONLY public."Members" DROP CONSTRAINT "UserGroups_GroupId_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_UserId_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_HostCollectiveId_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_GroupId_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_FromCollectiveId_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_ExpenseId_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_DonationId_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_CardId_fkey";
ALTER TABLE ONLY public."Tiers" DROP CONSTRAINT "Tiers_GroupId_fkey";
ALTER TABLE ONLY public."Notifications" DROP CONSTRAINT "Subscriptions_UserId_fkey";
ALTER TABLE ONLY public."Notifications" DROP CONSTRAINT "Subscriptions_GroupId_fkey";
ALTER TABLE ONLY public."PaymentMethods" DROP CONSTRAINT "PaymentMethods_CollectiveId_fkey";
ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Orders_TierId_fkey";
ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Orders_FromCollectiveId_fkey";
ALTER TABLE ONLY public."Members" DROP CONSTRAINT "Members_TierId_fkey";
ALTER TABLE ONLY public."Members" DROP CONSTRAINT "Members_MemberCollectiveId_fkey";
ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Groups_lastEditedByUserId_fkey";
ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_lastEditedById_fkey";
ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_UserId_fkey";
ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_GroupId_fkey";
ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_UserId_fkey";
ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_SubscriptionId_fkey";
ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_PaymentMethodId_fkey";
ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_GroupId_fkey";
ALTER TABLE ONLY public."ConnectedAccounts" DROP CONSTRAINT "ConnectedAccounts_UserId_fkey";
ALTER TABLE ONLY public."ConnectedAccounts" DROP CONSTRAINT "ConnectedAccounts_GroupId_fkey";
ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Collectives_ParentCollectiveId_fkey";
ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Collectives_HostCollectiveId_fkey";
ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Collectives_CreatedByUserId_fkey";
ALTER TABLE ONLY public."CollectiveHistories" DROP CONSTRAINT "CollectiveHistories_ParentCollectiveId_fkey";
ALTER TABLE ONLY public."CollectiveHistories" DROP CONSTRAINT "CollectiveHistories_HostCollectiveId_fkey";
ALTER TABLE ONLY public."CollectiveHistories" DROP CONSTRAINT "CollectiveHistories_CreatedByUserId_fkey";
ALTER TABLE ONLY public."PaymentMethods" DROP CONSTRAINT "Cards_UserId_fkey";
ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_UserId_fkey";
ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_TransactionId_fkey";
ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_GroupId_fkey";
DROP INDEX public."type-tags";
DROP INDEX public.transactions_uuid;
DROP INDEX public.subscriptions_type__group_id__user_id;
DROP INDEX public."UniqueSlugIndex";
DROP INDEX public."Transactions_GroupId";
DROP INDEX public."PaymentMethodId";
DROP INDEX public."ParentCollectiveId";
DROP INDEX public."MemberCollectiveId-CollectiveId-role";
DROP INDEX public."DonationId";
DROP INDEX public."CollectiveId-type";
DROP INDEX public."CollectiveId-role";
DROP INDEX public."CollectiveId-deletedAt";
DROP INDEX public."CollectiveId-FromCollectiveId-type";
DROP INDEX public."CollectiveId";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT email_unique_idx;
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_pkey";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key";
ALTER TABLE ONLY public."Members" DROP CONSTRAINT "UserGroups_pkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_pkey";
ALTER TABLE ONLY public."Tiers" DROP CONSTRAINT "Tiers_pkey";
ALTER TABLE ONLY public."Subscriptions" DROP CONSTRAINT "Subscriptions_pkey1";
ALTER TABLE ONLY public."Notifications" DROP CONSTRAINT "Subscriptions_pkey";
ALTER TABLE ONLY public."Sessions" DROP CONSTRAINT "Sessions_pkey";
ALTER TABLE ONLY public."SequelizeMeta" DROP CONSTRAINT "SequelizeMeta_pkey";
ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Groups_pkey";
ALTER TABLE ONLY public."CollectiveHistories" DROP CONSTRAINT "GroupHistories_pkey";
ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_pkey";
ALTER TABLE ONLY public."ExpenseHistories" DROP CONSTRAINT "ExpenseHistories_pkey";
ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_pkey";
ALTER TABLE ONLY public."ConnectedAccounts" DROP CONSTRAINT "ConnectedAccounts_pkey";
ALTER TABLE ONLY public."PaymentMethods" DROP CONSTRAINT "Cards_pkey";
ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_pkey";
ALTER TABLE public."Users" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Transactions" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Tiers" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Subscriptions" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."PaymentMethods" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Orders" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Notifications" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Members" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Expenses" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."ExpenseHistories" ALTER COLUMN hid DROP DEFAULT;
ALTER TABLE public."ConnectedAccounts" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Collectives" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."CollectiveHistories" ALTER COLUMN hid DROP DEFAULT;
ALTER TABLE public."Activities" ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public."Users_id_seq";
DROP TABLE public."Users";
DROP SEQUENCE public."UserGroups_id_seq";
DROP SEQUENCE public."Transactions_id_seq";
DROP TABLE public."Transactions";
DROP SEQUENCE public."Tiers_id_seq";
DROP TABLE public."Tiers";
DROP SEQUENCE public."Subscriptions_id_seq1";
DROP SEQUENCE public."Subscriptions_id_seq";
DROP TABLE public."Subscriptions";
DROP TABLE public."Sessions";
DROP TABLE public."SequelizeMeta";
DROP TABLE public."Notifications";
DROP TABLE public."Members";
DROP SEQUENCE public."Groups_id_seq";
DROP SEQUENCE public."GroupHistories_hid_seq";
DROP SEQUENCE public."Expenses_id_seq";
DROP TABLE public."Expenses";
DROP SEQUENCE public."ExpenseHistories_hid_seq";
DROP TABLE public."ExpenseHistories";
DROP SEQUENCE public."Donations_id_seq";
DROP TABLE public."Orders";
DROP SEQUENCE public."ConnectedAccounts_id_seq";
DROP TABLE public."ConnectedAccounts";
DROP TABLE public."Collectives";
DROP TABLE public."CollectiveHistories";
DROP SEQUENCE public."Cards_id_seq";
DROP TABLE public."PaymentMethods";
DROP SEQUENCE public."Activities_id_seq";
DROP TABLE public."Activities";
DROP TYPE public."enum_UserGroups_role";
DROP TYPE public."enum_Groups_membership_type";
DROP EXTENSION postgis;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET search_path = public, pg_catalog;

--
-- Name: enum_Groups_membership_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_Groups_membership_type" AS ENUM (
    'donation',
    'monthlyfee',
    'yearlyfee'
);


--
-- Name: enum_UserGroups_role; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_UserGroups_role" AS ENUM (
    'admin',
    'writer',
    'viewer'
);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Activities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Activities" (
    id integer NOT NULL,
    type character varying(255),
    data json,
    "createdAt" timestamp with time zone,
    "CollectiveId" integer,
    "UserId" integer,
    "TransactionId" integer
);


--
-- Name: Activities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Activities_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Activities_id_seq" OWNED BY "Activities".id;


--
-- Name: PaymentMethods; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "PaymentMethods" (
    id integer NOT NULL,
    name character varying(255),
    token character varying(255),
    "customerId" character varying(255),
    service character varying(255) DEFAULT 'stripe'::character varying,
    data json,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "confirmedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "CreatedByUserId" integer,
    "expiryDate" timestamp with time zone,
    uuid uuid,
    "CollectiveId" integer,
    "archivedAt" timestamp with time zone,
    "monthlyLimitPerMember" integer,
    "primary" boolean DEFAULT false,
    currency character varying(3)
);


--
-- Name: Cards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Cards_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Cards_id_seq" OWNED BY "PaymentMethods".id;


--
-- Name: CollectiveHistories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "CollectiveHistories" (
    id integer,
    name character varying(255),
    description character varying(255),
    currency character varying(255),
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "isActive" boolean,
    "longDescription" text,
    image character varying(255),
    slug character varying(255),
    website character varying(255),
    "twitterHandle" character varying(255),
    mission character varying(255),
    "backgroundImage" character varying(255),
    "hostFeePercent" double precision,
    settings json,
    data json,
    tags character varying(255)[],
    "isSupercollective" boolean,
    "LastEditedByUserId" integer,
    hid bigint NOT NULL,
    "archivedAt" timestamp with time zone NOT NULL,
    "CreatedByUserId" integer,
    "HostCollectiveId" integer,
    "ParentCollectiveId" integer,
    type character varying(255) DEFAULT 'COLLECTIVE'::character varying,
    "startsAt" timestamp with time zone,
    "endsAt" timestamp with time zone,
    "locationName" character varying(255),
    address character varying(255),
    timezone character varying(255),
    "maxAmount" integer,
    "maxQuantity" integer,
    "geoLocationLatLong" geometry(Point),
    company character varying(255)
);


--
-- Name: Collectives; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Collectives" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    currency character varying(255) DEFAULT 'USD'::character varying,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "isActive" boolean DEFAULT false,
    "longDescription" text,
    image character varying(255),
    slug character varying(255),
    website character varying(255),
    "twitterHandle" character varying(255),
    mission character varying(128),
    "backgroundImage" character varying(255),
    "hostFeePercent" double precision,
    settings json,
    data json,
    tags character varying(255)[],
    "isSupercollective" boolean DEFAULT false,
    "LastEditedByUserId" integer,
    "CreatedByUserId" integer,
    "HostCollectiveId" integer,
    "ParentCollectiveId" integer,
    type character varying(255) DEFAULT 'COLLECTIVE'::character varying,
    "startsAt" timestamp with time zone,
    "endsAt" timestamp with time zone,
    "locationName" character varying(255),
    address character varying(255),
    timezone character varying(255),
    "maxAmount" integer,
    "maxQuantity" integer,
    "geoLocationLatLong" geometry(Point),
    company character varying(255)
);


--
-- Name: ConnectedAccounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "ConnectedAccounts" (
    id integer NOT NULL,
    service character varying(255),
    username character varying(255),
    "clientId" character varying(255),
    token character varying(255),
    data json,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "CreatedByUserId" integer,
    "CollectiveId" integer,
    "refreshToken" character varying(255)
);


--
-- Name: ConnectedAccounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "ConnectedAccounts_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ConnectedAccounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "ConnectedAccounts_id_seq" OWNED BY "ConnectedAccounts".id;


--
-- Name: Orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Orders" (
    id integer NOT NULL,
    "CreatedByUserId" integer,
    "CollectiveId" integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "totalAmount" integer,
    description character varying(255),
    "SubscriptionId" integer,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "PaymentMethodId" integer,
    "processedAt" timestamp with time zone,
    "privateMessage" text,
    "TierId" integer,
    "FromCollectiveId" integer,
    "publicMessage" character varying(255),
    quantity integer
);


--
-- Name: Donations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Donations_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Donations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Donations_id_seq" OWNED BY "Orders".id;


--
-- Name: ExpenseHistories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "ExpenseHistories" (
    id integer,
    "UserId" integer,
    "CollectiveId" integer,
    currency character varying(255),
    amount integer,
    description character varying(255),
    "payoutMethod" character varying(255),
    "privateMessage" text,
    attachment character varying(255),
    category character varying(255),
    vat integer,
    "lastEditedById" integer,
    status character varying(255),
    "incurredAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    hid bigint NOT NULL,
    "archivedAt" timestamp with time zone NOT NULL
);


--
-- Name: ExpenseHistories_hid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "ExpenseHistories_hid_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ExpenseHistories_hid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "ExpenseHistories_hid_seq" OWNED BY "ExpenseHistories".hid;


--
-- Name: Expenses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Expenses" (
    id integer NOT NULL,
    "UserId" integer,
    "CollectiveId" integer,
    currency character varying(255) NOT NULL,
    amount integer NOT NULL,
    description character varying(255) NOT NULL,
    "privateMessage" text,
    attachment character varying(255),
    category character varying(255),
    vat integer,
    "lastEditedById" integer,
    status character varying(255) DEFAULT 'PENDING'::character varying NOT NULL,
    "incurredAt" timestamp with time zone NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deletedAt" timestamp with time zone,
    "payoutMethod" character varying(255) NOT NULL
);


--
-- Name: Expenses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Expenses_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Expenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Expenses_id_seq" OWNED BY "Expenses".id;


--
-- Name: GroupHistories_hid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "GroupHistories_hid_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: GroupHistories_hid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "GroupHistories_hid_seq" OWNED BY "CollectiveHistories".hid;


--
-- Name: Groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Groups_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Groups_id_seq" OWNED BY "Collectives".id;


--
-- Name: Members; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Members" (
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "CreatedByUserId" integer NOT NULL,
    "CollectiveId" integer NOT NULL,
    role character varying(255) DEFAULT 'MEMBER'::character varying NOT NULL,
    id integer NOT NULL,
    description character varying(255),
    "MemberCollectiveId" integer,
    "TierId" integer
);


--
-- Name: Notifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Notifications" (
    id integer NOT NULL,
    channel character varying(255) DEFAULT 'email'::character varying,
    type character varying(255),
    active boolean DEFAULT true,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "UserId" integer,
    "CollectiveId" integer,
    "webhookUrl" character varying(255)
);


--
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "SequelizeMeta" (
    name character varying(255) NOT NULL
);


--
-- Name: Sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Sessions" (
    sid character varying(32) NOT NULL,
    expires timestamp with time zone,
    data text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: Subscriptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Subscriptions" (
    id integer NOT NULL,
    amount integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "interval" character varying(8) DEFAULT NULL::character varying,
    "isActive" boolean DEFAULT false,
    data json,
    "stripeSubscriptionId" character varying(255),
    "activatedAt" timestamp with time zone,
    "deactivatedAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone
);


--
-- Name: Subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Subscriptions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Subscriptions_id_seq" OWNED BY "Notifications".id;


--
-- Name: Subscriptions_id_seq1; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Subscriptions_id_seq1"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Subscriptions_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Subscriptions_id_seq1" OWNED BY "Subscriptions".id;


--
-- Name: Tiers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Tiers" (
    id integer NOT NULL,
    name character varying(255),
    description character varying(510),
    amount integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "maxQuantity" integer,
    password character varying(255),
    "startsAt" timestamp with time zone,
    "endsAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    slug character varying(255),
    "maxQuantityPerUser" integer,
    goal integer,
    type character varying(255) DEFAULT 'TICKET'::character varying,
    "CollectiveId" integer,
    "interval" character varying(8) DEFAULT NULL::character varying,
    button character varying(255),
    presets json
);


--
-- Name: Tiers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Tiers_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Tiers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Tiers_id_seq" OWNED BY "Tiers".id;


--
-- Name: Transactions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Transactions" (
    id integer NOT NULL,
    type character varying(255),
    description character varying(255),
    amount integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone NOT NULL,
    "CollectiveId" integer,
    "CreatedByUserId" integer,
    "PaymentMethodId" integer,
    "deletedAt" timestamp with time zone,
    data json,
    "OrderId" integer,
    "platformFeeInHostCurrency" integer,
    "hostFeeInHostCurrency" integer,
    "paymentProcessorFeeInHostCurrency" integer,
    "hostCurrency" character varying(255),
    "hostCurrencyFxRate" double precision,
    "amountInHostCurrency" integer,
    "netAmountInCollectiveCurrency" integer,
    "ExpenseId" integer,
    uuid uuid,
    "FromCollectiveId" integer,
    "HostCollectiveId" integer,
    "TransactionGroup" uuid
);


--
-- Name: Transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Transactions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Transactions_id_seq" OWNED BY "Transactions".id;


--
-- Name: UserGroups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "UserGroups_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: UserGroups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "UserGroups_id_seq" OWNED BY "Members".id;


--
-- Name: Users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Users" (
    id integer NOT NULL,
    email character varying(255),
    _salt character varying(255) DEFAULT '$2a$10$JqAcT6sBbBs5pO9FkwqLEu'::character varying,
    refresh_token character varying(255) DEFAULT '$2a$10$IHs8e8FdK1.bqjvZxr4Zvu'::character varying,
    password_hash character varying(255),
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "seenAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "paypalEmail" character varying(255),
    "resetPasswordTokenHash" character varying(255),
    "resetPasswordSentAt" timestamp with time zone,
    "firstName" character varying(128),
    "lastName" character varying(128),
    "billingAddress" character varying(255),
    "CollectiveId" integer
);


--
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Users_id_seq" OWNED BY "Users".id;


--
-- Name: Activities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Activities" ALTER COLUMN id SET DEFAULT nextval('"Activities_id_seq"'::regclass);


--
-- Name: CollectiveHistories hid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "CollectiveHistories" ALTER COLUMN hid SET DEFAULT nextval('"GroupHistories_hid_seq"'::regclass);


--
-- Name: Collectives id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Collectives" ALTER COLUMN id SET DEFAULT nextval('"Groups_id_seq"'::regclass);


--
-- Name: ConnectedAccounts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ConnectedAccounts" ALTER COLUMN id SET DEFAULT nextval('"ConnectedAccounts_id_seq"'::regclass);


--
-- Name: ExpenseHistories hid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ExpenseHistories" ALTER COLUMN hid SET DEFAULT nextval('"ExpenseHistories_hid_seq"'::regclass);


--
-- Name: Expenses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Expenses" ALTER COLUMN id SET DEFAULT nextval('"Expenses_id_seq"'::regclass);


--
-- Name: Members id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Members" ALTER COLUMN id SET DEFAULT nextval('"UserGroups_id_seq"'::regclass);


--
-- Name: Notifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Notifications" ALTER COLUMN id SET DEFAULT nextval('"Subscriptions_id_seq"'::regclass);


--
-- Name: Orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Orders" ALTER COLUMN id SET DEFAULT nextval('"Donations_id_seq"'::regclass);


--
-- Name: PaymentMethods id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "PaymentMethods" ALTER COLUMN id SET DEFAULT nextval('"Cards_id_seq"'::regclass);


--
-- Name: Subscriptions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Subscriptions" ALTER COLUMN id SET DEFAULT nextval('"Subscriptions_id_seq1"'::regclass);


--
-- Name: Tiers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Tiers" ALTER COLUMN id SET DEFAULT nextval('"Tiers_id_seq"'::regclass);


--
-- Name: Transactions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions" ALTER COLUMN id SET DEFAULT nextval('"Transactions_id_seq"'::regclass);


--
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Users" ALTER COLUMN id SET DEFAULT nextval('"Users_id_seq"'::regclass);


--
-- Data for Name: Activities; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Activities" (id, type, data, "createdAt", "CollectiveId", "UserId", "TransactionId") FROM stdin;
\.
COPY "Activities" (id, type, data, "createdAt", "CollectiveId", "UserId", "TransactionId") FROM '$$PATH$$/4001.dat';

--
-- Data for Name: CollectiveHistories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "CollectiveHistories" (id, name, description, currency, "createdAt", "updatedAt", "deletedAt", "isActive", "longDescription", image, slug, website, "twitterHandle", mission, "backgroundImage", "hostFeePercent", settings, data, tags, "isSupercollective", "LastEditedByUserId", hid, "archivedAt", "CreatedByUserId", "HostCollectiveId", "ParentCollectiveId", type, "startsAt", "endsAt", "locationName", address, timezone, "maxAmount", "maxQuantity", "geoLocationLatLong", company) FROM stdin;
\.
COPY "CollectiveHistories" (id, name, description, currency, "createdAt", "updatedAt", "deletedAt", "isActive", "longDescription", image, slug, website, "twitterHandle", mission, "backgroundImage", "hostFeePercent", settings, data, tags, "isSupercollective", "LastEditedByUserId", hid, "archivedAt", "CreatedByUserId", "HostCollectiveId", "ParentCollectiveId", type, "startsAt", "endsAt", "locationName", address, timezone, "maxAmount", "maxQuantity", "geoLocationLatLong", company) FROM '$$PATH$$/4005.dat';

--
-- Data for Name: Collectives; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Collectives" (id, name, description, currency, "createdAt", "updatedAt", "deletedAt", "isActive", "longDescription", image, slug, website, "twitterHandle", mission, "backgroundImage", "hostFeePercent", settings, data, tags, "isSupercollective", "LastEditedByUserId", "CreatedByUserId", "HostCollectiveId", "ParentCollectiveId", type, "startsAt", "endsAt", "locationName", address, timezone, "maxAmount", "maxQuantity", "geoLocationLatLong", company) FROM stdin;
\.
COPY "Collectives" (id, name, description, currency, "createdAt", "updatedAt", "deletedAt", "isActive", "longDescription", image, slug, website, "twitterHandle", mission, "backgroundImage", "hostFeePercent", settings, data, tags, "isSupercollective", "LastEditedByUserId", "CreatedByUserId", "HostCollectiveId", "ParentCollectiveId", type, "startsAt", "endsAt", "locationName", address, timezone, "maxAmount", "maxQuantity", "geoLocationLatLong", company) FROM '$$PATH$$/4006.dat';

--
-- Data for Name: ConnectedAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "ConnectedAccounts" (id, service, username, "clientId", token, data, "createdAt", "updatedAt", "deletedAt", "CreatedByUserId", "CollectiveId", "refreshToken") FROM stdin;
\.
COPY "ConnectedAccounts" (id, service, username, "clientId", token, data, "createdAt", "updatedAt", "deletedAt", "CreatedByUserId", "CollectiveId", "refreshToken") FROM '$$PATH$$/4007.dat';

--
-- Data for Name: ExpenseHistories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "ExpenseHistories" (id, "UserId", "CollectiveId", currency, amount, description, "payoutMethod", "privateMessage", attachment, category, vat, "lastEditedById", status, "incurredAt", "createdAt", "updatedAt", "deletedAt", hid, "archivedAt") FROM stdin;
\.
COPY "ExpenseHistories" (id, "UserId", "CollectiveId", currency, amount, description, "payoutMethod", "privateMessage", attachment, category, vat, "lastEditedById", status, "incurredAt", "createdAt", "updatedAt", "deletedAt", hid, "archivedAt") FROM '$$PATH$$/4011.dat';

--
-- Data for Name: Expenses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Expenses" (id, "UserId", "CollectiveId", currency, amount, description, "privateMessage", attachment, category, vat, "lastEditedById", status, "incurredAt", "createdAt", "updatedAt", "deletedAt", "payoutMethod") FROM stdin;
\.
COPY "Expenses" (id, "UserId", "CollectiveId", currency, amount, description, "privateMessage", attachment, category, vat, "lastEditedById", status, "incurredAt", "createdAt", "updatedAt", "deletedAt", "payoutMethod") FROM '$$PATH$$/4013.dat';

--
-- Data for Name: Members; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Members" ("createdAt", "updatedAt", "deletedAt", "CreatedByUserId", "CollectiveId", role, id, description, "MemberCollectiveId", "TierId") FROM stdin;
\.
COPY "Members" ("createdAt", "updatedAt", "deletedAt", "CreatedByUserId", "CollectiveId", role, id, description, "MemberCollectiveId", "TierId") FROM '$$PATH$$/4017.dat';

--
-- Data for Name: Notifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Notifications" (id, channel, type, active, "createdAt", "updatedAt", "UserId", "CollectiveId", "webhookUrl") FROM stdin;
\.
COPY "Notifications" (id, channel, type, active, "createdAt", "updatedAt", "UserId", "CollectiveId", "webhookUrl") FROM '$$PATH$$/4018.dat';

--
-- Data for Name: Orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Orders" (id, "CreatedByUserId", "CollectiveId", currency, "totalAmount", description, "SubscriptionId", "createdAt", "updatedAt", "deletedAt", "PaymentMethodId", "processedAt", "privateMessage", "TierId", "FromCollectiveId", "publicMessage", quantity) FROM stdin;
\.
COPY "Orders" (id, "CreatedByUserId", "CollectiveId", currency, "totalAmount", description, "SubscriptionId", "createdAt", "updatedAt", "deletedAt", "PaymentMethodId", "processedAt", "privateMessage", "TierId", "FromCollectiveId", "publicMessage", quantity) FROM '$$PATH$$/4009.dat';

--
-- Data for Name: PaymentMethods; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "PaymentMethods" (id, name, token, "customerId", service, data, "createdAt", "updatedAt", "confirmedAt", "deletedAt", "CreatedByUserId", "expiryDate", uuid, "CollectiveId", "archivedAt", "monthlyLimitPerMember", "primary", currency) FROM stdin;
\.
COPY "PaymentMethods" (id, name, token, "customerId", service, data, "createdAt", "updatedAt", "confirmedAt", "deletedAt", "CreatedByUserId", "expiryDate", uuid, "CollectiveId", "archivedAt", "monthlyLimitPerMember", "primary", currency) FROM '$$PATH$$/4003.dat';

--
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "SequelizeMeta" (name) FROM stdin;
\.
COPY "SequelizeMeta" (name) FROM '$$PATH$$/4019.dat';

--
-- Data for Name: Sessions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Sessions" (sid, expires, data, "createdAt", "updatedAt") FROM stdin;
\.
COPY "Sessions" (sid, expires, data, "createdAt", "updatedAt") FROM '$$PATH$$/4020.dat';

--
-- Data for Name: Subscriptions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Subscriptions" (id, amount, currency, "interval", "isActive", data, "stripeSubscriptionId", "activatedAt", "deactivatedAt", "createdAt", "updatedAt", "deletedAt") FROM stdin;
\.
COPY "Subscriptions" (id, amount, currency, "interval", "isActive", data, "stripeSubscriptionId", "activatedAt", "deactivatedAt", "createdAt", "updatedAt", "deletedAt") FROM '$$PATH$$/4021.dat';

--
-- Data for Name: Tiers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Tiers" (id, name, description, amount, currency, "maxQuantity", password, "startsAt", "endsAt", "createdAt", "updatedAt", "deletedAt", slug, "maxQuantityPerUser", goal, type, "CollectiveId", "interval", button, presets) FROM stdin;
\.
COPY "Tiers" (id, name, description, amount, currency, "maxQuantity", password, "startsAt", "endsAt", "createdAt", "updatedAt", "deletedAt", slug, "maxQuantityPerUser", goal, type, "CollectiveId", "interval", button, presets) FROM '$$PATH$$/4024.dat';

--
-- Data for Name: Transactions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Transactions" (id, type, description, amount, currency, "createdAt", "updatedAt", "CollectiveId", "CreatedByUserId", "PaymentMethodId", "deletedAt", data, "OrderId", "platformFeeInHostCurrency", "hostFeeInHostCurrency", "paymentProcessorFeeInHostCurrency", "hostCurrency", "hostCurrencyFxRate", "amountInHostCurrency", "netAmountInCollectiveCurrency", "ExpenseId", uuid, "FromCollectiveId", "HostCollectiveId", "TransactionGroup") FROM stdin;
\.
COPY "Transactions" (id, type, description, amount, currency, "createdAt", "updatedAt", "CollectiveId", "CreatedByUserId", "PaymentMethodId", "deletedAt", data, "OrderId", "platformFeeInHostCurrency", "hostFeeInHostCurrency", "paymentProcessorFeeInHostCurrency", "hostCurrency", "hostCurrencyFxRate", "amountInHostCurrency", "netAmountInCollectiveCurrency", "ExpenseId", uuid, "FromCollectiveId", "HostCollectiveId", "TransactionGroup") FROM '$$PATH$$/4026.dat';

--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Users" (id, email, _salt, refresh_token, password_hash, "createdAt", "updatedAt", "seenAt", "deletedAt", "paypalEmail", "resetPasswordTokenHash", "resetPasswordSentAt", "firstName", "lastName", "billingAddress", "CollectiveId") FROM stdin;
\.
COPY "Users" (id, email, _salt, refresh_token, password_hash, "createdAt", "updatedAt", "seenAt", "deletedAt", "paypalEmail", "resetPasswordTokenHash", "resetPasswordSentAt", "firstName", "lastName", "billingAddress", "CollectiveId") FROM '$$PATH$$/4029.dat';

--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: -
--

COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.
COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM '$$PATH$$/3752.dat';

--
-- Name: Activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Activities_id_seq"', 69776, true);


--
-- Name: Cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Cards_id_seq"', 8766, true);


--
-- Name: ConnectedAccounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"ConnectedAccounts_id_seq"', 1911, true);


--
-- Name: Donations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Donations_id_seq"', 6334, true);


--
-- Name: ExpenseHistories_hid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"ExpenseHistories_hid_seq"', 4239, true);


--
-- Name: Expenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Expenses_id_seq"', 2376, true);


--
-- Name: GroupHistories_hid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"GroupHistories_hid_seq"', 89123, true);


--
-- Name: Groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Groups_id_seq"', 10879, true);


--
-- Name: Subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Subscriptions_id_seq"', 33900, true);


--
-- Name: Subscriptions_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Subscriptions_id_seq1"', 4191, true);


--
-- Name: Tiers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Tiers_id_seq"', 2802, true);


--
-- Name: Transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Transactions_id_seq"', 50890, true);


--
-- Name: UserGroups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"UserGroups_id_seq"', 10408, true);


--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Users_id_seq"', 9473, true);


--
-- Name: Activities Activities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_pkey" PRIMARY KEY (id);


--
-- Name: PaymentMethods Cards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "PaymentMethods"
    ADD CONSTRAINT "Cards_pkey" PRIMARY KEY (id);


--
-- Name: ConnectedAccounts ConnectedAccounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ConnectedAccounts"
    ADD CONSTRAINT "ConnectedAccounts_pkey" PRIMARY KEY (id);


--
-- Name: Orders Donations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_pkey" PRIMARY KEY (id);


--
-- Name: ExpenseHistories ExpenseHistories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ExpenseHistories"
    ADD CONSTRAINT "ExpenseHistories_pkey" PRIMARY KEY (hid);


--
-- Name: Expenses Expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_pkey" PRIMARY KEY (id);


--
-- Name: CollectiveHistories GroupHistories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "CollectiveHistories"
    ADD CONSTRAINT "GroupHistories_pkey" PRIMARY KEY (hid);


--
-- Name: Collectives Groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Groups_pkey" PRIMARY KEY (id);


--
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: Sessions Sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Sessions"
    ADD CONSTRAINT "Sessions_pkey" PRIMARY KEY (sid);


--
-- Name: Notifications Subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Notifications"
    ADD CONSTRAINT "Subscriptions_pkey" PRIMARY KEY (id);


--
-- Name: Subscriptions Subscriptions_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Subscriptions"
    ADD CONSTRAINT "Subscriptions_pkey1" PRIMARY KEY (id);


--
-- Name: Tiers Tiers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Tiers"
    ADD CONSTRAINT "Tiers_pkey" PRIMARY KEY (id);


--
-- Name: Transactions Transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_pkey" PRIMARY KEY (id);


--
-- Name: Members UserGroups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "UserGroups_pkey" PRIMARY KEY (id);


--
-- Name: Users Users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_email_key" UNIQUE (email);


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- Name: Users email_unique_idx; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT email_unique_idx UNIQUE (email);


--
-- Name: CollectiveId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "CollectiveId" ON "Users" USING btree ("CollectiveId");


--
-- Name: CollectiveId-FromCollectiveId-type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "CollectiveId-FromCollectiveId-type" ON "Transactions" USING btree ("CollectiveId", "FromCollectiveId", "deletedAt");


--
-- Name: CollectiveId-deletedAt; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "CollectiveId-deletedAt" ON "Tiers" USING btree ("CollectiveId", "deletedAt");


--
-- Name: CollectiveId-role; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "CollectiveId-role" ON "Members" USING btree ("CollectiveId", role);


--
-- Name: CollectiveId-type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "CollectiveId-type" ON "Transactions" USING btree ("CollectiveId", type);


--
-- Name: DonationId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "DonationId" ON "Transactions" USING btree ("OrderId");


--
-- Name: MemberCollectiveId-CollectiveId-role; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "MemberCollectiveId-CollectiveId-role" ON "Members" USING btree ("MemberCollectiveId", "CollectiveId", role);


--
-- Name: ParentCollectiveId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "ParentCollectiveId" ON "Collectives" USING btree ("ParentCollectiveId");


--
-- Name: PaymentMethodId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "PaymentMethodId" ON "Orders" USING btree ("PaymentMethodId");


--
-- Name: Transactions_GroupId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Transactions_GroupId" ON "Transactions" USING btree ("CollectiveId", "deletedAt");


--
-- Name: UniqueSlugIndex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UniqueSlugIndex" ON "Collectives" USING btree (slug);


--
-- Name: subscriptions_type__group_id__user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX subscriptions_type__group_id__user_id ON "Notifications" USING btree (type, "CollectiveId", "UserId");


--
-- Name: transactions_uuid; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX transactions_uuid ON "Transactions" USING btree (uuid);


--
-- Name: type-tags; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "type-tags" ON "Collectives" USING btree (type, tags);


--
-- Name: Activities Activities_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Activities Activities_TransactionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_TransactionId_fkey" FOREIGN KEY ("TransactionId") REFERENCES "Transactions"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Activities Activities_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: PaymentMethods Cards_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "PaymentMethods"
    ADD CONSTRAINT "Cards_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: CollectiveHistories CollectiveHistories_CreatedByUserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "CollectiveHistories"
    ADD CONSTRAINT "CollectiveHistories_CreatedByUserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: CollectiveHistories CollectiveHistories_HostCollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "CollectiveHistories"
    ADD CONSTRAINT "CollectiveHistories_HostCollectiveId_fkey" FOREIGN KEY ("HostCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: CollectiveHistories CollectiveHistories_ParentCollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "CollectiveHistories"
    ADD CONSTRAINT "CollectiveHistories_ParentCollectiveId_fkey" FOREIGN KEY ("ParentCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Collectives Collectives_CreatedByUserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Collectives_CreatedByUserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Collectives Collectives_HostCollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Collectives_HostCollectiveId_fkey" FOREIGN KEY ("HostCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Collectives Collectives_ParentCollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Collectives_ParentCollectiveId_fkey" FOREIGN KEY ("ParentCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ConnectedAccounts ConnectedAccounts_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ConnectedAccounts"
    ADD CONSTRAINT "ConnectedAccounts_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ConnectedAccounts ConnectedAccounts_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ConnectedAccounts"
    ADD CONSTRAINT "ConnectedAccounts_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Orders Donations_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Orders Donations_PaymentMethodId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_PaymentMethodId_fkey" FOREIGN KEY ("PaymentMethodId") REFERENCES "PaymentMethods"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Orders Donations_SubscriptionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_SubscriptionId_fkey" FOREIGN KEY ("SubscriptionId") REFERENCES "Subscriptions"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Orders Donations_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Expenses Expenses_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Expenses Expenses_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Expenses Expenses_lastEditedById_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_lastEditedById_fkey" FOREIGN KEY ("lastEditedById") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Collectives Groups_lastEditedByUserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Groups_lastEditedByUserId_fkey" FOREIGN KEY ("LastEditedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Members Members_MemberCollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "Members_MemberCollectiveId_fkey" FOREIGN KEY ("MemberCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Members Members_TierId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "Members_TierId_fkey" FOREIGN KEY ("TierId") REFERENCES "Tiers"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Orders Orders_FromCollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Orders_FromCollectiveId_fkey" FOREIGN KEY ("FromCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Orders Orders_TierId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Orders_TierId_fkey" FOREIGN KEY ("TierId") REFERENCES "Tiers"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: PaymentMethods PaymentMethods_CollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "PaymentMethods"
    ADD CONSTRAINT "PaymentMethods_CollectiveId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Notifications Subscriptions_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Notifications"
    ADD CONSTRAINT "Subscriptions_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Notifications Subscriptions_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Notifications"
    ADD CONSTRAINT "Subscriptions_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Tiers Tiers_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Tiers"
    ADD CONSTRAINT "Tiers_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transactions Transactions_CardId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_CardId_fkey" FOREIGN KEY ("PaymentMethodId") REFERENCES "PaymentMethods"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transactions Transactions_DonationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_DonationId_fkey" FOREIGN KEY ("OrderId") REFERENCES "Orders"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transactions Transactions_ExpenseId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_ExpenseId_fkey" FOREIGN KEY ("ExpenseId") REFERENCES "Expenses"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transactions Transactions_FromCollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_FromCollectiveId_fkey" FOREIGN KEY ("FromCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transactions Transactions_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transactions Transactions_HostCollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_HostCollectiveId_fkey" FOREIGN KEY ("HostCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transactions Transactions_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Members UserGroups_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "UserGroups_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id);


--
-- Name: Members UserGroups_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "UserGroups_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Users Users_CollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_CollectiveId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: geography_columns; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE geography_columns TO opencollective;


--
-- Name: geometry_columns; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE geometry_columns TO opencollective;


--
-- Name: raster_columns; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE raster_columns TO opencollective;


--
-- Name: raster_overviews; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE raster_overviews TO opencollective;


--
-- Name: spatial_ref_sys; Type: ACL; Schema: public; Owner: -
--

REVOKE ALL ON TABLE spatial_ref_sys FROM xdamman;
REVOKE SELECT ON TABLE spatial_ref_sys FROM PUBLIC;
GRANT ALL ON TABLE spatial_ref_sys TO opencollective;
GRANT SELECT ON TABLE spatial_ref_sys TO PUBLIC;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    