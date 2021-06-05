## users テーブル

|Column-----------|Type--|Options----|
| ----------------| ---- | --------- |
|nickname---------|string|null: false|
|first_name-------|string|null: false|
|family_name------|string|null: false|
|first_name_kana--|string|null: false|
|family_name_kana-|string|null: false|
|email------------|string|null: false,unique:true|
|encrypted_password|string|null: false|
|birth_data-------|date---|null: false|

### Association

- has_many :items
- has_many :orders

## items テーブル

|Column------------|Type--|Options----|
| -----------------| ---- | --------- |
|name--------------|string|null: false|
|item_info---------|text---|null: false|
|item_condition_id-|integer|null: false|
|preparation_day_id|integer|null: false|
|postage_type_id---|integer|null: false|
|postage_payer_id--|integer|null: false|
|category_id-------|integer|null: false|
|item------|references|null: false, foreign_key: true|
|user--------------|references|null: false, foreign_key: true|

### Association

- belong_to :user
- belong_to :category
- has_one :order
- belong_to:item_condition
- belong_to:postage_type
- belong_to:postage_payer

## Orders テーブル

|Column----|Type--|Options----|
| -------- | ---- | --------- |
|items------|references|null: false, foreign_key: true|
|user------|references|null: false, foreign_key: true|

### Association

- belong_to :user
- belong_to :item
- has_one :address

## address テーブル

|Column----------|Type--|Options----|
| -------------- | ---- | --------- |
|post_code-------|string|null: false|
|city------------|string|null: false|
|house_number----|string|null: false|
|building_name---|string|-----------|
|phone_number----|string|null: false|

### Association

- belong_to :order