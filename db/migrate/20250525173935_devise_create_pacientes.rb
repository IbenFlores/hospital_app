class DeviseCreatePacientes < ActiveRecord::Migration[8.0]
  def change
    create_table :pacientes do |t|
      t.string :nombre, null: false
      t.string :apellido, null: false
      t.date :fecha_nacimiento, null: false
      t.string :genero, null: false
      t.string :direccion
      t.string :telefono
      t.string :email, null: false
      t.string :documento_identidad, null: false

      ## Devise modules
      t.string :encrypted_password, null: false, default: ""
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.integer :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip

      t.timestamps null: false
    end

    add_index :pacientes, :email, unique: true
    add_index :pacientes, :reset_password_token, unique: true
    add_index :pacientes, :documento_identidad, unique: true
  end
end
