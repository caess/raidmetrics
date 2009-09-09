class CreateAuraSuffixes < ActiveRecord::Migration
  def self.up
    create_table :aura_suffixes do |t|
      t.integer :buff, :limit => 1, :null => false
    end
  end

  def self.down
    drop_table :aura_suffixes
  end
end
