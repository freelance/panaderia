class AddStoreIdToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :store_id, :integer
    add_column :expenses, :provider_id, :integer
  end
end
