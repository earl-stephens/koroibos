class AthleteSerializer

  def initialize(athlete)
    @name = athlete.name
    @team = athlete.team
    @age = athlete.age
    @sport = athlete.get_sport
  end

  def serialize
    hash = Hash.new
    hash["name"] = @name
    hash["team"] = @team
    hash["age"] = @age
    hash["sport"] = @sport
    hash
  end

end
