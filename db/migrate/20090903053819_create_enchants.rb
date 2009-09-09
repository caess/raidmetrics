class CreateEnchants < ActiveRecord::Migration
  def self.up
    create_table :enchants do |t|
      t.string :name
    end
  end

  def self.down
    drop_table :enchants
  end
end
