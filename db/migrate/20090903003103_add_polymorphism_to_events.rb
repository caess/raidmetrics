class AddPolymorphismToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :prefix_id, :integer
    add_column :events, :prefix_type, :string
    add_column :events, :suffix_id, :integer
    add_column :events, :suffix_name, :string
  end

  def self.down
    remove_column :events, :suffix_name
    remove_column :events, :suffix_id
    remove_column :events, :prefix_type
    remove_column :events, :prefix_id
  end
end
