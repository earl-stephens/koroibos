require "rails_helper"

RSpec.describe 'get all olympians', type: :request do
  it 'returns a list of all olympians' do
    athlete1 = Athlete.create!(name: 'Kermit', age: 21, sex: 'M', height: 30, weight: 5, team: 'USA')
    athlete2 = Athlete.create!(name: 'Piggy', age: 28, sex: 'F', height: 30, weight: 15, team: 'USA')
    athlete3 = Athlete.create!(name: 'Fozzy', age: 22, sex: 'M', height: 55, weight: 25, team: 'USA')
    athlete4 = Athlete.create!(name: 'Gonzo', age: 20, sex: 'M', height: 33, weight: 9, team: 'USA')

    get '/api/v1/olympians'

    results = JSON.parse(response.body)

    expect(response).to be_successful
    expect(results).to have_key("olympians")
    expect(results["olympians"][0]).to have_key("name")
    expect(results["olympians"][0]).to have_key("team")
    expect(results["olympians"][0]).to have_key("age")
    expect(results["olympians"][0]).to have_key("sport")
    expect(results["olympians"][0]).to have_key("total_medals_won")
  end
end
