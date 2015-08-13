class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :email
      t.decimal :total
      t.datetime :day_of_pay

      t.timestamps null: false
    end
  end
end
