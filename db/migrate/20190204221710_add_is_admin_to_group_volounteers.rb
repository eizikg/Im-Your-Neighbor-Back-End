class AddIsAdminToGroupVolounteers < ActiveRecord::Migration[5.2]
  def change
    add_column :group_volounteers, :is_admin, :boolean, default: false
  end
end
