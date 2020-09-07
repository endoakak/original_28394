# README

# アプリ名
テイルズ「物語への愛を語るサイト」

<img width="1437" alt="スクリーンショット 2020-09-07 19 07 49" src="https://user-images.githubusercontent.com/68261473/92376383-736c5500-f13d-11ea-8965-13dabddfafa0.png">

<br>

# 概要
小説、映画、マンガ、アニメの４ジャンルについて、ユーザーが好きな作品の好きなところを自由に語ることができます。   
他のユーザーの投稿も見られ、リアクションを送ることができます。

<br>

# 使用技術
- HTML
- CSS
- Ruby 2.6.5
- Ruby on Rails 6.0.3.2
- JavaScript
- Bootstrap5
- AWS (EC2, Route 53, ACM, ELB)
- VSCode (Visual Studio Code)
- GitHub

### 使用しているgem
後日追記予定

<br>

# 本番環境
AWSにデプロイしています。  
こちらからアクセスできます。  
https://tales-monogatari.com/

トップページまたはヘッダーのログインボタンからログインしてください。

＜テストユーザー用アカウント＞  
メールアドレス：monogatari@test1  
パスワード：monogatari1

新規登録から新しいアカウントを作成していただいても構いません。

<br>

# 制作背景(意図)
このサイトを作成した背景をご説明します。

### 好きな作品について、気軽に語れる場を作りたい
→Twitterやブログでは日々の継続が必要。どうしても語りたい欲が高まったときだけ語れる場所を作りたかった。

### 複数のジャンルにまたがった感想共有サイトが欲しい
→映画のレビューサイト、小説のレビューサイトなどはあるが、それらを一つにまとめたサイトが欲しかった。

### 作品に対するネガティブなレビューを見たくない
→レビューサイトでは作品に対するネガティブな批判も存在するが、そのようなものが目に入らないサイトを作りたかった。

### 優しい世界を作りたい
→好きなものを語る場なら、ポジティブな感情に溢れるはず。さらにコメント機能がないので批判や暴言が生まれない。

<br>

# 機能の紹介
このサイトの主な機能をご紹介します。特に見ていただきたいこだわりポイントには、⭐︎マークがついています。

## トップページ
トップページです。ログインしていなければ新規登録・ログインボタン、ログインしていればログアウトボタンが表示され、どちらの場合も投稿一覧ページへのボタンが表示されます。

スクロールすると、このサイトの特徴が記されています。

![top-page改](https://user-images.githubusercontent.com/68261473/92362732-66466a80-f12b-11ea-963c-400a3d79e396.gif)



## 新規登録・ログイン
ユーザーの新規登録、ログインができます。ユーザーの管理にはdeviseを使用しています。

<img width="1436" alt="新規登録画面" src="https://user-images.githubusercontent.com/68261473/92362241-a6f1b400-f12a-11ea-8d4b-b0ab52d1199f.png">

<img width="1440" alt="ログイン画面" src="https://user-images.githubusercontent.com/68261473/92362268-b40ea300-f12a-11ea-80e4-855e01daa639.png">


## 投稿一覧表示
投稿の一覧を表示する画面です。
全ての投稿が新しいものから順に表示されます。  

ヘッダーの各ジャンルをクリックすることで、各ジャンルごとに投稿を表示することもできます。

投稿をクリックすると、投稿の詳細ページへ飛びます。

自分の投稿には編集ボタンおよび削除ボタンが表示され、編集や削除をすることができます。

![posts-index](https://user-images.githubusercontent.com/68261473/92363178-12885100-f12c-11ea-8abd-ff9448da0712.gif)


## ⭐︎ネタバレ非表示機能
「ネタバレを含む投稿を非表示にする」にチェックを入れると、ネタバレを含む投稿を非表示にできます。その後チェックを外すと再度表示されます。

![posts-spoiler](https://user-images.githubusercontent.com/68261473/92363928-4021ca00-f12d-11ea-9d99-0aa2866d8ba7.gif)


## 作品検索機能
作品を検索する機能です。ヘッダーの検索フォームにキーワードを入力し、検索ボタンを押すと、作品のタイトルにキーワードを含む投稿が表示されます。

![posts-search](https://user-images.githubusercontent.com/68261473/92364369-ef5ea100-f12d-11ea-82bd-8241d2cd4867.gif)

## 新規投稿
新規投稿画面です。

作品のタイトル、カテゴリー、ネタバレの有無、本文を入力して、「投稿する！」ボタンをクリックします。

![screencapture-tales-monogatari-posts-new-2020-09-07-17_47_20](https://user-images.githubusercontent.com/68261473/92368131-46667500-f132-11ea-90b6-71f7b1e742e6.png)


## ⭐︎リアクションボタン
投稿に対してリアクションをすることができます。Twitterのいいね！のような機能です。

コメント機能をつけないため、このリアクションボタンが唯一のユーザー間の交流機能となります。   
そのためいいねだけではなく、3種類のリアクションを用意しました。

初めは灰色のボタンが表示され、クリックすると青色に変わります。ボタンの横にはその投稿に対するリアクションの総数が表示されます。

ログインしていないユーザーは、投稿を見ることはできますがリアクションボタンを押すことはできません。

![post-reaction](https://user-images.githubusercontent.com/68261473/92369340-d822b200-f133-11ea-965b-f0ca9b39cbb1.gif)


## ⭐︎お問い合わせフォーム
ユーザーからの問い合わせを受けるため、お問い合わせフォームを用意しました。

フッターの「お問い合わせ」からフォーム入力画面へ移動します。   
フォームを入力し、確認画面を経て送信します。   
送信されたお問い合わせ内容は、管理人にメールで送られます。

※テストでお問い合わせを送っていただいて構いませんが、その場合はテストだとわかるような内容でお願いします。

![inquiry](https://user-images.githubusercontent.com/68261473/92370038-b7a72780-f134-11ea-9ddc-a46230fb7283.gif)


## 管理画面
管理画面です。

管理人がユーザーや投稿の一覧を閲覧・編集・削除することができます。

実装にはactive_adminを使用しました。

※こちらは管理人以外アクセスできません。

<img width="1438" alt="スクリーンショット 2020-09-07 18 12 06" src="https://user-images.githubusercontent.com/68261473/92370747-ab6f9a00-f135-11ea-9316-22832e59f1ff.png">


## ⭐︎https通信
ユーザーに安心して使っていただくため、https通信ができるようにしました。

ACMからSSL証明書を発行し、クライアントとELB間の通信をhttpsにしています。

<br>

# 課題や今後実装したい機能

### レスポンシブ対応
スマホからの使用が想定されるため、スマホ画面に対応したレイアウトにしたい

### ユーザー目線のUI/UX
デザインの知識をつけて、ページの与える印象やユーザーの使いやすさを改善したい

### ユーザー間の交流
コンセプトがずれない範囲で、ユーザー間の交流手段を増やしたい

<br>

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
