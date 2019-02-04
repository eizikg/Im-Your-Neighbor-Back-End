class CreateEventVolounteers < ActiveRecord::Migration[5.2]
  def change
    create_table :event_volounteers do |t|
      t.integer :group_id
      t.integer :event_id
      t.integer :volounteer_id

      t.timestamps
    end
  end
end
