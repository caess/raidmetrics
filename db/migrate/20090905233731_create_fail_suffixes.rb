class CreateFailSuffixes < ActiveRecord::Migration
  def self.up
    create_table :fail_suffixes do |t|
      t.integer :fail_type_id, :null => :false
    end
  end

  def self.down
    drop_table :fail_suffixes
  end
end
