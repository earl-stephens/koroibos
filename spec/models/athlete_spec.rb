require "rails_helper"

RSpec.describe Athlete, type: :model do
  describe 'relationships' do
    it { should have_many :athlete_events }
    it { should have_many(:events).through :athlete_events }
  end

  describe 'instance methods' do
    it 'get_sport' do
      athlete1 = Athlete.create!(name: 'Kermit', age: 21, sex: 'M', height: 30, weight: 5, team: 'USA')
      athlete2 = Athlete.create!(name: 'Piggy', age: 28, sex: 'F', height: 30, weight: 15, team: 'USA')
      sport1 = Sport.create!(name: 'Wrestling')
      sport2 = Sport.create!(name: 'Lumberjack')
      event1 = sport1.events.create!(name: 'Mud Wrestling', games: '2016')
      event2 = sport2.events.create!(name: 'Axe Throwing', games: '2016')
      ae1 = event1.athlete_events.create!(medals: 'Silver', athlete_id: athlete1.id)
      ae2 = event1.athlete_events.create!(medals: 'none', athlete_id: athlete2.id)

      result = athlete1.get_sport
      expect(result).to eq(sport1.name)
    end

    it 'get_medal_count' do
      athlete1 = Athlete.create!(name: 'Kermit', age: 21, sex: 'M', height: 30, weight: 5, team: 'USA')
      athlete2 = Athlete.create!(name: 'Piggy', age: 28, sex: 'F', height: 30, weight: 15, team: 'USA')
      sport1 = Sport.create!(name: 'Wrestling')
      sport2 = Sport.create!(name: 'Lumberjack')
      sport3 = Sport.create!(name: 'Running')
      event1 = sport1.events.create!(name: 'Mud Wrestling', games: '2016')
      event2 = sport2.events.create!(name: 'Axe Throwing', games: '2016')
      event3 = sport3.events.create!(name: 'Marathon', games: '2016')
      ae1 = event1.athlete_events.create!(medals: 'Silver', athlete_id: athlete1.id)
      ae2 = event2.athlete_events.create!(medals: 'Gold', athlete_id: athlete1.id)
      ae3 = event3.athlete_events.create!(medals: 'NA', athlete_id: athlete1.id)
      ae4 = event1.athlete_events.create!(medals: 'Bronze', athlete_id: athlete2.id)

      results = athlete1.get_medal_count
      expect(results).to eq(2)
    end
  end

  describe 'class methods' do
    it 'get_youngest' do
      athlete1 = Athlete.create!(name: 'Kermit', age: 21, sex: 'M', height: 30, weight: 5, team: 'USA')
      athlete2 = Athlete.create!(name: 'Piggy', age: 28, sex: 'F', height: 30, weight: 15, team: 'USA')
      athlete3 = Athlete.create!(name: 'Fozzy', age: 22, sex: 'M', height: 55, weight: 25, team: 'USA')
      athlete4 = Athlete.create!(name: 'Gonzo', age: 20, sex: 'M', height: 33, weight: 9, team: 'USA')

      results = Athlete.get_youngest
      expect(results).to eq(athlete4)
    end

    it 'get_oldest' do
      athlete1 = Athlete.create!(name: 'Kermit', age: 21, sex: 'M', height: 30, weight: 5, team: 'USA')
      athlete2 = Athlete.create!(name: 'Piggy', age: 28, sex: 'F', height: 30, weight: 15, team: 'USA')
      athlete3 = Athlete.create!(name: 'Fozzy', age: 22, sex: 'M', height: 55, weight: 25, team: 'USA')
      athlete4 = Athlete.create!(name: 'Gonzo', age: 20, sex: 'M', height: 33, weight: 9, team: 'USA')

      results = Athlete.get_oldest
      expect(results).to eq(athlete2)
    end

    it 'total_participants' do
      athlete1 = Athlete.create!(name: 'Kermit', age: 21, sex: 'M', height: 30, weight: 5, team: 'USA')
      athlete2 = Athlete.create!(name: 'Piggy', age: 28, sex: 'F', height: 30, weight: 15, team: 'USA')
      athlete3 = Athlete.create!(name: 'Fozzy', age: 22, sex: 'M', height: 55, weight: 25, team: 'USA')
      athlete4 = Athlete.create!(name: 'Gonzo', age: 20, sex: 'M', height: 33, weight: 9, team: 'USA')
      athlete5 = Athlete.create!(name: 'Animal', age: 20, sex: 'M', height: 33, weight: 19, team: 'USA')
      athlete6 = Athlete.create!(name: 'Gonzo', age: 20, sex: 'M', height: 33, weight: 9, team: 'USA')

      results = Athlete.total_participants
      expect(results).to eq(5)
    end

    it 'avg_male_weight' do
      athlete1 = Athlete.create!(name: 'Kermit', age: 21, sex: 'M', height: 30, weight: 5, team: 'USA')
      athlete2 = Athlete.create!(name: 'Piggy', age: 28, sex: 'F', height: 30, weight: 15, team: 'USA')
      athlete3 = Athlete.create!(name: 'Fozzy', age: 22, sex: 'M', height: 55, weight: 25, team: 'USA')
      athlete4 = Athlete.create!(name: 'Gonzo', age: 20, sex: 'M', height: 33, weight: 9, team: 'USA')
      athlete5 = Athlete.create!(name: 'Animal', age: 20, sex: 'M', height: 33, weight: 19, team: 'USA')
      athlete6 = Athlete.create!(name: 'Beaker', age: 20, sex: 'M', height: 33, weight: 16, team: 'USA')
      athlete7 = Athlete.create!(name: 'Scooter', age: 20, sex: 'M', height: 33, weight: 0, team: 'USA')
      athlete8 = Athlete.create!(name: 'Gonzo', age: 20, sex: 'M', height: 33, weight: 9, team: 'USA')

      results = Athlete.avg_male_weight
      expect(results).to eq(14.8)
    end

    it 'avg_female_weight' do
      athlete1 = Athlete.create!(name: 'Kermit', age: 21, sex: 'F', height: 30, weight: 5, team: 'USA')
      athlete2 = Athlete.create!(name: 'Piggy', age: 28, sex: 'F', height: 30, weight: 15, team: 'USA')
      athlete3 = Athlete.create!(name: 'Fozzy', age: 22, sex: 'F', height: 55, weight: 25, team: 'USA')
      athlete4 = Athlete.create!(name: 'Gonzo', age: 20, sex: 'F', height: 33, weight: 9, team: 'USA')
      athlete5 = Athlete.create!(name: 'Animal', age: 20, sex: 'M', height: 33, weight: 19, team: 'USA')
      athlete6 = Athlete.create!(name: 'Beaker', age: 20, sex: 'M', height: 33, weight: 16, team: 'USA')
      athlete7 = Athlete.create!(name: 'Scooter', age: 20, sex: 'F', height: 33, weight: 0, team: 'USA')
      athlete8 = Athlete.create!(name: 'Gonzo', age: 20, sex: 'F', height: 33, weight: 9, team: 'USA')

      results = Athlete.avg_female_weight
      expect(results).to eq(13.5)
    end
  end
end
