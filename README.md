# テーブル設計

# usersテーブル

| Column     | Type     | Options     |
| ---------- | -------- | ----------- |
| first_name | string   | null: false |
| last_name  | string   | null: false |
| email      | string   | null: false |
| password   | string   | null: false |
| birth_day  | datetime | null: false |

### Association

- has_many :products
- has_many :comments
- has_many :buys
- has_many :destinations

# productsテーブル

| Column          | Type     | Options     |
| --------------- | -------  | ----------- |
| name            | string   | null: false |
| category        | string   | null: false |
| price           | integer  | null: false |
| seller          | string   | null: false |
| status          | string   | null: false |
| shipment_source | integer  | null: false |
| date_shipment   | integer  | null: false |
| image           | string   | null: false |
| explanation     | string   | null: false |

### Association

- has_many :comments
- belongs_to :user
- belongs-to :buy


# commentsテーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| user_id     | integer | null: false |
| products_id | integer | null: false |
| text        | string  | null: false |

### Association

- belongs_to :user
- belongs_to :product

# buysテーブル

| Column           | Type     | Options     |
| ---------------- | -------  | ----------- |
| user_id          | integer  | null: false |
| products_id      | integer  | null: false |
| cord_information | integer  | null: false |
| expiration_date  | integer  | null: false |
| security_code    | integer  | null: false |

### Association

- belongs_to :user
- belongs_to :product
- belongs-to :address

# destinationsテーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| user_id      | integer | null: false |
| postal_code  | integer | null: false |
| prefecture   | string  | null: false |
| city         | string  | null: false |
| address      | integer | null: false |
| building     | string  | null: false |
| phone_number | integer | null: false |

### Association

- belongs_to :user
- belongs_to :buy