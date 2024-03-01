-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/vYGkut
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Order" (
    "row_id" int   NOT NULL,
    "order_id" varchar2(10)   NOT NULL,
    "created_at" datetime   NOT NULL,
    "item_id" varchar2(50)   NOT NULL,
    "cust_id" int   NOT NULL,
    "quantitiy" int   NOT NULL,
    "address_id" int   NOT NULL,
    "delivary" boolean   NOT NULL,
    CONSTRAINT "pk_Order" PRIMARY KEY (
        "row_id"
     )
);

CREATE TABLE "customers" (
    "cust_id" int   NOT NULL,
    "cust_firstname" varchar2(50)   NOT NULL,
    "cust_lastname" varchar2(50)   NOT NULL
);

CREATE TABLE "Address" (
    "add_id" int   NOT NULL,
    "delivary_address1" varchar2(50)   NOT NULL,
    "delivary_address2" varchar2(50)   NOT NULL,
    "delivary_city" varchar2(50)   NOT NULL,
    "delivary_zipcode" int   NOT NULL,
    CONSTRAINT "pk_Address" PRIMARY KEY (
        "add_id"
     )
);

CREATE TABLE "items" (
    "item_id" varchar2(50)   NOT NULL,
    "sku" varchar2(50)   NOT NULL,
    "item_name" varchar2(50)   NOT NULL,
    "item_cat" varchar2(50)   NOT NULL,
    "item_size" varchar2(50)   NOT NULL,
    "item_price" decimal(1.2)   NOT NULL
);

CREATE TABLE "recipe" (
    "row_id" varchar(20)   NOT NULL,
    "recipe_id" varchar(20)   NOT NULL,
    "ing_id" varchar2(50)   NOT NULL,
    "quantity" int   NOT NULL,
    CONSTRAINT "pk_recipe" PRIMARY KEY (
        "row_id"
     )
);

CREATE TABLE "inventory" (
    "inv_id" int   NOT NULL,
    "item_id" varchar2(50)   NOT NULL,
    "quantity" int   NOT NULL,
    CONSTRAINT "pk_inventory" PRIMARY KEY (
        "inv_id"
     )
);

CREATE TABLE "ingredients" (
    "ing_id" varchar   NOT NULL,
    "ing_name" varchar2(50)   NOT NULL,
    "ing_weight" varchar2(50)   NOT NULL,
    "ing_meas" varchar2(50)   NOT NULL,
    "ing_price" decimal(5.2)   NOT NULL,
    CONSTRAINT "pk_ingredients" PRIMARY KEY (
        "ing_id"
     )
);

CREATE TABLE "rota" (
    "row_id" int   NOT NULL,
    "rota_id" varchar2(50)   NOT NULL,
    "date" datetime   NOT NULL,
    "shift_id" varchar2(50)   NOT NULL,
    "staff_id" varchar2(50)   NOT NULL,
    CONSTRAINT "pk_rota" PRIMARY KEY (
        "row_id"
     )
);

CREATE TABLE "staff" (
    "staff_id" varchar2(50)   NOT NULL,
    "first_name" varchar2(50)   NOT NULL,
    "last_name" varchar2(50)   NOT NULL,
    "position" varchar2(50)   NOT NULL,
    "hourly_rate" varchar2(50)   NOT NULL,
    CONSTRAINT "pk_staff" PRIMARY KEY (
        "staff_id"
     )
);

CREATE TABLE "shift" (
    "shift_id" varchar2(50)   NOT NULL,
    "day_of_week" varchar2(10)   NOT NULL,
    "start_time" time   NOT NULL,
    "end_time" time   NOT NULL,
    CONSTRAINT "pk_shift" PRIMARY KEY (
        "shift_id"
     )
);

ALTER TABLE "customers" ADD CONSTRAINT "fk_customers_cust_id" FOREIGN KEY("cust_id")
REFERENCES "Order" ("cust_id");

ALTER TABLE "Address" ADD CONSTRAINT "fk_Address_add_id" FOREIGN KEY("add_id")
REFERENCES "Order" ("address_id");

ALTER TABLE "items" ADD CONSTRAINT "fk_items_item_id" FOREIGN KEY("item_id")
REFERENCES "Order" ("item_id");

ALTER TABLE "items" ADD CONSTRAINT "fk_items_sku" FOREIGN KEY("sku")
REFERENCES "recipe" ("row_id");

ALTER TABLE "recipe" ADD CONSTRAINT "fk_recipe_ing_id" FOREIGN KEY("ing_id")
REFERENCES "inventory" ("inv_id");

ALTER TABLE "ingredients" ADD CONSTRAINT "fk_ingredients_ing_id" FOREIGN KEY("ing_id")
REFERENCES "recipe" ("ing_id");

ALTER TABLE "rota" ADD CONSTRAINT "fk_rota_date" FOREIGN KEY("date")
REFERENCES "Order" ("created_at");

ALTER TABLE "rota" ADD CONSTRAINT "fk_rota_shift_id" FOREIGN KEY("shift_id")
REFERENCES "shift" ("shift_id");

ALTER TABLE "staff" ADD CONSTRAINT "fk_staff_staff_id" FOREIGN KEY("staff_id")
REFERENCES "rota" ("staff_id");

