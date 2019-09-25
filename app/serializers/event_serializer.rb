class EventSerializer

  def serialize
    output_hash = Hash.new
    sport_hash = Hash.new
    output_hash["events"] = []
    Sport.all.each do |sporty|
      output_hash["events"] << {"sport": sporty.name, "events": 
        sporty.events.map do |eventy|
          eventy.name
        end
        }
    end
    output_hash
  end

end
