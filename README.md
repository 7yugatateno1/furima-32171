+# DB 設計

# 雛形
|Column|Type|Options|

## users table

|Column              |Type  |Options                  |
|--------------------|------|-------------------------|
|name                |string|null: false              |
|email               |string|null: false, unique: true|
|encrypted_password  |string|null: false              |
|family_name         |string|null: false              |
|first_name          |string|null: false              |
|family_name_furigana|string|null: false              |
|first_name_furigana |string|null: false              |
|birthday            |date  |null: false              |


### Association

- has_many :items
- has_many :buy_record

## items table

|Column          |Type      |Options                        |
|----------------|----------|-------------------------------|
|name            |string    |null: false                    |
|text            |text      |null: false                    |
|category_id     |integer   |null: false                    |
|condition_id    |integer   |null: false                    |
|delivery_cost_id|integer   |null:false                     |
|sender_area_id  |integer   |null:false                     |
|delivery_day_id |integer   |null:false                     |
|price           |integer   |null:false                     |
|user            |references|null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :buy_record 

## buy_records table

|Column|Type      |Options                       |
|------|----------|------------------------------|
|user  |references|null: false, foreign_key: true|
|item  |references|null: false, foreign_key: true|

### Association

- belongs_to :user
- has_many :items
- has_one :destinations


## destinations table

|Column        |Type      |Options                       |
|--------------|----------|------------------------------|
|post_code     |string    |null:false                    |
|sender_area_id|string    |null:false                    |
|city          |string    |null:false                    |
|house_number  |string    |null:false                    |
|building      |string    |------------------------------|
|phone_number  |string    |null:false                    |
|buy_record    |references|null: false, foreign_key: true|

### Association

- belongs_to :buy_record