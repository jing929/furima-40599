# README

## usersテーブル
| Column           | Type      | Options                   |
| ---------------- | --------- | ------------------------- |
| nickname         | string    | null: false               |
| email            | string    | null: false, unique: true |
| encrypted_password  | string | null: false |
| first_name       | string    | null: false |
| last_name        | string    | null: false |
| first_name_kana  | string    | null: false |
| last_name_kana   | string    | null: false |
| birthday         | date      | null: false |

### Association

- has_many :items
- has_many :orders


## itemsテーブル
| Column           | Type      | Options                   |
| ---------------- | --------- | ------------------------- |
| item_name        | string    | null: false |
| description      | text      | null: false |
| category_id      | integer   | null: false |
| condition_id     | integer   | null: false |
| shipping_cost_id | integer   | null: false |
| prefecture_id    | integer   | null: false |
| shipping_day_id  | integer   | null: false |
| price            | integer   | null: false |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :category
- belongs_to :condition
- belongs_to :prefecture
- belongs_to :shipping_cost
- belongs_to :shipping_day
- belongs_to :user

<!-- DB設計としてはactivestorageのアソシエーションは記載しなくても問題ない
- has_one_attached :images -->
- has_one :order


## ordersテーブル
| Column           | Type      | Options                   |
| ---------------- | --------- | ------------------------- |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

- has_one :address

## addressesテーブル
| Column           | Type      | Options                   |
| ---------------- | --------- | ------------------------- |
| postal_code      | string    | null: false |
| prefecture_id    | integer   | null: false |
| city             | string    | null: false |
| address          | string    | null: false |
| building         | string    |             |
| phone_number     | string    | null: false |
| order      | references | null: false, foreign_key: true |

### Association

- belongs_to :order




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
