require "rails_helper"

RSpec.describe Event, type: :model do
  describe 'relationships' do
    it { should belong_to :sport }
    it { should have_many :athlete_events }
    it { should have_many(:athletes).through :athlete_events }
  end
end
