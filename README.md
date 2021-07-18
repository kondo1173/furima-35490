# README
# テーブル設計


## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| password           | string  | null: false |
| kanjiname          | string  | null: false |
| katakananame       | string  | null: false |
| birthday           | integer | null: false |


### Association

- has_many :items
- has_many :accounts


## items テーブル

| Column                   | Type          | Options           |
| ----------------------   | ------------- | ----------------- |
| item-name                | string        | null: false       |
| item-info                | text          | null: false       |
| item-category            | string        | null: false       |
| item-sales-status        | string        | null: false       |
| item-shopping-fee-status | string        | null: false       |
| item-prefecture          | string        | null: false       |
| item-scheduled-delivery  | string        | null: false       |
| item-price               | integer       | null: false       |
| user                     | references    | foreign_key: true |

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
| postal-code | integer    | null: false      |
| prefecture  | string     | null: false      |
| city        | string     | null: false      |
| adress      | string     | null: false      |
| building    | string     |                  |
| phone       | integer    | null: false      |


### Association

- belongs_to :account


