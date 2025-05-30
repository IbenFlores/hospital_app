class HistorialesMedicosController < ApplicationController
  def new
    @historial_medico = HistorialMedico.new
    @cita = CitaMedica.find(params[:citas_medica_id]) if params[:citas_medica_id]
  end

  def create
    @historial_medico = HistorialMedico.new(historial_params)
    @cita = CitaMedica.find(params[:citas_medica_id]) if params[:citas_medica_id]
    @historial_medico.paciente = @cita.paciente if @cita
    @historial_medico.cita_medica = @cita
    @historial_medico.fecha_registro = Date.today

    if @historial_medico.save
      redirect_to root_path, notice: "Historial médico creado exitosamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @historial_medico = HistorialMedico.find(params[:id])
    @cita = @historial_medico.cita_medica
  end

  def edit
    @historial_medico = HistorialMedico.find(params[:id])
  end

  def update
    @historial_medico = HistorialMedico.find(params[:id])
    if @historial_medico.update(historial_params)
      redirect_to root_path, notice: "Historial médico actualizado exitosamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @historial_medico = HistorialMedico.find(params[:id])
    @historial_medico.destroy
    redirect_to root_path, notice: "Historial médico eliminado exitosamente."
  end

  private

  def historial_params
    params.require(:historial_medico).permit(
      :cita_medica_id,
      :diagnostico,
      :tratamiento,
      :notas
    )
  end
end
