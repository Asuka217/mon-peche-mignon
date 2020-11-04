# README

* アプリケーション名

Mon péché mignon
(モン　ペッシェ　ミニョン)

* アプリケーション概要

* URL

* テスト用のアカウント

* 利用方法

* 目指した課題解決

* 洗い出した要件定義

* 実装した機能についての説明(GIF添付)

* 実装予定の機能

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


