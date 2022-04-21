# テーブル設計

## users テーブル
| Column               | Type   | Options                  |
| -----------          | ------ | -----------              |
| nickname             | string | null: false              |
| email                | string | null: false, unique: true|
| encrypted_password   | string | null: false              |
| first_name           | string | null: false              |
| family_name          | string | null: false              |
| read_first           | string | null: false              |
| read_family          | string | null: false              |
| birth                | date   | null: false              |

### Association

- has_many :products
- has_many :item_purchases
- has_many :comments

## products テーブル
| Column                 | Type       | Options                        |
| -------------------    | ---------- | -----------                    |
| name                   | string     | null: false                    |
| explanation            | text       | null: false                    |
| category_id            | integer    | null: false                    |
| condition_id           | integer    | null: false                    |
| postage_type_id        | integer    | null: false                    |
| prefecture_id          | integer    | null: false                    |
| preparation_day_id     | integer    | null: false                    |
| value                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true | 


### Association

- belongs_to :user
- has_one :item_purchase
- has_many :comments
- belongs_to_active_hash :category_id
- belongs_to_active_hash :condition_id
- belongs_to_active_hash :postage_type_id
- belongs_to_active_hash :prefecture_id
- belongs_to_active_hash :preparation_day_id
- belongs_to :seller, class_name: "User"


## item_purchases テーブル
| Column        | Type          | Options                        |
| ------------- | -------       | ------------------------------ |
| product       | references    | null: false, foreign_key: true |
| user          | references    | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :product
- has_one :purchase_info


## comments テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| user    | integer    | null: false, foreign_key: true |
| product | integer    | null: false, foreign_key: true |

### Association

- belongs_to :product
- belongs_to :user

## purchase_info テーブル

| Column          | Type       | Options                        |
| ------------- | ----------   | ------------------------------ |
| postal_code   | string       | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city          | string       | null: false                    |
| address       | string       | null: false                    |
| building_name | string       |                                |
| phone_number  | string       | null: false                    |
| item_purchase | references   | null: false, foreign_key: true |

### Association

- has_one_active_hash :prefecture_id
- belongs_to :item_purchase

