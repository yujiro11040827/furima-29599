# テーブル設計

# usersテーブル

| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| first_name         | string   | null: false |
| last_name          | string   | null: false |
| first_furigana     | string   | null: false |
| last_furigana      | string   | null: false |
| nickname           | string   | null: false |
| email              | string   | null: false |
| encrypted_password | string   | null: false |
| birth_day          | date     | null: false |

### Association

- has_many :products
- has_many :comments
- has_many :buys
- has_many :destinations

# productsテーブル

| Column             | Type     | Options         |
| ------------------ | -------  | ----------------|
| name               | string   | null: false     |
| category_id        | integer  | null: false     |
| price              | integer  | null: false     |
| user_id          | integer  | foreign_key: true |
| status_id          | integer  | null: false     |
| shipment_source_id | integer  | null: false     |
| date_shipment_id   | integer  | null: false     |
| explanation        | text     | null: false     |

### Association

- has_many :comments
- belongs_to :user
- has_one :buy


# commentsテーブル

| Column      | Type    | Options           |
| ----------- | ------- | ----------------- |
| user_id     | integer | foreign_key: true |
| products_id | integer | foreign_key: true |
| messsage    | string  | null: false       |

### Association

- belongs_to :user
- belongs_to :product

# buysテーブル

| Column           | Type     | Options           |
| ---------------- | -------  | ----------------- |
| user_id          | integer  | foreign_key: true |
| products_id      | integer  | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :address

# destinationsテーブル

| Column        | Type    | Options           |
| ------------- | ------- | ----------------- |
| buys_id       | integer | foreign_key: true |
| postal_code   | string  | null: false       |
| prefecture_id | integer | null: false       |
| city          | string  | null: false       |
| address       | string  | null: false       |
| building      | string  |                   |
| phone_number  | string  | null: false       |

### Association

- belongs_to :buy