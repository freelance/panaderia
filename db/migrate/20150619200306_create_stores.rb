class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|

      t.timestamps null: false
    end
    
    add_index :stores, :entry_id

  end
end
