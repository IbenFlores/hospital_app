class SalaMedica < ApplicationRecord
  self.table_name = "salas_medicas"

  # Asociaciones
  has_many :citas_medicas, class_name: "CitaMedica", dependent: :restrict_with_error

  # Validaciones
  validates :nombre_sala, presence: true, uniqueness: true
  validates :tipo_sala, presence: true, inclusion: { in: %w[Consulta Cirugía Emergencia Otro], message: "debe ser Consulta, Cirugía, Emergencia u Otro" }
  validates :capacidad, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :ubicacion, presence: true, allow_blank: true
end
