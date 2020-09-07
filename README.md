# README

## アプリ名
テイルズ  
好きな物語を語るサイト

## 概要
小説、映画、マンガ、アニメの４ジャンルについて、ユーザーが好きな作品の好きなところを自由に語ることができます。
他のユーザーの投稿も見られ、リアクションを送ることができます。

## 使用技術(開発環境)
- HTML
- CSS
- Ruby on Rails 6.0.3.2
- Ruby 2.6.5p114
- JavaScript
- Bootstrap5
- AWS (EC2, Route 53, ACM)
- VSCode (Visual Studio Code)
- GitHub

## 本番環境(デプロイ先　テストアカウント)
AWSにデプロイしています。  
こちらからアクセスできます。  
https://tales-monogatari.com/

トップページまたはヘッダーのログインボタンからログインできます。

テストユーザー用アカウント  
メールアドレス：monogatari@test1  
パスワード：monogatari1

新規登録から新しいアカウントを作成していただいても構いません。

## 制作背景(意図)
このサイトを作成した背景をご説明します。

#### 好きな作品について、気軽に語れる場を作りたい
→Twitterやブログでは日々の継続が必要。どうしても語りたい欲が高まったときだけ語れる場所を作りたかった。

#### 複数のジャンルにまたがった感想共有サイトが欲しい
→映画のレビューサイト、小説のレビューサイトなどはあるが、それらを一つにまとめたサイトが欲しかった。

#### 作品に対するネガティブなレビューを見たくない
→レビューサイトでは作品に対するネガティブな批判も存在するが、そのようなものが目に入らないサイトを作りたかった。

#### 優しい世界を作りたい
→好きなものを語る場なら、ポジティブな感情に溢れるはず。さらにコメント機能がないので批判や暴言が生まれない。

## 機能の紹介
このサイトの主な機能をご紹介します。特に見ていただきたいこだわりポイントには、⭐︎マークがついています。

#### トップページ


#### 新規登録・ログイン

#### 投稿一覧表示

#### ネタバレ非表示機能

#### 作品検索機能

#### 新規投稿

#### リアクションボタン

#### お問い合わせフォーム

#### 管理画面


## 課題や今後実装したい機能
#### レスポンシブ対応
スマホからの使用が想定されるため、スマホ画面に対応したレイアウトにしたい
#### ユーザー目線のUI/UX
デザインの知識をつけて、ページの与える印象やユーザーの使いやすさを改善したい
#### ユーザー間の交流
コンセプトの範囲内で、ユーザー間の交流手段を増やしたい


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
