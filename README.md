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
# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | unique: true|
| encrypted_password | string | null: false |
|surname_kanji       |string  | null: false |
|name_kanji          |string  | null: false |
|surname_katakana    |string  | null: false |
|name_katakana       |string  | null: false |
|birthday            |date    | null: false |
### Association

- has_many :items
- has_many :purchases


##  itemsテーブル

| Column            | Type          | Options          |
| ------            | --------      | -----------      |
|itemes_name        |string         |null:false        |
| text              | text          |null: false       |
|user               |references     |foreign_key: true |
|category_id        |integer        |null: false       |
|condition_id       |integer        |null: false       |
|delivery_charge_id |integer        |null: false       |
|delivery_area_id   |integer        | null: false      |
|day_to_ship_id     |integer        |null: false       |
|price              |integer        |null: false       |

### Association

- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column         | Type       |   Options                            
| ------         | ---------- | ------------------------------ 
| item           | references | foreign_key: true             |
| user           | references | foreign_key: true             |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address
## addressesテーブル

| Column        | Type      | Options          |
| ------        | --------  | -----------      |
|postal_code    |string     |null:false        |
|prefecture_id  |integer    |null:false        | 
|municipality   |string     |null:false        |
|house number   |integer    |null:false        |
|building name  |string     |                  |
|phone number   |string     |null:false        |
|purchase       |references |foreign_key: true |
### Association
- belongs_to : purchase