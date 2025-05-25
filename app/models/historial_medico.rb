class HistorialMedico < ApplicationRecord
  self.table_name = "historiales_medicos"

  # Asociaciones
  belongs_to :paciente
  belongs_to :cita_medica, optional: true

  # Validaciones
  validates :fecha_registro, presence: true
  validates :diagnostico, :tratamiento, :notas, presence: true, allow_blank: true
  validates :fecha_registro, comparison: { less_than_or_equal_to: Date.current, message: "no puede ser futura" }
end
