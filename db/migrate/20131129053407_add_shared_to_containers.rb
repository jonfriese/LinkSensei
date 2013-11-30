class AddSharedToContainers < ActiveRecord::Migration
  def change
    add_column :containers, :original_user_name, :string
  end
end
