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

  def get_medal_count
    number_of_medals = AthleteEvent.joins(:athlete)
                                    .where(athletes: {id: self.id})
                                    .where.not(athlete_events: {medals: 'NA'})
    number_of_medals.count
  end

  def self.get_youngest
    youngest = Athlete.order(:age)
    youngest.first
  end

  def self.get_oldest
    oldest = Athlete.order(:age)
    oldest.last
  end

  def self.total_participants
    self.select("DISTINCT name").count
  end

  def self.avg_male_weight
    self.where.not(weight: 0)
        .where(sex: 'M')
        .average(:weight)
        .to_f
        .round(1)
  end

  def self.avg_female_weight
    self.where.not(weight: 0)
        .where(sex: 'F')
        .average(:weight)
        .to_f
        .round(1)
  end

  def self.average_age
    self.where.not(age: 0)
        .average(:age)
        .to_f
        .round(1)
  end

end
