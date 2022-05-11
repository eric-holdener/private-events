class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.date :event_date
      t.string :event_location

      t.timestamps
    end
  end
end
