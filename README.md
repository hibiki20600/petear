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

##userテーブル
|Column|Type|Options|
|------|----|-------|
|password|integer|null: false|
|name    |string |null: false|
|image   |text   |

### Association
- has_many :group_users
- has_many :groups, through :group_users
- has_many :messages

##groupテーブル
|Column|Type|Options|
|------|----|-------|
|name     |string |null: false|
|image    |text   |null: false|
|tag      |string |null: false|

### Association
- has_many :group_users
- has_many :users, through :group_users
- has_many :messages

##messageテーブル
|Column|Type|Options|
|------|----|-------|
|user  |references|foreign_key: true|
|group |references|foreign_key: true|
|message  |text   |null: false|
|image    |text   |
|good     |integer|default: 0|
|bad      |integer|default: 0|


### Association
- belongs_to :user
- belongs_to :group

＃＃groups_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id |integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
|index   |[:user_id, group_id]|unique: true|

### Association
- belongs_to :group
- belongs_to :user