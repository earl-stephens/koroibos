class AthleteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :team, :age

  attribute :sport do |object|
    binding.pry
    object.get_sport
  end
end
