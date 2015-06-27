class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.datetime :date
      t.boolean :turn
      t.string :description
      t.decimal :mount
      t.decimal :total_general

      t.timestamps null: false
    end
  end
end
