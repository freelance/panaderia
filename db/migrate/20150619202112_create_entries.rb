class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.datetime :date
      t.boolean :turn
      t.decimal :initial_value
      t.integer :bill
      t.decimal :coins
      t.integer :quantity
      t.decimal :posnet
      t.decimal :total_general

      t.timestamps null: false
    end
  end
end
