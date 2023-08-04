# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Tabel名

## users
|Column             |Type     |Options|
|id                 |INT      |-------|
|nickname           |VARCHAR  |-------|
|email              |VARCHAR  |-------|
|encrypted_password |VARCHAR  |-------|
|first_name         |VARCHAR  |-------|
|last_name          |VARCHAR  |-------|
|reading_first_name |VARCHAR  |-------|
|reading_last_name  |VARCHAR  |-------|
|birthday           |DATATIME |-------|

## addresses
|Column             |Type     |Options|
|id                 |INT      |-------|
|user               |INT      |-------|
|post_code          |VARCHAR  |-------|
|prefectures        |VARCHAR  |-------|
|area_id            |INT      |-------|
|building_name      |VARCHAR  |-------|
|telephone          |VARCHAR  |-------|

## purchases
|Column             |Type     |Options|
|id                 |INT      |-------|
|user               |INT      |-------|
|product            |VARCHAR  |-------|

## products
|Column             |Type     |Options|
|id                 |INT      |-------|
|user               |INT      |-------|
|product_name       |VARCHAR  |-------|
|detail             |VARCHAR  |-------|
|category_id        |INT      |-------|
|state_id           |INT      |-------|
|burden_id          |INT      |-------|
|area_id            |INT      |-------|
|days_id            |INT      |-------|
|price              |INT      |-------|

### Association
（ここに追記していく）


