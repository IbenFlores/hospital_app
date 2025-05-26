class CreateDoctores < ActiveRecord::Migration[8.0]
  def change
    create_table :doctores do |t|
      t.string :nombre, null: false
      t.string :apellido, null: false
      t.string :especialidad, null: false
      t.string :licencia_medica, null: false
      t.string :telefono

      t.timestamps
    end
  end
end
