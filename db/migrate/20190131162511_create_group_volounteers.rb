class CreateGroupVolounteers < ActiveRecord::Migration[5.2]
  def change
    create_table :group_volounteers do |t|
      t.integer :volounteer_id
      t.integer :group_id
      t.boolean :is_admin

      t.timestamps
    end
  end
end
