class AddTimeOfDayToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :time_of_day, :string
  end
end
