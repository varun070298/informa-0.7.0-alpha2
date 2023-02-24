alter table CATEGORIES drop constraint FK6A31321CBBCD53BF;
alter table CAT_CHANNEL_LINK drop constraint FK510BBFCB74C6C9;
alter table CAT_CHANNEL_LINK drop constraint FK510BBF9C0F4EEB;
alter table CAT_GROUP_CHANNEL drop constraint FK94C7FE3ACB74C6C9;
alter table CAT_GROUP_CHANNEL drop constraint FK94C7FE3A94332F88;
alter table CAT_ITEM_LINK drop constraint FKAE9345D7432BB4B;
alter table CAT_ITEM_LINK drop constraint FKAE9345D9C0F4EEB;
alter table CHANNELS drop constraint FK840A13D0383F84A9;
alter table CHANNELS drop constraint FK840A13D098B07789;
alter table CHANNELS drop constraint FK840A13D0CD71149;
alter table CHANNEL_GROUPS drop constraint FKDE9B8CB0F16B697D;
alter table CHANNEL_SUBSCRIPTIONS drop constraint FK9CF8F47ACB74C6C9;
alter table ITEMS drop constraint FK42BEFA0CB74C6C9;
alter table ITEMS drop constraint FK42BEFA0B5878ADA;
alter table ITEMS drop constraint FK42BEFA03D80CDC0;
alter table ITEMS drop constraint FK42BEFA083BE40B6;
alter table ITEM_ENCLOSURE drop constraint FK29A89F267432BB4B;
alter table ITEM_GUID drop constraint FK2835C8357432BB4B;
alter table ITEM_METADATA drop constraint FK3E9AEEDB7432BB4B;
alter table ITEM_SOURCE drop constraint FK60FDAC77432BB4B;
drop table CATEGORIES if exists;
drop table CAT_CHANNEL_LINK if exists;
drop table CAT_GROUP_CHANNEL if exists;
drop table CAT_ITEM_LINK if exists;
drop table CHANNELS if exists;
drop table CHANNEL_GROUPS if exists;
drop table CHANNEL_SUBSCRIPTIONS if exists;
drop table CLOUDS if exists;
drop table IMAGES if exists;
drop table ITEMS if exists;
drop table ITEM_ENCLOSURE if exists;
drop table ITEM_GUID if exists;
drop table ITEM_METADATA if exists;
drop table ITEM_SOURCE if exists;
drop table TEXTINPUTS if exists;
create table CATEGORIES (CATEGORY_ID bigint generated by default as identity (start with 1), TITLE varchar(255) not null, PARENT_ID bigint, primary key (CATEGORY_ID));
create table CAT_CHANNEL_LINK (CHANNEL_ID bigint not null, CATEGORY_ID bigint not null);
create table CAT_GROUP_CHANNEL (CHANNEL_ID bigint not null, GROUP_ID bigint not null, primary key (GROUP_ID, CHANNEL_ID));
create table CAT_ITEM_LINK (ITEM_ID bigint not null, CATEGORY_ID bigint not null);
create table CHANNELS (CHANNEL_ID bigint generated by default as identity (start with 1), TITLE varchar(255) not null, DESCRIPTION varchar(255), LOCSTRING varchar(255), SITE varbinary(255), CREATOR varchar(255), PUBLISHER varchar(255), LANGUAGE varchar(255), FORMAT varchar(255), IMAGE_ID bigint, TEXTINPUT_ID bigint, COPYRIGHT varchar(255), RATING varchar(255), CLOUD_ID bigint, GENERATOR varchar(255), DOCS varchar(255), TTL integer, LAST_UPDATED timestamp, LAST_BUILD_DATE timestamp, PUB_DATE timestamp, UPDATE_PERIOD varchar(255), UPDATE_FREQUENCY integer, UPDATE_BASE timestamp, primary key (CHANNEL_ID));
create table CHANNEL_GROUPS (CHANNEL_GROUP_ID bigint generated by default as identity (start with 1), TITLE varchar(255) not null, PARENT_ID bigint, primary key (CHANNEL_GROUP_ID));
create table CHANNEL_SUBSCRIPTIONS (CHANNEL_SUBSCRIPTION_ID bigint generated by default as identity (start with 1), CHANNEL_ID bigint not null, ACTIVE bit, UPDATE_INTERVAL integer, primary key (CHANNEL_SUBSCRIPTION_ID));
create table CLOUDS (CLOUD_ID bigint generated by default as identity (start with 1), DOMAIN varchar(255) not null, PORT integer not null, PATH varchar(255) not null, REGISTER_PROCEDURE varchar(255) not null, PROTOCOL varchar(255) not null, primary key (CLOUD_ID));
create table IMAGES (IMAGE_ID bigint generated by default as identity (start with 1), TITLE varchar(255) not null, DESCRIPTION varchar(255), LOCATION varchar(255), LINK varchar(255), WIDTH integer, HEIGHT integer, primary key (IMAGE_ID));
create table ITEMS (ITEM_ID bigint generated by default as identity (start with 1), CHANNEL_ID bigint not null, TITLE varchar(255) not null, DESCRIPTION varchar(600), UNREAD bit, LINK varchar(255), CREATOR varchar(255), SUBJECT varchar(255), DATE timestamp, FOUND timestamp, GUID bigint, COMMENTS varchar(255), SOURCE bigint, ENCLOSURE bigint, primary key (ITEM_ID));
create table ITEM_ENCLOSURE (ITEM_ENCLOSURE_ID bigint generated by default as identity (start with 1), ITEM_ID bigint not null, LOCATION varbinary(255), TYPE varchar(255), LENGTH integer, primary key (ITEM_ENCLOSURE_ID));
create table ITEM_GUID (ITEM_GUID_ID bigint generated by default as identity (start with 1), ITEM_ID bigint not null, LOCATION varchar(255), PERMA_LINK bit, primary key (ITEM_GUID_ID));
create table ITEM_METADATA (ITEM_METADATA_ID bigint generated by default as identity (start with 1), ITEM_ID bigint not null, MARKED_READ bit, SCORE integer, primary key (ITEM_METADATA_ID));
create table ITEM_SOURCE (ITEM_SOURCE_ID bigint generated by default as identity (start with 1), ITEM_ID bigint not null, NAME varchar(255), LOCATION varchar(255), TIMESTAMP timestamp, primary key (ITEM_SOURCE_ID));
create table TEXTINPUTS (TEXTINPUT_ID bigint generated by default as identity (start with 1), TITLE varchar(255) not null, DESCRIPTION varchar(255), NAME varchar(255), LINK varbinary(255), primary key (TEXTINPUT_ID));
alter table CATEGORIES add constraint FK6A31321CBBCD53BF foreign key (PARENT_ID) references CATEGORIES;
alter table CAT_CHANNEL_LINK add constraint FK510BBFCB74C6C9 foreign key (CHANNEL_ID) references CHANNELS;
alter table CAT_CHANNEL_LINK add constraint FK510BBF9C0F4EEB foreign key (CATEGORY_ID) references CATEGORIES;
alter table CAT_GROUP_CHANNEL add constraint FK94C7FE3ACB74C6C9 foreign key (CHANNEL_ID) references CHANNELS;
alter table CAT_GROUP_CHANNEL add constraint FK94C7FE3A94332F88 foreign key (GROUP_ID) references CHANNEL_GROUPS;
alter table CAT_ITEM_LINK add constraint FKAE9345D7432BB4B foreign key (ITEM_ID) references ITEMS;
alter table CAT_ITEM_LINK add constraint FKAE9345D9C0F4EEB foreign key (CATEGORY_ID) references CATEGORIES;
alter table CHANNELS add constraint FK840A13D0383F84A9 foreign key (TEXTINPUT_ID) references TEXTINPUTS;
alter table CHANNELS add constraint FK840A13D098B07789 foreign key (IMAGE_ID) references IMAGES;
alter table CHANNELS add constraint FK840A13D0CD71149 foreign key (CLOUD_ID) references CLOUDS;
alter table CHANNEL_GROUPS add constraint FKDE9B8CB0F16B697D foreign key (PARENT_ID) references CHANNEL_GROUPS;
alter table CHANNEL_SUBSCRIPTIONS add constraint FK9CF8F47ACB74C6C9 foreign key (CHANNEL_ID) references CHANNELS;
alter table ITEMS add constraint FK42BEFA0CB74C6C9 foreign key (CHANNEL_ID) references CHANNELS;
alter table ITEMS add constraint FK42BEFA0B5878ADA foreign key (SOURCE) references ITEM_SOURCE;
alter table ITEMS add constraint FK42BEFA03D80CDC0 foreign key (ENCLOSURE) references ITEM_ENCLOSURE;
alter table ITEMS add constraint FK42BEFA083BE40B6 foreign key (GUID) references ITEM_GUID;
alter table ITEM_ENCLOSURE add constraint FK29A89F267432BB4B foreign key (ITEM_ID) references ITEMS;
alter table ITEM_GUID add constraint FK2835C8357432BB4B foreign key (ITEM_ID) references ITEMS;
alter table ITEM_METADATA add constraint FK3E9AEEDB7432BB4B foreign key (ITEM_ID) references ITEMS;
alter table ITEM_SOURCE add constraint FK60FDAC77432BB4B foreign key (ITEM_ID) references ITEMS;