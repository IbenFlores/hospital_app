class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  self.table_name = "doctores"

  # Asociaciones
  has_many :citas_medicas, class_name: "CitaMedica", dependent: :restrict_with_error

  # Validaciones
  validates :licencia_medica, presence: true, uniqueness: true, length: { is: 8 }, numericality: { only_integer: true }
  validates :nombre, :apellido, :especialidad, presence: true
  validates :telefono, format: { with: /\A9\d{8}\z/, message: "debe ser un número peruano de 9 dígitos empezando con 9" }, allow_blank: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true
end
