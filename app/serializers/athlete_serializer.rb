class AthleteSerializer

  def initialize(athlete)
    @name = athlete.name
    @team = athlete.team
    @age = athlete.age
    @sport = athlete.get_sport
    @total_medals_won = athlete.get_medal_count
  end

  def serialize
    hash = Hash.new
    hash["name"] = @name
    hash["team"] = @team
    hash["age"] = @age
    hash["sport"] = @sport
    hash["total_medals_won"] = @total_medals_won
    hash
  end

end
