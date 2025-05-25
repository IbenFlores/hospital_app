class CreateHistorialesMedicos < ActiveRecord::Migration[8.0]
  def change
    create_table :historiales_medicos do |t|
      t.references :paciente, null: false, foreign_key: true
      t.integer :cita_medica_id
      t.date :fecha_registro, null: false
      t.text :diagnostico
      t.text :tratamiento
      t.text :notas

      t.timestamps
    end
  end
end
