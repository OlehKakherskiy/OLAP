/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     17.05.2016 17:46:03                          */
/*==============================================================*/


alter table "CharacteristicDescription"
   drop constraint FK_CHARACTE_CHARACTER_CHARACTE;

alter table "CharacteristicDescription"
   drop constraint FK_CHARACTE_PRODUCTCH_PRODUCT;

alter table "Check"
   drop constraint FK_CHECK_CASHIER_I_CASHIER;

alter table "CheckPosition"
   drop constraint FK_CHECKPOS_PRODUCT_I_PRODUCT;

alter table "CheckPosition"
   drop constraint FK_CHECKPOS_ÑHECK_ID_CHECK;

alter table "Product"
   drop constraint FK_PRODUCT_MANUFACTU_MANUFACT;

alter table "Product"
   drop constraint FK_PRODUCT_MEASUREME_MEASUREM;

alter table "Product"
   drop constraint FK_PRODUCT_PRODUCTTY_PRODUCTT;

alter table "StoragePosition"
   drop constraint FK_STORAGEP_DELIVERYM_MEASUREM;

alter table "StoragePosition"
   drop constraint FK_STORAGEP_PRODUCT_I_PRODUCT;

alter table "StoragePosition"
   drop constraint FK_STORAGEP_PROVIDER__PROVIDER;

alter table "StoragePosition"
   drop constraint FK_STORAGEP_STORAGE_I_STRORAGE;

drop table "Cashier" cascade constraints;

drop index "CharacteristicType_ID_FK";

drop index "ProductCharacteristic_ID_FK";

drop table "CharacteristicDescription" cascade constraints;

drop table "CharacteristicType" cascade constraints;

drop index "Cashier_ID_FK";

drop table "Check" cascade constraints;

drop index "Product_ID_FK";

drop index "Ñheck_ID_FK";

drop table "CheckPosition" cascade constraints;

drop table "Manufacturer" cascade constraints;

drop table "MeasurementUnit" cascade constraints;

drop index "MeasurementUnit_ID_FK";

drop index "ProductType_ID_FK";

drop index "Manufacturer_ID_FK";

drop table "Product" cascade constraints;

drop table "ProductType" cascade constraints;

drop table "Provider" cascade constraints;

drop index "DeliveryMeasurementUnit_ID_FK";

drop index "Product_ID1_FK";

drop index "Storage_ID_FK";

drop index "Provider_ID_FK";

drop table "StoragePosition" cascade constraints;

drop table "Strorage" cascade constraints;

/*==============================================================*/
/* Table: "Cashier"                                             */
/*==============================================================*/
create table "Cashier" 
(
   "Cashier_ID"         INTEGER              not null,
   "Name"               CHAR(20),
   "Birthdate"          DATE,
   "Surname"            CHAR(100),
   "SecondName"         CHAR(30),
   constraint PK_CASHIER primary key ("Cashier_ID")
);

/*==============================================================*/
/* Table: "CharacteristicDescription"                           */
/*==============================================================*/
create table "CharacteristicDescription" 
(
   "CharacteristicDescription_ID" INTEGER              not null,
   "Product_ID"         INTEGER              not null,
   "CharacteristicType_ID" INTEGER              not null,
   "description"        CLOB,
   constraint PK_CHARACTERISTICDESCRIPTION primary key ("CharacteristicDescription_ID")
);

/*==============================================================*/
/* Index: "ProductCharacteristic_ID_FK"                         */
/*==============================================================*/
create index "ProductCharacteristic_ID_FK" on "CharacteristicDescription" (
   "Product_ID" ASC
);

/*==============================================================*/
/* Index: "CharacteristicType_ID_FK"                            */
/*==============================================================*/
create index "CharacteristicType_ID_FK" on "CharacteristicDescription" (
   "CharacteristicType_ID" ASC
);

/*==============================================================*/
/* Table: "CharacteristicType"                                  */
/*==============================================================*/
create table "CharacteristicType" 
(
   "CharacteristicType_ID" INTEGER              not null,
   "CharacteristicName" CHAR(50),
   constraint PK_CHARACTERISTICTYPE primary key ("CharacteristicType_ID")
);

/*==============================================================*/
/* Table: "Check"                                               */
/*==============================================================*/
create table "Check" 
(
   "Check_ID"           INTEGER              not null,
   "Date"               DATE,
   "Cashier_ID"         INTEGER              not null,
   constraint PK_CHECK primary key ("Check_ID")
);

/*==============================================================*/
/* Index: "Cashier_ID_FK"                                       */
/*==============================================================*/
create index "Cashier_ID_FK" on "Check" (
   "Cashier_ID" ASC
);

/*==============================================================*/
/* Table: "CheckPosition"                                       */
/*==============================================================*/
create table "CheckPosition" 
(
   "CheckPosition_ID"   INTEGER              not null,
   "Product_ID"         INTEGER              not null,
   "Check_ID"           INTEGER              not null,
   "count"              SMALLINT,
   "price"              NUMBER(8,2),
   constraint PK_CHECKPOSITION primary key ("CheckPosition_ID")
);

/*==============================================================*/
/* Index: "Ñheck_ID_FK"                                         */
/*==============================================================*/
create index "Ñheck_ID_FK" on "CheckPosition" (
   "Check_ID" ASC
);

/*==============================================================*/
/* Index: "Product_ID_FK"                                       */
/*==============================================================*/
create index "Product_ID_FK" on "CheckPosition" (
   "Product_ID" ASC
);

/*==============================================================*/
/* Table: "Manufacturer"                                        */
/*==============================================================*/
create table "Manufacturer" 
(
   "Manufacturer_ID"    INTEGER              not null,
   "name"               CHAR(100),
   constraint PK_MANUFACTURER primary key ("Manufacturer_ID")
);

/*==============================================================*/
/* Table: "MeasurementUnit"                                     */
/*==============================================================*/
create table "MeasurementUnit" 
(
   "MeasurementUnit_ID" INTEGER              not null,
   "name"               CHAR(20),
   constraint PK_MEASUREMENTUNIT primary key ("MeasurementUnit_ID")
);

/*==============================================================*/
/* Table: "Product"                                             */
/*==============================================================*/
create table "Product" 
(
   "Product_ID"         INTEGER              not null,
   "Manufacturer_ID"    INTEGER              not null,
   "ProductType_ID"     INTEGER              not null,
   "MeasurementUnit_ID" INTEGER              not null,
   "name"               CHAR(100),
   "description"        CLOB,
   constraint PK_PRODUCT primary key ("Product_ID")
);

/*==============================================================*/
/* Index: "Manufacturer_ID_FK"                                  */
/*==============================================================*/
create index "Manufacturer_ID_FK" on "Product" (
   "Manufacturer_ID" ASC
);

/*==============================================================*/
/* Index: "ProductType_ID_FK"                                   */
/*==============================================================*/
create index "ProductType_ID_FK" on "Product" (
   "ProductType_ID" ASC
);

/*==============================================================*/
/* Index: "MeasurementUnit_ID_FK"                               */
/*==============================================================*/
create index "MeasurementUnit_ID_FK" on "Product" (
   "MeasurementUnit_ID" ASC
);

/*==============================================================*/
/* Table: "ProductType"                                         */
/*==============================================================*/
create table "ProductType" 
(
   "ProductType_ID"     INTEGER              not null,
   "type"               CHAR(100),
   constraint PK_PRODUCTTYPE primary key ("ProductType_ID")
);

/*==============================================================*/
/* Table: "Provider"                                            */
/*==============================================================*/
create table "Provider" 
(
   "Provider_ID"        INTEGER              not null,
   "organisation"       CHAR(200),
   constraint PK_PROVIDER primary key ("Provider_ID")
);

/*==============================================================*/
/* Table: "StoragePosition"                                     */
/*==============================================================*/
create table "StoragePosition" 
(
   "Position_ID"        INTEGER              not null,
   "Product_ID"         INTEGER              not null,
   "count"              INTEGER,
   "DeliveryDate"       DATE,
   "Provider_ID"        INTEGER              not null,
   "Storage_ID"         INTEGER              not null,
   "DeliveryNeasurementUnit_ID" INTEGER              not null,
   "ProductPrice"       NUMBER(8,2),
   "DeliveryPrice"      NUMBER(8,2),
   constraint PK_STORAGEPOSITION primary key ("Position_ID")
);

/*==============================================================*/
/* Index: "Provider_ID_FK"                                      */
/*==============================================================*/
create index "Provider_ID_FK" on "StoragePosition" (
   "Provider_ID" ASC
);

/*==============================================================*/
/* Index: "Storage_ID_FK"                                       */
/*==============================================================*/
create index "Storage_ID_FK" on "StoragePosition" (
   "Storage_ID" ASC
);

/*==============================================================*/
/* Index: "Product_ID1_FK"                                      */
/*==============================================================*/
create index "Product_ID1_FK" on "StoragePosition" (
   "Product_ID" ASC
);

/*==============================================================*/
/* Index: "DeliveryMeasurementUnit_ID_FK"                       */
/*==============================================================*/
create index "DeliveryMeasurementUnit_ID_FK" on "StoragePosition" (
   "DeliveryNeasurementUnit_ID" ASC
);

/*==============================================================*/
/* Table: "Strorage"                                            */
/*==============================================================*/
create table "Strorage" 
(
   "Storage_ID"         INTEGER              not null,
   "Desription"         CLOB,
   constraint PK_STRORAGE primary key ("Storage_ID")
);

alter table "CharacteristicDescription"
   add constraint FK_CHARACTE_CHARACTER_CHARACTE foreign key ("CharacteristicType_ID")
      references "CharacteristicType" ("CharacteristicType_ID");

alter table "CharacteristicDescription"
   add constraint FK_CHARACTE_PRODUCTCH_PRODUCT foreign key ("Product_ID")
      references "Product" ("Product_ID");

alter table "Check"
   add constraint FK_CHECK_CASHIER_I_CASHIER foreign key ("Cashier_ID")
      references "Cashier" ("Cashier_ID");

alter table "CheckPosition"
   add constraint FK_CHECKPOS_PRODUCT_I_PRODUCT foreign key ("Product_ID")
      references "Product" ("Product_ID");

alter table "CheckPosition"
   add constraint FK_CHECKPOS_ÑHECK_ID_CHECK foreign key ("Check_ID")
      references "Check" ("Check_ID");

alter table "Product"
   add constraint FK_PRODUCT_MANUFACTU_MANUFACT foreign key ("Manufacturer_ID")
      references "Manufacturer" ("Manufacturer_ID");

alter table "Product"
   add constraint FK_PRODUCT_MEASUREME_MEASUREM foreign key ("MeasurementUnit_ID")
      references "MeasurementUnit" ("MeasurementUnit_ID");

alter table "Product"
   add constraint FK_PRODUCT_PRODUCTTY_PRODUCTT foreign key ("ProductType_ID")
      references "ProductType" ("ProductType_ID");

alter table "StoragePosition"
   add constraint FK_STORAGEP_DELIVERYM_MEASUREM foreign key ("DeliveryNeasurementUnit_ID")
      references "MeasurementUnit" ("MeasurementUnit_ID");

alter table "StoragePosition"
   add constraint FK_STORAGEP_PRODUCT_I_PRODUCT foreign key ("Product_ID")
      references "Product" ("Product_ID");

alter table "StoragePosition"
   add constraint FK_STORAGEP_PROVIDER__PROVIDER foreign key ("Provider_ID")
      references "Provider" ("Provider_ID");

alter table "StoragePosition"
   add constraint FK_STORAGEP_STORAGE_I_STRORAGE foreign key ("Storage_ID")
      references "Strorage" ("Storage_ID");

