+# DB 設計

# 雛形
|Column|Type|Options|

## users table

|Column              |Type  |Options                  |
|--------------------|------|-------------------------|
|name                |string|null: false              |
|email               |string|null: false, unique: true|
|password            |string|null: false              |
|family_name         |string|null: false              |
|first_name          |string|null: false              |
|family_name_furigana|string|null: false              |
|first_name_furigana |string|null: false              |
|birthday            |date  |null: false              |


### Association

- has_many :items, dependent: :destroy, foreign_key: :items
- has_one :buy_record, dependent: :destroy

## items table

|Column          |Type      |Options                        |
|----------------|----------|-------------------------------|
|name            |string    |null: false, index: true       |
|text            |text      |null: false                    |
|category_id     |integer   |null: false, foreign_key: true |
|condition_id    |integer   |null: false, foreign_key: true |
|delivery_cost_id|integer   |null:false, default: 0         |
|delivery_days_id|integer   |null:false, default: 0         |
|price           |integer   |null:false                     |
|user            |references|null: false, foreign_key: true |

### Association

- belongs_to :user

## buy_record table

|Column|Type      |Options                       |
|------|----------|------------------------------|
|user  |references|null: false, foreign_key: true|
|item  |references|null: false, foreign_key: true|

### Association

- belongs_to :user

## destination table

|Column      |Type  |Options                       |
|------------|------|------------------------------|
|post_code   |string|null:false                    |
|prefectures |string|null:false                    |
|city        |string|null:false                    |
|house_number|string|null:false                    |
|building    |string|------------------------------|
|phone_number|string|------------------------------|
|buy_record  |string|null: false, foreign_key: true|

### Association

- belongs_to :user