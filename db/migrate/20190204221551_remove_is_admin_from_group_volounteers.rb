class RemoveIsAdminFromGroupVolounteers < ActiveRecord::Migration[5.2]
  def change
    remove_column :group_volounteers, :is_admin
  end
end
