class PagesController < ApplicationController
  def home
    @citas_medicas = CitaMedica.all
  end
end
