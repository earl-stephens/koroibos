class Athlete < ApplicationRecord

  has_many :athlete_events
  has_many :events, through: :athlete_events

end
