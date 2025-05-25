class CreateSalasMedicas < ActiveRecord::Migration[8.0]
  def change
    create_table :salas_medicas do |t|
      t.string :nombre_sala, null: false
      t.string :ubicacion
      t.string :tipo_sala, null: false
      t.integer :capacidad, null: false

      t.timestamps
    end
  end
end
