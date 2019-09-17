require "rails_helper"

RSpec.describe 'get all olympians', type: :request do
  it 'returns a list of all olympians' do
    athlete1 = Athlete.create!(name: 'Kermit', age: 21, sex: 'M', height: 30, weight: 5, team: 'USA')
    athlete2 = Athlete.create!(name: 'Piggy', age: 28, sex: 'F', height: 30, weight: 15, team: 'USA')
    athlete3 = Athlete.create!(name: 'Fozzy', age: 22, sex: 'M', height: 55, weight: 25, team: 'USA')
    athlete4 = Athlete.create!(name: 'Gonzo', age: 20, sex: 'M', height: 33, weight: 9, team: 'USA')
    sport1 = Sport.create!(name: 'Wrestling')
    sport2 = Sport.create!(name: 'Lumberjack')
    sport3 = Sport.create!(name: 'Running')
    event1 = sport1.events.create!(name: 'Mud Wrestling', games: '2016')
    event2 = sport2.events.create!(name: 'Axe Throwing', games: '2016')
    event3 = sport3.events.create!(name: 'Marathon', games: '2016')
    ae1 = event1.athlete_events.create!(medals: 'Silver', athlete_id: athlete1.id)
    ae2 = event2.athlete_events.create!(medals: 'none', athlete_id: athlete2.id)
    ae3 = event3.athlete_events.create!(medals: 'Gold', athlete_id: athlete3.id)
    ae4 = event1.athlete_events.create!(medals: 'none', athlete_id: athlete4.id)

    get '/api/v1/olympians'

    results = JSON.parse(response.body)
    binding.pry

    expect(response).to be_successful
    expect(results).to have_key("olympians")
    expect(results["olympians"][0]).to have_key("name")
    expect(results["olympians"][0]).to have_key("team")
    expect(results["olympians"][0]).to have_key("age")
    expect(results["olympians"][0]).to have_key("sport")
    expect(results["olympians"][0]).to have_key("total_medals_won")
  end
end
