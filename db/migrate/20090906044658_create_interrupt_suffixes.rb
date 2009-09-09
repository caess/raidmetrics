class CreateInterruptSuffixes < ActiveRecord::Migration
  def self.up
    create_table :interrupt_suffixes do |t|
      t.integer :spell_id, :null => false
    end
  end

  def self.down
    drop_table :interrupt_suffixes
  end
end
