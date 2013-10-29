class AddContainerIdToLinks < ActiveRecord::Migration
  def change
    add_column :links, :container_id, :integer
  end
end
