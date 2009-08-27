class Encounter < ActiveRecord::Base
  validates_presence_of :raid
  
  belongs_to :raid
end
