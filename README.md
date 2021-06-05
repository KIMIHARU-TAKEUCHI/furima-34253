## users テーブル

|Column-----------|Type--|Options----|
| ----------------| ---- | --------- |
|nickname---------|string|null: false|
|first_name-------|string|null: false|
|family_name------|string|null: false|
|first_name_kana--|string|null: false|
|family_name_kana-|string|null: false|
|email------------|string|null: false,unique:true|
|encrypted_password|string|null: false,foreign_key: true|
|birth_data-------|date---|null: false|

### Association

- has_many :items
- has_many :orders

## items テーブル

|Column------------|Type--|Options----|
| -----------------| ---- | --------- |
|image--------------|string|null: false|
|name--------------|string|null: false|
|item_info---------|string|null: false|
|item_condition_id-|integer|null: false|
|preparation_day_id|integer|null: false|
|postage_type_id---|integer|null: false|
|postage_payer_id--|integer|null: false|
|category_id-------|integer|null: false|
|price-------------|integer|null: false|

### Association

- belong_to :users, foreign_key: true
- belong_to :category
- has_one :order,foreign_key: true
- belong_to:item_condition
- belong_to:postage_type
- belong_to:postage_payer

## items_conditions テーブル

|Column--------|Type--|Options----|
| -------------| ---- | --------- |
|item_condition|integer|null: false|

### Association
- has_many :items

## preparation_days テーブル

|Column---------|Type--|Options----|
| --------------| ---- | --------- |
|preparation_day|integer|null: false|

### Association
- has_many :items

## postage_types テーブル

|Column---------|Type--|Options----|
| --------------| ---- | --------- |
|postage_type---|integer|null: false|

### Association
- has_many :items

## categories テーブル

|Column-----|Type--|Options----|
| ----------| ---- | --------- |
|category---|string|null: false|

### Association
- has_many :items

## Orders テーブル

|Column----|Type--|Options----|
| -------- | ---- | --------- |
|user------|string|null: false, foreign_key: true|

### Association

- belong_to :users
- belong_to :items
- has_one :address

## address テーブル

|Column----------|Type--|Options----|
| -------------- | ---- | --------- |
|post_code-------|string|null: false|
|prefectural-----|integer|null: false|
|city------------|string|null: false|
|house_number----|string|null: false|
|building_name---|string|-----------|
|phone_number----|string|null: false|

### Association

- belong_to :orders