class ChangeDescriptionFormatInContainers < ActiveRecord::Migration
  def self.up
   change_column :containers, :description, :text
  end

  def self.down
   change_column :containers, :description, :string
  end
end
