class ChangeForeignKeyForEvents < ActiveRecord::Migration[7.0]
  def change
    rename_column :events, :user_id, :creator
  end
end
