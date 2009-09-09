class CreateMissTypes < ActiveRecord::Migration
  def self.up
    create_table :miss_types do |t|
      t.string :name, :null => false
    end
  end

  def self.down
    drop_table :miss_types
  end
end
