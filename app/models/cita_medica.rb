class CitaMedica < ApplicationRecord
  belongs_to :paciente
  belongs_to :doctor
  belongs_to :sala_medica
  enum estado: { programada: "Programada", completada: "Completada", cancelada: "Cancelada" }
end
