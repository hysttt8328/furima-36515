class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :category_id
      t.integer :status_id
      t.integer :delivery_charge_id
      t.integer :prefecture_id
      t.integer :scheduled_id
      t.integer :price
      t.references :user

      t.timestamps
    end
  end
end
