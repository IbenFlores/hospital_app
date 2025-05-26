Rails.application.routes.draw do
  root "pages#home"
  devise_for :doctors
  devise_for :pacientes
  resources :citas_medicas, except: [ :index ] do
    member do
      patch :aprobar
      patch :completar
      patch :cancelar
    end
    resources :historiales_medicos, only: [ :new, :create, :show ]  # Historiales anidados bajo citas
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
