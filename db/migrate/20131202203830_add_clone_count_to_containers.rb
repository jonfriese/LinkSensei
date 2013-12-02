class AddCloneCountToContainers < ActiveRecord::Migration
  def change
    add_column :containers, :clone_count, :integer
  end
end
