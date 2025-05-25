class SalaMedica < ApplicationRecord
  enum tipo_sala: { consulta: "Consulta", cirugia: "Cirugía", emergencia: "Emergencia", otro: "Otro" }
end
