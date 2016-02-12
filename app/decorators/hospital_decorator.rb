class HospitalDecorator < Draper::Decorator

  delegate_all
  decorates Hospital

  def avaible_doctors
    Doctor.all.collect {|doctor| [doctor.name, doctor.id ]}
  end

  def personal
    Doctor.where(id: self.doctors)
  end

end
