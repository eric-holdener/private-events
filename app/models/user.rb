class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :events, foreign_key: :creator, primary_key: :id, dependent: :destroy
  has_many :event_attendees, foreign_key: :attendee_id
  has_many :attended_events, through: :event_attendees
end
