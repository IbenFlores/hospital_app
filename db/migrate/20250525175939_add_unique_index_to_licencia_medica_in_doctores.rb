class AddUniqueIndexToLicenciaMedicaInDoctores < ActiveRecord::Migration[8.0]
  def change
    add_index :doctores, :licencia_medica, unique: true
  end
end
