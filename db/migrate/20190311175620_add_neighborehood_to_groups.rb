class AddNeighborehoodToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :neighborhood, :string
  end
end
