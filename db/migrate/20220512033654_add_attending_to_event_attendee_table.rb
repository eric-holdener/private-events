class AddAttendingToEventAttendeeTable < ActiveRecord::Migration[7.0]
  def change
    add_column :event_attendees, :attending, :integer
  end
end
