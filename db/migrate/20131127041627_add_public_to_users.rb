class AddPublicToUsers < ActiveRecord::Migration
  def change
    add_column :users, :public_status, :boolean
  end
end
