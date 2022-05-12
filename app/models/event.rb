class Event < ApplicationRecord
  belongs_to :user, foreign_key: :creator, primary_key: :id

  validates :creator, presence: true
  validates :event_location, presence: true
  validates :event_date, presence: true
end
