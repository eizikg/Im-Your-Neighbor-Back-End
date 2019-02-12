class AddColumnsToVolounteer < ActiveRecord::Migration[5.2]
  def change
    add_column :volounteers, :lng, :float
    add_column :volounteers, :lat, :float
  end
end
