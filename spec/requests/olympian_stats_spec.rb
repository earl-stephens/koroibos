require "rails_helper"

RSpec.describe 'get all olympians', type: :request do
  it 'returns a list of all olympians' do
    athlete1 = Athlete.create!(name: 'Luke', age: 23, sex: 'M', height: 30, weight: 55, team: 'USA')
    athlete2 = Athlete.create!(name: 'Leia', age: 23, sex: 'F', height: 30, weight: 45, team: 'USA')
    athlete3 = Athlete.create!(name: 'Han', age: 37, sex: 'M', height: 55, weight: 51, team: 'USA')
    athlete4 = Athlete.create!(name: 'Padme', age: 29, sex: 'F', height: 33, weight: 42, team: 'USA')
    athlete5 = Athlete.create!(name: 'Anikin', age: 48, sex: 'M', height: 33, weight: 59, team: 'Sith')
    athlete6 = Athlete.create!(name: 'Darth Maul', age: 35, sex: 'M', height: 33, weight: 63, team: 'Sith')
    athlete7 = Athlete.create!(name: 'Rey', age: 20, sex: 'F', height: 33, weight: 47, team: 'USA')
    athlete8 = Athlete.create!(name: 'Yoda', age: 80, sex: 'M', height: 33, weight: 9, team: 'USA')

    get '/api/v1/olympian_stats'

    results = JSON.parse(response.body)
# binding.pry
    expect(response).to be_successful
    expect(results).to have_key("olympian_stats")
    expect(results["olympian_stats"]).to have_key("total_competing_olympians")
    expect(results["olympian_stats"]["total_competing_olympians"]).to eq(8)
    expect(results["olympian_stats"]).to have_key("average_weight")
    expect(results["olympian_stats"]["average_weight"]).to have_key("unit")
    expect(results["olympian_stats"]["average_weight"]["unit"]).to eq("kg")
    expect(results["olympian_stats"]["average_weight"]).to have_key("male_olympians")
    expect(results["olympian_stats"]["average_weight"]["male_olympians"]).to eq(47.4)
    expect(results["olympian_stats"]["average_weight"]).to have_key("female_olympians")
    expect(results["olympian_stats"]["average_weight"]["female_olympians"]).to eq(44.7)
    expect(results).to have_key("average_age")
    expect(results["average_age"]).to eq(36.9)
  end
end
