class AddProviderIdToTareas < ActiveRecord::Migration
  def change
    add_column :tareas, :provider_id, :integer
    add_column :tareas, :store_id, :integer
  end
end
