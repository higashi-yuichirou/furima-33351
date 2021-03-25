# README

##usersテーブル
###Association
- has_many :lists
- has_many :purchases

| Column             | Type    | Option       |
| ------------------ | ------- | ------------ |
| email              | string  | unique: true |
| nickname           | string  | null: false  |
| encrypted_password | string  | null: false  |
| first_name         | string  | null: false  |
| last_name          | string  | null: false  |
| kana_first_name    | string  | null: false  |
| kana_last_name     | string  | null: false  |
| birth_date         | date    | null: false  |

##listsテーブル
###Association
- belongs_to :user
- has_one :purchase

| Column           | Type       | Option            |
| ---------------- | ---------- | ----------------- |
| name             | string     | null: false       |
| detail           | text       | null: false       | 
| category_id      | integer    | null: false       |
| status_id        | integer    | null: false       |
| shipping_fee_id  | integer    | null: false       |
| location_id      | integer    | null: false       |
| shipping_date_id | integer    | null: false       |
| price            | integer    | null: false       |
| user             | references | foreign_key: true |

##adressesテーブル
###Association
- has_one :purchase

| Column         | Type       | Option      |
| -------------- | ---------- | ----------- |
| post_code      | string     | null: false |
| area           | integer    | null: false |
| city_number    | integer    | null: false |
| city           | string     | null: false |
| building_name  | string     |             |
| phone_number   | integer    | null: false |

##purchasesテーブル
###Association
- belongs_to :user
- has_one :list
- has_one :adress

| Column | Type       | Option                  |
| ------ | ---------- | ----------------------- |
| user   | references | foreign_key: true       |
| list   | references | foreign_key: true       |
