module SHospital
  class RemoveDoctor


    def initialize(hospital, params)
      @hospital = hospital
      @doctor_id = params[:doctor_id].to_i
    end


    def main
      if @hospital.doctors.include?(@doctor_id)
        self.remove_doctor_from_hospital
        self.remove_hospital_from_doctor
        "Сотрудник уволен из больницы"
      else
        "Нельзя удалить сотрудника, которого нету в списке"
      end  
    end


    protected

    def remove_doctor_from_hospital
      @hospital.doctors.delete(@doctor_id)
    end

    def remove_hospital_from_doctor
      doctor = Doctor.find(@doctor_id)
      doctor.hospitals.delete(@hospital.id)
      doctor.save
    end

  end
end
