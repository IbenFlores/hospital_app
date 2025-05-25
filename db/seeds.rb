# db/seeds.rb
HistorialMedico.destroy_all
CitaMedica.destroy_all
Paciente.destroy_all
Doctor.destroy_all
SalaMedica.destroy_all

pacientes = [
  {
    nombre: "Juan",
    apellido: "Pérez",
    fecha_nacimiento: Date.new(1990, 5, 15),
    genero: "M",
    direccion: "Av. Ejercito 123, Yanahuara, Arequipa, Arequipa 04013",
    telefono: "912345678",
    email: "juan.perez@example.com",
    documento_identidad: "12345678",
    password: "password123",
    password_confirmation: "password123"
  },
  {
    nombre: "María",
    apellido: "Gómez",
    fecha_nacimiento: Date.new(1985, 8, 22),
    genero: "F",
    direccion: "Calle Mercaderes 456, Cercado, Arequipa, Arequipa 04001",
    telefono: "987654321",
    email: "maria.gomez@example.com",
    documento_identidad: "23456789",
    password: "password123",
    password_confirmation: "password123"
  },
  {
    nombre: "Alex",
    apellido: "López",
    fecha_nacimiento: Date.new(1995, 3, 10),
    genero: "Otro",
    direccion: "Av. La Marina 789, Cayma, Arequipa, Arequipa 04017",
    telefono: "945678123",
    email: "alex.lopez@example.com",
    documento_identidad: "34567890",
    password: "password123",
    password_confirmation: "password123"
  }
]

pacientes.each do |paciente|
  Paciente.create!(paciente)
end

doctores = [
  {
    nombre: "Ana",
    apellido: "Martínez",
    especialidad: "Cardiología",
    licencia_medica: "87654321",
    telefono: "901234567",
    email: "ana.martinez@hospital.com"
  },
  {
    nombre: "Carlos",
    apellido: "Rodríguez",
    especialidad: "Pediatría",
    licencia_medica: "76543210",
    telefono: "934567890",
    email: "carlos.rodriguez@hospital.com"
  },
  {
    nombre: "Laura",
    apellido: "Sánchez",
    especialidad: "Neurología",
    licencia_medica: "65432109",
    telefono: "978901234",
    email: "laura.sanchez@hospital.com"
  }
]

doctores.each do |doctor|
  Doctor.create!(doctor)
end

salas = [
  {
    nombre_sala: "Sala de Consultas 1",
    ubicacion: "Piso 1, Ala Este",
    tipo_sala: "Consulta",
    capacidad: 10
  },
  {
    nombre_sala: "Quirófano A",
    ubicacion: "Piso 2, Ala Oeste",
    tipo_sala: "Cirugía",
    capacidad: 5
  },
  {
    nombre_sala: "Sala de Emergencias",
    ubicacion: "Planta Baja",
    tipo_sala: "Emergencia",
    capacidad: 20
  }
]

salas.each do |sala|
  SalaMedica.create!(sala)
end

citas = [
  {
    paciente: Paciente.find_by(email: "juan.perez@example.com"),
    doctor: Doctor.find_by(licencia_medica: "87654321"),
    sala_medica: SalaMedica.find_by(nombre_sala: "Sala de Consultas 1"),
    fecha_hora: DateTime.new(2025, 6, 1, 10, 0),
    motivo: "Chequeo cardiológico anual",
    estado: "Programada"
  },
  {
    paciente: Paciente.find_by(email: "maria.gomez@example.com"),
    doctor: Doctor.find_by(licencia_medica: "76543210"),
    sala_medica: SalaMedica.find_by(nombre_sala: "Sala de Consultas 1"),
    fecha_hora: DateTime.new(2025, 6, 2, 14, 30),
    motivo: "Consulta pediátrica",
    estado: "Programada"
  },
  {
    paciente: Paciente.find_by(email: "alex.lopez@example.com"),
    doctor: Doctor.find_by(licencia_medica: "65432109"),
    sala_medica: SalaMedica.find_by(nombre_sala: "Sala de Emergencias"),
    fecha_hora: DateTime.new(2025, 5, 30, 9, 0),
    motivo: "Dolor de cabeza severo",
    estado: "Completada"
  }
]

citas.each do |cita|
  CitaMedica.create!(cita)
end

historiales = [
  {
    paciente: Paciente.find_by(email: "alex.lopez@example.com"),
    cita_medica: CitaMedica.find_by(motivo: "Dolor de cabeza severo"),
    fecha_registro: Date.new(2025, 5, 25), # Cambiado a fecha válida
    diagnostico: "Migraña crónica",
    tratamiento: "Prescripción de sumatriptán 50mg según necesidad",
    notas: "Recomendar seguimiento en 1 mes"
  },
  {
    paciente: Paciente.find_by(email: "juan.perez@example.com"),
    cita_medica: nil,
    fecha_registro: Date.new(2025, 5, 20), # Ya es válida
    diagnostico: "Hipertensión leve",
    tratamiento: "Dieta baja en sodio, monitoreo regular",
    notas: "Paciente reporta mareos ocasionales"
  }
]

historiales.each do |historial|
  HistorialMedico.create!(historial)
end

puts "Seeds created successfully!"
