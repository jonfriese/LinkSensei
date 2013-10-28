class AddContainersToUsers < ActiveRecord::Migration
  def change
    add_column :users, :containers, :integer
  end
end
