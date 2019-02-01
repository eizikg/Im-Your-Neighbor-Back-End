class CreateNeighborhoods < ActiveRecord::Migration[5.2]
  def change
    create_table :neighborhoods do |t|
      t.string :country
      t.string :city
      t.string :name
      t.string :zip_code

      t.timestamps
    end
  end
end
