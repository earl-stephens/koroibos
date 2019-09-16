require "rails_helper"

RSpec.describe AthleteEvent, type: :model do
  describe 'relationships' do
    it { should belong_to :athlete }
    it { should belong_to :event }
  end
end
