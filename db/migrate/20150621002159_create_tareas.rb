class CreateTareas < ActiveRecord::Migration
  def change
    create_table :tareas do |t|
      t.string :title
      t.text :notes

      t.timestamps null: false
    end
  end
end
