class CreateClientsProducts < ActiveRecord::Migration
  def change
    create_table :clients_products do |t|
      t.integer :client_id
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
