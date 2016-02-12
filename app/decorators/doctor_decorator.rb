class DoctorDecorator < Draper::Decorator

  delegate_all
  decorates Doctor

  def has_hospitals
    Hospital.where(id: self.hospitals)
  end

end
