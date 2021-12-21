# DB 設計

## users table
| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| nickname           | string              | null: false               |
| last_name          | string              | null: false               |
| first_name         | string              | null: false               |
| last_name_kana     | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birthday           | date                | null: false               |

### Association
* has_many :items
* has_many :orders


## items table
| Column             | Type                | Options                        |
|--------------------|---------------------|---------------------------     |
| image              |                     | ActiveStorageを使って実装        |
| name               | string              | null: false                    |
| description        | text                | null: false                    |
| category_id        | integer             | null: false                    |
| status_id          | integer             | null: false                    |
| delivery_charge_id | integer             | null: false                    |
| prefecture_id      | integer             | null: false                    |
| scheduled_id       | integer             | null: false                    |
| price              | integer             | null: false                    |
| user_id            | references          | null: false, foreign_key: true |

### Association
* belongs_to :user
* has_one :order


## orders table
| Column             | Type                | Options                        |
|--------------------|---------------------|---------------------------     |
| user_id            |references           | null: false, foreign_key: true |
| item_id            |references           | null: false, foreign_key: true |

### Association
* belongs_to :user
* belongs_to :item
* has_one :delivery_address


## delivery_addresses table
| Column             | Type                | Options                        |
|--------------------|---------------------|---------------------------     |
| post_code          |string               | null: false,                   |
| prefecture_id      |integer              | null: false,                   |
| city               |string               | null: false,                   |
| house_number       |string               | null: false,                   |
| building_name      |string               |                                |
| telephone_number   |string               | null: false,                   |

### Association
* has_one :order