class Spell < ActiveRecord::Base
  validates_presence_of :name
  validates_numericality_of :spell_id
  validates_numericality_of :school
end
