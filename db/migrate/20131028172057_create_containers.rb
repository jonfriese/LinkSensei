class CreateContainers < ActiveRecord::Migration
  def change
    create_table :containers do |t|
      t.integer :user_id
      t.string :name
      t.string :description
      t.string :link
      t.timestamps
    end
  end
end
