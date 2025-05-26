class CitasMedicasController < ApplicationController
  def show
    @cita = CitaMedica.find(params[:id])
  end

  def new
    @cita = CitaMedica.new
  end

  def create
    @cita = CitaMedica.new(cita_params)
    if current_paciente
      @cita.paciente = current_paciente
    elsif current_doctor
      @cita.doctor = current_doctor
      @cita.estado = "Programada"
    end
    if @cita.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @cita = CitaMedica.find(params[:id])
  end

  def update
    @cita = CitaMedica.find(params[:id])
    if @cita.update(cita_params)
      redirect_to citas_medica_path(@cita), notice: "Cita actualizada exitosamente."
    else
      render :edit
    end
  end

  def destroy
    @cita = CitaMedica.find(params[:id])
    @cita.destroy
    redirect_to root_path
  end

  def aprobar
    @cita = CitaMedica.find(params[:id])
    if @cita.update(estado: "Programada")
      redirect_to root_path, notice: "Cita aprobada exitosamente."
    else
      redirect_to root_path, alert: "Error al aprobar la cita."
    end
  end

  def completar
    @cita = CitaMedica.find(params[:id])
    if @cita.update(estado: "Completada")
      redirect_to root_path, notice: "Cita completada exitosamente."
    else
      redirect_to root_path, alert: "Error al completar la cita."
    end
  end

  def cancelar
    @cita = CitaMedica.find(params[:id])
    if @cita.update(estado: "Cancelada")
      redirect_to root_path, notice: "Cita cancelada exitosamente."
    else
      redirect_to root_path, alert: "Error al cancelar la cita."
    end
  end

  private

  def cita_params
    params.require(:cita_medica).permit(:fecha_hora, :motivo, :paciente_id, :doctor_id, :sala_medica_id)
  end
end
