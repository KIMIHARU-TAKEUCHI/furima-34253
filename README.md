## users テーブル

|Column-----------|Type--|Options----|
| ----------------| ---- | --------- |
|nickname---------|string|null: false|
|first_name-------|string|null: false|
|family_name------|string|null: false|
|first_name_kana--|string|null: false|
|family_name_kana-|string|null: false|
|email------------|string|null: false,unique:true,index:true|
|encrypted_password|string|null: false|
|birth_data-------|string|null: false|

### Association

- has_many :items
- has_many :orders

## items テーブル

|Column------------|Type--|Options----|
| -----------------| ---- | --------- |
|name_id-----------|string|null: false|
|item_condition_id-|integer|null: false|
|preparation_day_id|integer|null: false|
|postage_type_id---|integer|null: false|
|postage_payer_id--|integer|null: false|
|category_id-------|integer|null: false|
|price-------------|string|null: false|

### Association

- belongs_to :users
- belongs_to :category
- has_one :orders
- belongs_to_active_hash:item_condition
- belongs_to_active_hash:postage_type
- belongs_to_active_hash:postage_ppayer

## items_conditions(active_hash) テーブル

|Column--------|Type--|Options----|
| -------------| ---- | --------- |
|item_condition|integer|null: false|

### Association
- has_many :items

## preparation_days(active_hash) テーブル

|Column---------|Type--|Options----|
| --------------| ---- | --------- |
|preparation_day|integer|null: false|

### Association
- has_many :items

## postage_types(active_hash) テーブル

|Column---------|Type--|Options----|
| --------------| ---- | --------- |
|postage_type---|integer|null: false|

### Association
- has_many :items

## categoris テーブル

|Column-----|Type--|Options----|
| ----------| ---- | --------- |
|category---|string|null: false|

### Association
- has_many :items

## Orders テーブル

|Column----|Type--|Options----|
| -------- | ---- | --------- |
|user------|string|null: false|

### Association

- belong_to :users
- belong_to :items
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

- belong_to :orders