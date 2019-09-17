class Athlete < ApplicationRecord

  has_many :athlete_events
  has_many :events, through: :athlete_events

  def get_sport
    result = Athlete.joins(:athlete_events)
                    .joins(events: :sport)
                    .where(id: self.id)
                    .select("sports.name")
    result.first.name
  end

end
