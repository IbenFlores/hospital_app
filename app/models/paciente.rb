class Paciente < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Asociaciones
  has_many :citas_medicas, class_name: "CitaMedica", dependent: :destroy
  has_many :historiales_medicos, class_name: "HistorialMedico", dependent: :destroy

  # Validaciones
  validates :documento_identidad, presence: true, uniqueness: true, length: { is: 8 }, numericality: { only_integer: true }
  validates :nombre, :apellido, :fecha_nacimiento, presence: true
  validates :genero, presence: true, inclusion: { in: %w[M F Otro], message: "debe ser M, F u Otro" }
  validates :telefono, format: { with: /\A9\d{8}\z/, message: "debe ser un número peruano de 9 dígitos empezando con 9" }, allow_blank: true
  validates :email, presence: true # Devise ya valida el formato
  validates :direccion, presence: true
  validates :fecha_nacimiento, comparison: { less_than: Date.current, message: "no puede ser futura" }
end
