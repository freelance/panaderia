class AddStoreIdToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :store_id, :integer
  end
end
