class CreateAuraDoseSuffixes < ActiveRecord::Migration
  def self.up
    create_table :aura_dose_suffixes do |t|
      t.integer :buff, :limit => 1, :null => false
      t.integer :amount, :null => false
    end
  end

  def self.down
    drop_table :aura_dose_suffixes
  end
end
