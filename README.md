# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions


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