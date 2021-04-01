class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :name, null: false
      t.text :detail, null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :shipping_fee_id, null: false
      t.integer :location_id, null: false
      t.integer :shipping_date_id, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
