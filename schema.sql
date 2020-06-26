SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;



SET default_tablespace = '';

SET default_with_oids = false;


---
--- drop tables
---


DROP TABLE IF EXISTS tendered_loads;
DROP TABLE IF EXISTS loads;
DROP TABLE IF EXISTS equipment_types;
DROP TABLE IF EXISTS commodities;
DROP TABLE IF EXISTS carrier_groups_carriers;
DROP TABLE IF EXISTS carrier_groups;
DROP TABLE IF EXISTS carriers;
DROP TABLE IF EXISTS brokers;

CREATE TABLE "public"."brokers"("id" serial NOT NULL, "name" text NOT NULL, "phone_number" text NOT NULL, "email" text, "address" text, PRIMARY KEY ("id") );

CREATE TABLE "public"."carriers"("id" serial NOT NULL, "name" text NOT NULL, "phone_number" text NOT NULL, "email" text, "address" text, PRIMARY KEY ("id") );

CREATE TABLE "public"."commodities"("id" serial NOT NULL, "name" text NOT NULL, "description" text, PRIMARY KEY ("id") );

CREATE TABLE "public"."equipment_types"("id" serial NOT NULL, "code" text NOT NULL, "description" text, PRIMARY KEY ("id") );

CREATE TABLE "public"."carrier_groups"("id" serial NOT NULL, "name" text NOT NULL, "broker_id" integer NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("broker_id") REFERENCES "public"."brokers"("id") ON UPDATE cascade ON DELETE cascade);

CREATE TABLE "public"."carrier_groups_carriers"("carrier_group_id" integer NOT NULL, "carrier_id" integer NOT NULL, PRIMARY KEY ("carrier_group_id","carrier_id") , FOREIGN KEY ("carrier_group_id") REFERENCES "public"."carrier_groups"("id") ON UPDATE cascade ON DELETE cascade, FOREIGN KEY ("carrier_id") REFERENCES "public"."carriers"("id") ON UPDATE cascade ON DELETE cascade);

CREATE TABLE "public"."loads"("id" bigserial NOT NULL, "origin_address" text NOT NULL, "origin_city" text NOT NULL, "origin_state" text NOT NULL, "destination_address" text NOT NULL, "destination_city" text NOT NULL, "destination_state" text NOT NULL, "rate" numeric NOT NULL, "pickup_date" timestamp NOT NULL, "dropoff_date" timestamp NOT NULL, "equipment_type_id" integer NOT NULL, "commodity_id" integer NOT NULL, "is_book_it_now" boolean NOT NULL, "broker_id" integer NOT NULL, "carrier_group_id" integer, "additional_details" text, PRIMARY KEY ("id") , FOREIGN KEY ("broker_id") REFERENCES "public"."brokers"("id") ON UPDATE cascade ON DELETE set null, FOREIGN KEY ("commodity_id") REFERENCES "public"."commodities"("id") ON UPDATE cascade ON DELETE set null, FOREIGN KEY ("equipment_type_id") REFERENCES "public"."equipment_types"("id") ON UPDATE cascade ON DELETE set null, FOREIGN KEY ("carrier_group_id") REFERENCES "public"."carrier_groups"("id") ON UPDATE cascade ON DELETE set null);

CREATE TABLE "public"."tendered_loads"("load_id" bigint NOT NULL, "carrier_id" integer NOT NULL, "created_on" timestamp NOT NULL DEFAULT now(), PRIMARY KEY ("load_id","carrier_id") , FOREIGN KEY ("load_id") REFERENCES "public"."loads"("id") ON UPDATE cascade ON DELETE restrict, FOREIGN KEY ("carrier_id") REFERENCES "public"."carriers"("id") ON UPDATE cascade ON DELETE set null);
