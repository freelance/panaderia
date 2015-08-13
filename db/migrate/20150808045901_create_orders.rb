class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :client_id
      t.datetime :checked_out_at
      t.decimal :total_price
      t.integer :store_id

      t.timestamps null: false
    end
    add_index :orders, :user_id
    add_index :orders, :checked_out_at
  end
end
