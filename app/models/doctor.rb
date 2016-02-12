class Doctor < ActiveRecord::Base 
  validates :name, :year, :title, presence: true
  TITLES = [ "медсестра", "фельдшер", "врач" ]
  validates :title, inclusion: TITLES
  YEARS = (1945..2016).to_a.reverse!
  validates :year, inclusion: YEARS
end
