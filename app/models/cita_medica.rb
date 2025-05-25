class CitaMedica < ApplicationRecord
  self.table_name = "citas_medicas"

  # Asociaciones
  belongs_to :paciente
  belongs_to :doctor
  belongs_to :sala_medica
  has_many :historiales_medicos, class_name: "HistorialMedico", dependent: :destroy

  # Validaciones
  validates :fecha_hora, presence: true
  validates :estado, presence: true, inclusion: { in: %w[Programada Completada Cancelada], message: "debe ser Programada, Completada o Cancelada" }
  validates :motivo, presence: true, allow_blank: true
  validates :fecha_hora, comparison: { greater_than: Time.current, message: "debe ser futura" }, if: -> { estado == "Programada" }
end
