class Paciente < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :documento_identidad, uniqueness: true

  enum genero: { masculino: "M", femenino: "F", otro: "Otro" }
end
