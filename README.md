# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| name               | string              | null: false               |
| profile            | text                | null: false               |
| occupation         | text                | null: false               |
| position           | text                | null: false               |

### Association

* has_many :prototypes
* has_many :comments