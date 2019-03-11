class RemoveNeighborehoodIdFromVolounteer < ActiveRecord::Migration[5.2]
  def change
    remove_column :volounteers, :neighborhood_id
  end
end
