# DB 設計

# 雛形
|Column|Type|Options|

## users table(ユーザー情報テーブル)

|Column  |Type  |Options                  |
|--------|------|-------------------------|
|name    |string|null: false              |
|email   |string|null: false, unique: true|
|password|string|null: false              |

### Association

- has_many :items, dependent: :destroy, foreign_key: :items
- has_one :buy_record, dependent: :destroy

## items table(商品情報テーブル)

|Column       |Type  |Options                            |
|-------------|----------|-------------------------------|
|name         |string    |null: false, index: true       |
|text         |text      |null: false                    |
|category     |references|null: false, foreign_key: true |
|delivery_cost|integer   |null:false, default: 0         |
|delivery_days|integer   |null:false, default: 0         |
|price        ||integer  |null:false                     |
|seller       |references|null: false, foreign_key: true |
|buyer        |references|foreign_key: true              |

### Association

- belongs_to :user

## buy_record table(購入記録テーブル)

|Column   |Type      |Options|
|---------|----------|-------|
|buyer    |references|-------|
|buy_items|references|-------|

### Association

- belongs_to :user

## destination table(発送先情報テーブル)

|Column      |Type   |Options   |
|------------|-------|----------|
|post_code   |integer|null:false|
|prefectures |string |null:false|
|city        |string |null:false|
|house_number|string |null:false|
|building    |string |----------|
|phone_number|integer|----------|

### Association

- belongs_to :user
