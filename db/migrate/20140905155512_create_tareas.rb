class CreateTareas < ActiveRecord::Migration
  def change
    create_table :tareas do |t|
      t.string :nombre
      t.boolean :terminada, default: false

      t.timestamps
    end
  end
end
