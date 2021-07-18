# README
# テーブル設計


## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| kanji_lastname     | string  | null: false               |
| kanji_firstname    | string  | null: false               |
| katakana_lastname  | string  | null: false               |
| katakana_firstname | string  | null: false               |
| birthday           | date    | null: false               |


### Association

- has_many :items
- has_many :accounts


## items テーブル

| Column                 | Type          | Options           |
| -------------------    | ------------- | ----------------- |
| name                   | string        | null: false       |
| info                   | text          | null: false       |
| category_id            | integer       | null: false       |
| sales_status_id        | integer       | null: false       |
| shopping_fee_status_id | integer       | null: false       |
| prefecture_id          | integer       | null: false       |
| scheduled_delivery_id  | integer       | null: false       |
| price                  | integer       | null: false       |
| user                   | references    | foreign_key: true |

### Association

- belongs_to :user
- has_one :account


## accounts テーブル

| Column   | Type       | Options          |
| -------- | ---------- | ---------------- |
| user     | references |foreign_key: true |
| item     | references |foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :destination


## destinations テーブル

| Column         | Type       | Options          |
| -------------- | ---------- | ---------------- |
| account        | references |foreign_key: true |
| postal_code    | string     | null: false      |
| prefecture_id  | integer    | null: false      |
| city           | string     | null: false      |
| adress         | string     | null: false      |
| building       | string     |                  |
| phone          | string     | null: false      |


### Association

- belongs_to :account


