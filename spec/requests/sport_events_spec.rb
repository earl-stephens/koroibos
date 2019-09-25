require "rails_helper"

RSpec.describe 'make a get request to /events', type: :request do
  it 'returns a list of events for that sport' do
    sport1 = Sport.create!(name: 'Wrestling')
    sport2 = Sport.create!(name: 'Running')
    event1 = sport1.events.create!(name: 'Mens Wrestling', games: '2016')
    event2 = sport1.events.create!(name: 'Womens Wrestling', games: '2016')
    event3 = sport2.events.create!(name: 'Marathon', games: '2016')
    event4 = sport2.events.create!(name: 'Half Marathon', games: '2016')

    get '/api/v1/events'

    results = JSON.parse(response.body)
    expect(response).to be_successful
    expect(results).to have_key("events")
    expect(results["events"].length).to eq(2)
  end
end
