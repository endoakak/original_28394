# README

##アプリ名
テイルズ
~好きな物語を語るサイト~

##概要
小説、映画、マンガ、アニメの４ジャンルについて、ユーザーが好きな作品の好きなところを自由に語ることができます。
他のユーザーの投稿も見られ、リアクションを送ることができます。

##本番環境(デプロイ先　テストアカウント＆ID)
AWSを用いてデプロイしています。
こちらからアクセスできます。
https://tales-monogatari.com/

トップページまたはヘッダーのログインボタンからログインできます。

テストユーザー用アカウント
メールアドレス：monogatari@test1
パスワード：monogatari1

新規登録から新しいアカウントを作成していただくこともできます。

・制作背景(意図)
　⇒どんな課題や不便なことを解決するためにこのアプリを作ったのか。
・DEMO(gifで動画や写真を貼って、ビューのイメージを掴んでもらいます)
　⇒特に、デプロイがまだできていない場合はDEMOをつけることで見た目を企業側に伝えることができます。
・工夫したポイント
　⇛こちらもGIFを使用してわかりやすく
・使用技術(開発環境)
・課題や今後実装したい機能
・DB設計

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association
- has_many :posts
- has_many :reactions


## posts テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| title       | string     | null: false |
| content     | text       | null: false |
| spoiler     | boolean    | null: false, default: true |
| category_id | integer    | null: false |
| user_id     | references | foreign_key: true |

### Association
- belongs_to :user
- has_many :reactions


## reactions テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| comment_id | integer    | null: false |
| user_id    | references | foreign_key: true |
| post_id    | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :post
