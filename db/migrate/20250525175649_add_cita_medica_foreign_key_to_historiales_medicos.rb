class AddCitaMedicaForeignKeyToHistorialesMedicos < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :historiales_medicos, :citas_medicas, column: :cita_medica_id
  end
end
