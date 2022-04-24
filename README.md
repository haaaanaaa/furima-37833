# テーブル設計

## users テーブル
| Column               | Type   | Options                  |
| -----------          | ------ | -----------              |
| nickname             | string | null: false              |
| email                | string | null: false, unique: true|
| encrypted_password   | string | null: false              |
| first_name           | string | null: false              |
| last_name            | string | null: false              |
| first_name_kana      | string | null: false              |
| last_name_kana       | string | null: false              |
| birthday             | date   | null: false              |

### Association

<!-- - has_many :products -->
<!-- - has_many :purchases -->


## products テーブル
| Column                 | Type       | Options                        |
| -------------------    | ---------- | -----------                    |
| name                   | string     | null: false                    |
| image                  | string     | null: false                    |
| explanation            | text       | null: false                    |
| category_id            | integer    | null: false                    |
| delivery_fee_id        | integer    | null: false                    |
| status_id              | integer    | null: false                    |
| prefecture_id          | integer    | null: false                    |
| shipping_days_id       | integer    | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true | 


### Association

- belongs_to :user
- has_one :purchase



## purchases テーブル
| Column        | Type          | Options                        |
| ------------- | -------       | ------------------------------ |
| product       | references    | null: false, foreign_key: true |
| user          | references    | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :product
- has_one :address




## addresses テーブル

| Column          | Type       | Options                        |
| ------------- | ----------   | ------------------------------ |
| postal_code   | string       | null: false                    |
| prefecture_id | integer      | null: false                    |
| municipality  | string       | null: false                    |
| address       | string       | null: false                    |
| building_name | string       |                                |
| phone_number  | string       | null: false                    |
| item_purchase |  references  | null: false, foreign_key: true |

### Association

belongs_to :purchase

