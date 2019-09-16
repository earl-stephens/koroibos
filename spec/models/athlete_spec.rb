require "rails_helper"

RSpec.describe Athlete, type: :model do
  describe 'relationships' do
    it { should have_many :athlete_events }
    it { should have_many(:events).through :athlete_events }
  end
end
