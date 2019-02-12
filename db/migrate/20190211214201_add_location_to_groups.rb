class AddLocationToGroups < ActiveRecord::Migration[5.2]
  def change
      add_column :groups, :lng, :float
      add_column :groups, :lat, :float
  end
end
