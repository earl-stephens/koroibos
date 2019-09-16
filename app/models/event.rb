class Event < ApplicationRecord

  belongs_to :sport
  has_many :athlete_events
  has_many :athletes, through: :athlete_events

end
