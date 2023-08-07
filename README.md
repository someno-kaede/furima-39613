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
|Column             |Type       |Options                 |
|-------------------|-----------|------------------------|
|nickname           |string     |null: false             |
|email              |string     |null: false, UNIQUE KEY |
|encrypted_password |string     |null: false             |
|first_name         |string     |null: false             |
|last_name          |string     |null: false             |
|reading_first_name |string     |null: false             |
|reading_last_name  |string     |null: false             |
|birthday           |date       |null: false             |

### Association
- has_many :addresses
- has_many :purchases
- has_many :productes

## addresses
|Column             |Type       |Options                 |
|-------------------|-----------|------------------------|
|user               |references |foregin_key: true       |
|post_code          |string     |null: false             |
|prefectures        |string     |null: false             |
|area_id            |integer    |null: false             |
|building_name      |string     |                        |
|telephone          |string     |null: false             |

### Association
- belongs_to :users

## purchases
|Column             |Type       |Options                 |
|-------------------|-----------|------------------------|
|user               |references |foregin_key: true       |
|product            |references |foregin_key: true       |

### Association
- belongs_to :users
- belongs_to :products

## products
|Column             |Type       |Options                 |
|-------------------|-----------|------------------------|
|user               |integer    |foregin_key: true       |
|product_name       |string     |null: false             |
|detail             |string     |null: false             |
|category_id        |integer    |null: false             |
|state_id           |integer    |null: false             |
|burden_id          |integer    |null: false             |
|area_id            |integer    |null: false             |   
|shipping_day_id    |integer    |null: false             |
|price              |integer    |null: false             |

### Association
- belongs_to :users
- has_many :purchases

