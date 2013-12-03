class AddOriginalUserIdToContainers < ActiveRecord::Migration
  def change
    add_column :containers, :original_user_id, :integer
  end
end
