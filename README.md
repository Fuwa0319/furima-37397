# Furima

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| nickname           | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthdate_year     | integer | null: false               |
| birthdate_month    | integer | null: false               |
| birthdate_day      | integer | null: false               |

### Association
- has_many :items


## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| image        | text       | null: false                    |
| content      | text       | null: false                    |
| category     | integer    | null: false                    |
| status       | integer    | null: false                    |
| ship_charge  | integer    | null: false                    |
| ship_area    | integer    | null: false                    |
| days_to_ship | integer    | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :order


## orders テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| postal_code      | integer    | null: false                    |
| prefecture       | integer    | null: false                    |
| cell_hone_number | integer    | null: false                    |
| item             | references | null: false, foreign_key: true |

### Association
- belongs_to :item
