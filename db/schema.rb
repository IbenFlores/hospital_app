# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_05_25_175939) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "citas_medicas", force: :cascade do |t|
    t.integer "paciente_id", null: false
    t.integer "doctor_id", null: false
    t.integer "sala_medica_id", null: false
    t.datetime "fecha_hora", null: false
    t.string "motivo"
    t.string "estado", default: "Programada"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doctores", force: :cascade do |t|
    t.string "nombre", null: false
    t.string "apellido", null: false
    t.string "especialidad", null: false
    t.string "licencia_medica", null: false
    t.string "telefono"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["licencia_medica"], name: "index_doctores_on_licencia_medica", unique: true
  end

  create_table "historiales_medicos", force: :cascade do |t|
    t.bigint "paciente_id", null: false
    t.integer "cita_medica_id"
    t.date "fecha_registro", null: false
    t.text "diagnostico"
    t.text "tratamiento"
    t.text "notas"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["paciente_id"], name: "index_historiales_medicos_on_paciente_id"
  end

  create_table "pacientes", force: :cascade do |t|
    t.string "nombre", null: false
    t.string "apellido", null: false
    t.date "fecha_nacimiento", null: false
    t.string "genero", null: false
    t.string "direccion"
    t.string "telefono"
    t.string "email", null: false
    t.string "documento_identidad", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["documento_identidad"], name: "index_pacientes_on_documento_identidad", unique: true
    t.index ["email"], name: "index_pacientes_on_email", unique: true
    t.index ["reset_password_token"], name: "index_pacientes_on_reset_password_token", unique: true
  end

  create_table "salas_medicas", force: :cascade do |t|
    t.string "nombre_sala", null: false
    t.string "ubicacion"
    t.string "tipo_sala", null: false
    t.integer "capacidad", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "citas_medicas", "doctores", column: "doctor_id"
  add_foreign_key "citas_medicas", "pacientes"
  add_foreign_key "citas_medicas", "salas_medicas", column: "sala_medica_id"
  add_foreign_key "historiales_medicos", "citas_medicas", column: "cita_medica_id"
  add_foreign_key "historiales_medicos", "pacientes"
end
