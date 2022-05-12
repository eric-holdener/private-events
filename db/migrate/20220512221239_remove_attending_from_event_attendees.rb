class RemoveAttendingFromEventAttendees < ActiveRecord::Migration[7.0]
  def change
    remove_column :event_attendees, :attending
  end
end
