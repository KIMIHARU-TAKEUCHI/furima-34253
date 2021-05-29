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
## users テーブル

|Column----|Type--|Options----|
| -------- | ---- | --------- |
|name------|string|null: false|
|email-----|string|null: false|
|password--|string|null: false|

### Association

- has_many :items
- has_many :orders

## items テーブル

|Column----|Type--|Options----|
| -------- | ---- | --------- |
|name------|string|null: false|
|category--|string|null: false|
|price-----|string|null: false|

### Association

- belongs_to :users
- has_one :orders

## Orders テーブル

|Column----|Type--|Options----|
| -------- | ---- | --------- |
|user------|string|null: false|

### Association

- belongs_to :users
- belongs_to :items
- has_one :address

## address テーブル

|Column----------|Type--|Options----|
| -------------- | ---- | --------- |
|first_name------|string|null: false|
|family_name-----|string|null: false|
|first_name_kana-|string|null: false|
|family_name_kana|string|null: false|
|post_code-------|string|null: false|
|city------------|string|null: false|
|house_number----|string|null: false|
|building_name---|string|null: false|
|phone_number----|string|null: false|

### Association

- belongs_to :orders