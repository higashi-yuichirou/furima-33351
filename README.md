# README

##usersテーブル

| Column          | Type    | Option      |
| --------------- | ------- | ----------- |
| email           | string  | null: false |
| nickname        | string  | null: false |
| password        | string  | null: false |
| first_name      | string  | null: false |
| last_name       | string  | null: false |
| kana_first_name | string  | null: false |
| kana_last_name  | string  | null: false |
| birth_date      | integer | null: false |

##listsテーブル

| Column        | Type       | Option      |
| ------------- | ---------- | ----------- |
| name          | string     | null: false |
| detail        | text       | null: false |
| image         |            |             |
| category      | integer    | null: false |
| status        | integer    | null: false |
| shipping_fee  | integer    | null: false |
| location      | integer    | null: false |
| shipping_date | integer    | null: false |
| price         | integer    | null: false |
| user          | references |             |

##adressesテーブル

| Column         | Type       | Option      |
| -------------- | ---------- | ----------- |
| post_code      | integer    | null: false |
| area           | integer    | null: false |
| city_number    | integer    | null: false |
| city           | string     | null: false |
| building_name  | string     | null: false |
| phone_number   | integer    | null: false |

##purchasesテーブル

| Column | Type       | Option |
| ------ | ---------- | ------ |
| user   | references |        |
| list   | references |        |
