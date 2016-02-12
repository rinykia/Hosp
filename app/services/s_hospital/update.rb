module SHospital
  class Update


    def initialize(hospital, params)
      @hospital = hospital
      @params   = params.require(:hospital)
    end


    def main
      if @hospital.doctors.include?(@params[:doctors_list].to_i)
        "Этот врач уже работает в этой больнице"
      else
        self.add_doctor
        add_hospital_to_doctor
        "Добавлен новый сотрудник"
      end  
    end


    protected


    def add_doctor
      @hospital.doctors << @params[:doctors_list].to_i
    end

    def add_hospital_to_doctor
      doctor = Doctor.find(@params[:doctors_list].to_i)
      doctor.hospitals << @hospital.id
      doctor.save
    end

  end
end
