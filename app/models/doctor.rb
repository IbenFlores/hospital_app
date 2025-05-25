class Doctor < ApplicationRecord
  validates :licencia_medica, uniqueness: true
end
