class CreateFailTypes < ActiveRecord::Migration
  def self.up
    create_table :fail_types do |t|
      t.string :name, :null => false
    end
  end

  def self.down
    drop_table :fail_types
  end
end
