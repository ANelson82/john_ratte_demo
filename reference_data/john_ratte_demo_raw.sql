CREATE TABLE "order_status" (
  "order_status_id" varchar PRIMARY KEY,
  "order_status" varchar
);

CREATE TABLE "order_tracking" (
  "order_tracking_id" varchar PRIMARY KEY,
  "order_id" varchar,
  "order_status_id" varchar,
  "time_stamp" datetime
);

CREATE TABLE "orders" (
  "order_id" varchar,
  "cart_id" varchar,
  "order_date" datetime
);

CREATE TABLE "customer" (
  "customer_id" varchar,
  "first_name" varchar,
  "last_name" varchar,
  "email" varchar,
  "phone" varchar,
  "address_id" varchar,
  "created_at" timestamp
);

CREATE TABLE "address" (
  "address_id" varchar PRIMARY KEY,
  "address_line_1" varchar,
  "address_line_2" varchar,
  "city" varchar,
  "state" varchar,
  "postal_code" varchar,
  "latitude" real,
  "longitude" real
);

CREATE TABLE "cart" (
  "cart_id" varchar,
  "customer_id" varchar,
  "created_at" timestamp
);

CREATE TABLE "cart_item" (
  "cart_item_id" varchar,
  "cart_id" varchar,
  "product_id" varchar,
  "quantity" integer
);

CREATE TABLE "product" (
  "product_id" varchar,
  "product_name" varchar,
  "price" numeric,
  "category" varchar,
  "description" text,
  "created_at" timestamp
);

ALTER TABLE "order_tracking" ADD FOREIGN KEY ("order_status_id") REFERENCES "order_status" ("order_status_id");

ALTER TABLE "order_tracking" ADD FOREIGN KEY ("order_tracking_id") REFERENCES "orders" ("order_id");

ALTER TABLE "cart" ADD FOREIGN KEY ("cart_id") REFERENCES "orders" ("cart_id");

ALTER TABLE "cart" ADD FOREIGN KEY ("customer_id") REFERENCES "customer" ("customer_id");

ALTER TABLE "address" ADD FOREIGN KEY ("address_id") REFERENCES "customer" ("address_id");

ALTER TABLE "cart_item" ADD FOREIGN KEY ("cart_id") REFERENCES "cart" ("cart_id");

ALTER TABLE "cart_item" ADD FOREIGN KEY ("product_id") REFERENCES "product" ("product_id");
