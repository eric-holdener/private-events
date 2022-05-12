class Event < ApplicationRecord
  belongs_to :user, foreign_key: :creator, primary_key: :id
  has_many :attended_event, foreign_key: :attended_event_id
  has_many :attendee, through: :attended_event

  validates :creator, presence: true
  validates :event_location, presence: true
  validates :event_date, presence: true
end
