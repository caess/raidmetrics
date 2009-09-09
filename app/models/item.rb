class Item < ActiveRecord::Base
  validates_numericality_of :item_id
  validates_presence_of :name
end
