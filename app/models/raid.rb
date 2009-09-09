class Raid < ActiveRecord::Base
  validates_presence_of :time
  
  has_many :encounters
end
