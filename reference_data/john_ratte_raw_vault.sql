CREATE TABLE "sat_h_address" (
  "address_pk" varchar,
  "address_hashdiff" varchar,
  "address_id" varchar,
  "address_line_1" varchar,
  "address_line_2" varchar,
  "city" varchar,
  "state" varchar,
  "postal_code" varchar,
  "latitude" varchar,
  "longitude" varchar,
  "load_date" timestamp,
  "record_source" varchar
);

CREATE TABLE "hub_address" (
  "address_pk" varchar,
  "address_id" varchar,
  "load_date" varchar,
  "record_source" varchar
);

CREATE TABLE "link_customer_address" (
  "link_customer_addres_pk" varchar,
  "customer_pk" varchar,
  "address_pk" varchar,
  "load_date" timestamp,
  "record_source" varchar
);

CREATE TABLE "hub_customer" (
  "customer_pk" varchar,
  "customer_id" varchar,
  "load_date" timestamp,
  "record_source" varchar
);

CREATE TABLE "sat_h_customer" (
  "customer_pk" varchar,
  "customer_hashdiff" varchar,
  "customer_id" varchar,
  "first_name" varchar,
  "last_name" varchar,
  "phone" varchar,
  "email" varchar,
  "load_date" timestamp,
  "record_source" varchar
);

CREATE TABLE "link_cart_customer" (
  "lnk_cart_customer" varchar,
  "cart_pk" varchar,
  "customer_pk" varchar,
  "load_date" timestamp,
  "record_source" varchar
);

CREATE TABLE "hub_cart" (
  "cart_pk" varchar,
  "cart_id" varchar,
  "load_date" timestamp,
  "record_source" varchar
);

CREATE TABLE "link_cart_order" (
  "lnk_cart_order_pk" varchar,
  "cart_pk" varchar,
  "order_pk" varchar,
  "load_date" timestamp,
  "record_source" varchar
);

CREATE TABLE "hub_order" (
  "order_pk" varchar,
  "order_id" varchar,
  "load_date" timestamp,
  "record_source" varchar
);

CREATE TABLE "sat_h_order" (
  "order_pk" varchar,
  "order_hashdiff" varchar,
  "order_id" varchar,
  "order_date" varchar,
  "order_status" varchar,
  "load_date" timestamp,
  "record_source" varchar
);

CREATE TABLE "link_cart_item" (
  "lnk_cart_item_pk" varchar,
  "cart_pk" varchar,
  "product_pk" varchar,
  "load_date" timestamp,
  "record_source" varchar
);

CREATE TABLE "sat_l_cart_item" (
  "car_item_pk" varchar,
  "cart_item_hashdiff" varchar,
  "cart_pk" varchar,
  "quantity" integer,
  "load_date" timestamp,
  "record_source" varchar
);

CREATE TABLE "hub_product" (
  "product_pk" varchar,
  "product_id" varchar,
  "load_date" timestamp,
  "record_source" varchar
);

CREATE TABLE "sat_h_product" (
  "product_pk" varchar,
  "product_hashdiff" varchar,
  "product_id" varchar,
  "product_name" varchar,
  "price" numeric,
  "category" varchar,
  "description" varchar,
  "load_date" timestamp,
  "record_source" varchar
);

ALTER TABLE "sat_h_customer" ADD FOREIGN KEY ("customer_pk") REFERENCES "hub_customer" ("customer_pk");

ALTER TABLE "link_cart_customer" ADD FOREIGN KEY ("customer_pk") REFERENCES "hub_customer" ("customer_pk");

ALTER TABLE "link_cart_customer" ADD FOREIGN KEY ("cart_pk") REFERENCES "hub_cart" ("cart_pk");

ALTER TABLE "link_cart_order" ADD FOREIGN KEY ("cart_pk") REFERENCES "hub_cart" ("cart_pk");

ALTER TABLE "link_customer_address" ADD FOREIGN KEY ("customer_pk") REFERENCES "hub_customer" ("customer_pk");

ALTER TABLE "link_customer_address" ADD FOREIGN KEY ("address_pk") REFERENCES "hub_address" ("address_pk");

ALTER TABLE "sat_h_address" ADD FOREIGN KEY ("address_pk") REFERENCES "hub_address" ("address_pk");

ALTER TABLE "link_cart_order" ADD FOREIGN KEY ("order_pk") REFERENCES "hub_order" ("order_pk");

ALTER TABLE "sat_h_order" ADD FOREIGN KEY ("order_pk") REFERENCES "hub_order" ("order_pk");

ALTER TABLE "link_cart_item" ADD FOREIGN KEY ("cart_pk") REFERENCES "hub_cart" ("cart_pk");

ALTER TABLE "link_cart_item" ADD FOREIGN KEY ("product_pk") REFERENCES "hub_product" ("product_pk");

ALTER TABLE "sat_h_product" ADD FOREIGN KEY ("product_pk") REFERENCES "hub_product" ("product_pk");
