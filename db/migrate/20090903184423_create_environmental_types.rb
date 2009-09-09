class CreateEnvironmentalTypes < ActiveRecord::Migration
  def self.up
    create_table :environmental_types do |t|
      t.string :name, :null => false
    end
  end

  def self.down
    drop_table :environmental_types
  end
end
