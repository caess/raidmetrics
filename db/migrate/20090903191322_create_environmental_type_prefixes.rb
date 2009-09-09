class CreateEnvironmentalTypePrefixes < ActiveRecord::Migration
  def self.up
    create_table :environmental_type_prefixes do |t|
      t.integer :environmental_type_id, :null => false
    end
  end

  def self.down
    drop_table :environmental_type_prefixes
  end
end
