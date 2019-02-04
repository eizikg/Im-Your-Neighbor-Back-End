class ChangeGroups < ActiveRecord::Migration[5.2]
  def change
    remove_column :groups, :neighborhood_id
    add_column :volounteers, :neighborhood_id, :integer
  end
end
