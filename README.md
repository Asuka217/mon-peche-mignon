# README

* アプリケーション名

Mon péché mignon
<br>(モン　ペッシェ　ミニョン)</br>

* アプリケーション概要

* 本番環境

 デプロイ先：Capistrano
 URL：http://13.114.192.245/
 ※Basic認証を導入しています。
  ・ID: adminuser
  ・ Password: kuma1234

* テスト用のアカウント

* 制作背景


* DEMO

* 工夫したポイント

* 今後、実装予定の機能

* DB設計

## usersテーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| sex_id          | integer | null: false |
| age_id          | integer | null: false |
| figure_id       | integer | null: false |

### Association

- has_many :trainings
- belongs_to_active_hash :sex
- belongs_to_active_hash :age
- belongs_to_active_hash :figure


## trainingsテーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| goal       | text       | null: false |
| reward     | string     | null: false |
| date_start | date    | null: false |
| user       | references | foreign_key |

### Association

- belongs_to :user
- has_one :achievement
- belongs_to_active_hash :period


## achievement

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| result    | text       | null: false |
| period_id | integer    | null: false |
| training  | references | foreign_key |

## Association

- belongs_to :training
- belongs_to_active_hash :period


* ローカルでの動作方法


