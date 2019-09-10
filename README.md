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

* ...

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password| |null: false|

### Association
- has_many :posts
- has_many :likes
- has_many :comments

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|caption|string|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :photos
- has_many :comments
- has_many :likes

## photosテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|post|references|null: false, foreign-key: true|

### Association
- belongs_to :post


## likesテーブル
|Column|Type|Options|
|------|----|-------|
|post|references|null: false, foreign-key: true|
|user|references|null: false, foreign-key: true|

### Association
- belongs_to :post
- belongs_to :user

## commentsテーブルOK
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|post|references|null: false, foreign-key: true|
|user|references|null: false, foreign-key: true|

### Association
- belongs_to :post
- belongs_to :user