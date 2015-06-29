class AddStoreidToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :store_id, :integer
  end
end
