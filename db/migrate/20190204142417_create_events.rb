class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.boolean :active
      t.string :description
      t.integer :category_id
      t.integer :volounteers_required
      t.integer :group_id

      t.timestamps
    end
  end
end
