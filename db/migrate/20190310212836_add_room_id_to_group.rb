class AddRoomIdToGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :room_id, :integer
  end
end
