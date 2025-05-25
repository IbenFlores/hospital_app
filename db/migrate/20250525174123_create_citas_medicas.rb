class CreateCitasMedicas < ActiveRecord::Migration[8.0]
  def change
    create_table :citas_medicas do |t|
      t.integer :paciente_id, null: false
      t.integer :doctor_id, null: false
      t.integer :sala_medica_id, null: false
      t.datetime :fecha_hora, null: false
      t.string :motivo
      t.string :estado, default: 'Programada'

      t.timestamps
    end
  end
end
