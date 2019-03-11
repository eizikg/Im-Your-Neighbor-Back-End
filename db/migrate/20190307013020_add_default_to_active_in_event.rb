class AddDefaultToActiveInEvent < ActiveRecord::Migration[5.2]
  def change
    change_column_default :events, :active, true
  end
end
