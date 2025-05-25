class AddForeignKeysToCitasMedicas < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :citas_medicas, :pacientes, column: :paciente_id
    add_foreign_key :citas_medicas, :doctores, column: :doctor_id
    add_foreign_key :citas_medicas, :salas_medicas, column: :sala_medica_id
  end
end
