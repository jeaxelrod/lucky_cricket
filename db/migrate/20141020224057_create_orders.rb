class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.text :comments
      t.integer :product_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
