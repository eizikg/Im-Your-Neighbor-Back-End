class AddNeighborehoodToVolounteer < ActiveRecord::Migration[5.2]
  def change
    add_column :volounteers, :neighborhood, :string
  end
end
