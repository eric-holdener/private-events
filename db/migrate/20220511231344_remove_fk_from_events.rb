class RemoveFkFromEvents < ActiveRecord::Migration[7.0]
  def change
    if foreign_key_exists?(:events, :users)
      remove_foreign_key :events, :users
    end
  end
end
