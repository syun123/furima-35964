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
| email              | string | null: false |
| encrypted_password | string | null: false |
|name_kanji          |string  | null: false |
|name_katakana       |string  | null: false |
|birthday            | text   | null: false |
### Association

- has_many :items
- has_many :purchases


##  itemsテーブル

| Column         | Type          | Options     |
| ------         | --------      | ----------- |
|image           | ActiveStorage | null: false|
|itemes_name     |string         |null:false  |
| text           | text          |null: false  |
|user            |references     |foreign_key: true
|category        |string         |null: false
|condition       |string         |null: false
|delivery_charge |integer        |null: false
|delivery_area   |string         | null: false
|day_to_ship     |integer        |null: false
|prices          |integer        |null: false

### Association

- belongs_to :users
- has_one :purchases


## purchases テーブル

| Column         | Type       |   Options                            
| ------         | ---------- | ------------------------------ 
| item           | references | foreign_key: true                |
| user           | references | foreign_key: true             |

### Association

- belongs_to :items
- belongs_to :users
- has_one :addresses
## addressesテーブル

| Column        | Type      | Options     |
| ------        | --------  | ----------- |
|postal_code    |integer    |null:false
|prefecture     |string     |null:false
|municipality   |string     |null:false
|address        |integer    |null:false
|building name  |string     |null:false
|phone number   |integer    |null:false
|purchase       |references |foreign_key: true
### Association
- belongs_to : purchases