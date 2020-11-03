# README



* DB設計

## usersテーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| sex             | integer | null: false |
| age             | integer | null: false |
| figure          | integer | null: false |

### Association

- has_many :trainings
- belongs_to_active_hash :sex
- belongs_to_active_hash :age
- belongs_to_active_hash :figure


## trainingsテーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| goal   | text       | null: false |
| reward | string     | null: false |
| period | integer    | null: false |
| user   | references | foreign_key |

### Association

- belongs_to :user
- has_one :achievement
- belongs_to_active_hash :period


## achievement

| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| result   | text       | null: false |
| period   | integer    | null: false |
| training | references | foreign_key |

## Association

- belongs_to :training
- belongs_to_active_hash :period