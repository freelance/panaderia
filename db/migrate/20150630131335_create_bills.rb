class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.integer :bill
      t.integer :quantity
      t.decimal :total
      t.references :entry, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
