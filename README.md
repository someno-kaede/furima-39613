# README

# 追加した機能
-ユーザーフォロー機能
-商品のお気に入り機能
-カテゴリー別詳細ページ


## Tabel名

## users
|Column             |Type       |Options                        |
|-------------------|-----------|-------------------------------|
|nickname           |string     |null: false                    |
|email              |string     |null: false, unique: true      |
|encrypted_password |string     |null: false                    |
|first_name         |string     |null: false                    |
|last_name          |string     |null: false                    |
|reading_first_name |string     |null: false                    |
|reading_last_name  |string     |null: false                    |
|birthday           |date       |null: false                    |

### Association
- has_many :purchases
- has_many :productes

## addresses
|Column             |Type       |Options                        |
|-------------------|-----------|-------------------------------|
|purchase           |references |null: false, foregin_key: true |
|post_code          |string     |null: false                    |
|prefecture_id      |integer    |null: false                    |
|municipalities     |string     |null: false                    |
|area               |string     |null: false                    |
|building_name      |string     |                               |
|telephone          |string     |null: false                    |

### Association
- belongs_to :purchase

## purchases
|Column             |Type       |Options                        |
|-------------------|-----------|-------------------------------|
|user               |references |null: false, foregin_key: true |
|product            |references |null: false, foregin_key: true |

### Association
- has_one: address
- belongs_to :user
- belongs_to :product

## products
|Column             |Type       |Options                        |
|-------------------|-----------|-------------------------------|
|user               |references |null: false, foregin_key: true |
|product_name       |string     |null: false                    |
|detail             |text       |null: false                    |
|category_id        |integer    |null: false                    |
|state_id           |integer    |null: false                    |
|burden_id          |integer    |null: false                    |
|prefecture_id      |integer    |null: false                    | 
|shipping_day_id    |integer    |null: false                    |
|price              |integer    |null: false                    |

### Association
- belongs_to :user
- has_one :purchase

