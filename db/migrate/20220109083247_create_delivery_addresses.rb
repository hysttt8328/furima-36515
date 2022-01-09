class CreateDeliveryAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_addresses do |t|
      t.integer :prefecture_id
      t.string :city

      t.timestamps
    end
  end
end
