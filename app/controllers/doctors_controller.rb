class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show]

  def index
    @doctors = Doctor.all
  end

  def new
  end

  def create
    @doctor = Doctor.new(doctor_params)

    respond_to do |format|
      if @doctor.save
        format.html { redirect_to @doctor,
          notice: 'Staff was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def show
  end

  def update
    @doctor = Doctor.find(params[:id])
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to @doctor,
          notice: 'Doctor was successfully updated.' }
          format.json { head :no_content }
      else
        format.html { render action: 'edit' }
      end
    end
  end   

  private

  def set_doctor
    @doctor = DoctorDecorator.decorate(Doctor.find(params[:id]))
  end

  def doctor_params
    params.require(:doctor).permit(:name, :year, :title)
  end

end
