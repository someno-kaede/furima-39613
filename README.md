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
|Column             |Type       |Options              |
|id                 |integer    |PRIMARY KEY          |
|nickname           |string     |NOT NULL             |
|email              |string     |NOT NULL, UNIQUE KEY |
|encrypted_password |string     |NOT NULL             |
|first_name         |string     |NOT NULL             |
|last_name          |string     |NOT NULL             |
|reading_first_name |string     |NOT NULL             |
|reading_last_name  |string     |NOT NULL             |
|birthday           |date       |NOT NULL             |

## addresses
|Column             |Type       |Options              |
|id                 |integer    |PRIMARY KEY          |
|user               |references |FOREIGN KEY          |
|post_code          |string     |NOT NULL             |
|prefectures        |string     |NOT NULL             |
|area_id            |integer    |NOT NULL             |
|building_name      |string     |---------------------|
|telephone          |string     |NOT NULL             |

## purchases
|Column             |Type       |Options              |
|id                 |integer    |PRIMARY KEY          |
|user               |references |FOREIGN KEY          |
|product            |references |FOREIGN KEY          |

## products
|Column             |Type       |Options              |
|id                 |integer    |PRIMARY KEY          |
|user               |integer    |FOREIGN KEY          |
|product_name       |string     |NOT NULL             |
|detail             |string     |NOT NULL             |
|category_id        |integer    |NOT NULL             |
|state_id           |integer    |NOT NULL             |
|burden_id          |integer    |NOT NULL             |
|area_id            |integer    |NOT NULL             |
|shipping_day_id    |integer    |NOT NULL             |
|price              |integer    |NOT NULL             |

### Association
users(一)    と addresses(多)
users(一)    と purchases(多)
users(一)    と productes(多)
products(一) と purchases(多)

