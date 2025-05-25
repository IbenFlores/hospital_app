class HistorialMedico < ApplicationRecord
  belongs_to :paciente
  belongs_to :cita_medica, optional: true
end
