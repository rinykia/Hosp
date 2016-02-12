class HospitalsController < ApplicationController
  before_action :set_hospital, only: [:show, :edit, :update, :remove_doctor]

  def index
    @hospitals = Hospital.all
  end

  def new
  end

  def create
    @hospital = Hospital.new(hospital_params)

    if @hospital.save
      redirect_to '/'
    else
      render action: 'new' 
    end  
  end

  def edit
  end

  def update
    notice = SHospital::Update.new(@hospital, params).main
    respond_to do |format|
      if @hospital.save
        format.html { redirect_to :back, notice: notice }
      end
    end
  end

  def destroy
    @hospital = Hospital.find(params[:id])
    @hospital.destroy
  end

  def remove_doctor
    notice = SHospital::RemoveDoctor.new(@hospital, params).main
    respond_to do |format|
      if @hospital.save
        format.html { redirect_to :back, notice: notice }
      end
    end
  end

  private

  def set_hospital
    @hospital = HospitalDecorator.decorate(Hospital.find(params[:id]))
  end

  def hospital_params
    params.require(:hospital).permit(:name)
  end

end
