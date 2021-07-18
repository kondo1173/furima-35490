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
| birthday           | datetime| null: false               |


### Association

- has_many :items
- has_many :accounts


## items テーブル

| Column              | Type          | Options           |
| -----------------   | ------------- | ----------------- |
| name                | string        | null: false       |
| info                | text          | null: false       |
| category            | integer       | null: false       |
| sale_status         | integer       | null: false       |
| shopping_fee_status | integer       | null: false       |
| prefecture          | integer       | null: false       |
| scheduled_delivery  | integer       | null: false       |
| price               | integer       | null: false       |
| user                | references    | foreign_key: true |

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

| Column      | Type       | Options          |
| ----------- | ---------- | ---------------- |
| account     | references |foreign_key: true |
| postal_code | string     | null: false      |
| prefecture  | integer    | null: false      |
| city        | string     | null: false      |
| adress      | string     | null: false      |
| building    | string     |                  |
| phone       | string     | null: false      |


### Association

- belongs_to :account


