class StatsSerializer

  def initialize
    @total_competing_olympians = Athlete.total_participants
    @male_olympians = Athlete.avg_male_weight
    @female_olympians = Athlete.avg_female_weight
    @average_age = Athlete.average_age
  end

  def serialize
    output_hash = Hash.new
    olympian_stats_hash = Hash.new
    avg_weight_hash = Hash.new
    olympian_stats_hash["total_competing_olympians"] = @total_competing_olympians
    avg_weight_hash["unit"] = "kg"
    avg_weight_hash["male_olympians"] = @male_olympians
    avg_weight_hash["female_olympians"] = @female_olympians
    olympian_stats_hash["average_weight"] = avg_weight_hash
    output_hash["olympian_stats"] = olympian_stats_hash
    output_hash["average_age"] = @average_age
    output_hash
  end

end
