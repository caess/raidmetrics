class Unit < ActiveRecord::Base
  validates_numericality_of :guid
  validates_presence_of :name
end
