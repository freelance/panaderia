class ChangeDateFormatInMyTable < ActiveRecord::Migration
  def change
  
  end

def up
    change_column :store, :turn, :string
  end

  def down
    change_column :store, :turn, :boolean
  end



end
