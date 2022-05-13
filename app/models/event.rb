class Event < ApplicationRecord
  belongs_to :user, foreign_key: :creator, primary_key: :id
  has_many :event_attendees, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendees

  validates :creator, presence: true
  validates :event_location, presence: true
  validates :event_date, presence: true

  scope :past, -> { where('event_date < ?', Time.now) }
  scope :future, -> { where('event_date >= ?', Time.now) }
end
