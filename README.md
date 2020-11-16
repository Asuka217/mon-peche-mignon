# README

# アプリケーション名

Mon péché mignon
<br>(モン　ペッシェ　ミニョン)</br>

# アプリケーション概要

このアプリケーションは、筋トレを行うためのものです。
<br>まず、ユーザー登録を行い、マイページから筋トレの目標、期間、達成後のごほうびの画像を投稿します。
<br>目標が達成したら、完了報告を他のユーザーに向けて行うこともできます。


# 本番環境

 デプロイ先：Capistrano
 <br>URL：http://13.114.192.245/
 <br>※Basic認証を導入しています
  <br>* ID: adminuser
  <br>* Password: kuma1234

# テスト用のアカウント

* Email: test@test<br> 
* Password: kuma1234

# 制作背景
筋トレの目標をたてても挫折してしまうことが自分自身あり、挫折をしないためにはどうすればよいのか、と考えた結果、達成後のごほうびを設定できれば、モチベーションも保てて成功するのではないか、と考えたことから作成をしました。

# DEMO
* TOP画面からマイページのビュー
<br>https://gyazo.com/ebf33ee402c131b0d9daa5256813bc7d
* 目標を新規投稿した際の流れ
<br>https://gyazo.com/b0b7a2823f120b103c96d15cd7222eb4

# 工夫したポイント

* AWSを使うことで、一定時間経っても画像が消えないようにしました。
* 当初はHeroku上にデプロイをしていましたが、Capistranoへ自動デプロイを行うように変更をしました。
* エラーメッセージをデフォルトの英語から日本語へ表示さえるように変更をしました。
* 投稿した目標が、それぞれのどのような状態(達成済みなのか、進行中なのか)かを明確にさせるために、CSSでリボンをつけてわかりやすい表示にしました。

# 使用技術

* HTML
* CSS
* Ruby
* Ruby on Rails
* MySQL
* AWS
* Capistrano


# 今後、実装予定の機能

今後、いいね機能、SNSログイン認証機能の導入を検討しています。

# DB設計

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
- has_many :achievements
- belongs_to_active_hash :sex
- belongs_to_active_hash :age
- belongs_to_active_hash :figure


## trainingsテーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| goal       | text       | null: false |
| reward     | string     | null: false |
| date_start | date       | null: false |
| user       | references | foreign_key |

### Association

- belongs_to :user
- has_one :achievement


## achievement

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| report    | text       |             |
| date_end  | date       | null: false |
| training  | references | foreign_key |

## Association

- belongs_to :training
- belongs_to :user
