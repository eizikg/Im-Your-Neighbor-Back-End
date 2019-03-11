class AddAddressToEventAndVolounteer < ActiveRecord::Migration[5.2]
  def change
    add_column :volounteers, :address, :string
    add_column :events, :address, :string
  end
end
