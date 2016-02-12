class Hospital < ActiveRecord::Base
	attr_accessor :doctors_list
  validates :name, uniqueness: true
end
