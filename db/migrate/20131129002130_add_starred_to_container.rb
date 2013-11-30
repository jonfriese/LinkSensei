class AddStarredToContainer < ActiveRecord::Migration
  def change
    add_column :containers, :starred, :boolean
  end
end
