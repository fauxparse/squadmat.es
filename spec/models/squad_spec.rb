require 'rails_helper'

RSpec.describe Squad, type: :model do
  subject(:squad) { FactoryGirl.create(:squad, name: "Sulaco") }

  it { is_expected.to validate_presence_of :name }

  describe '#to_s' do
    subject { squad.to_s }
    it { is_expected.to eq "Sulaco" }
  end

  describe '#to_param' do
    subject { squad.to_param }
    it { is_expected.to eq "sulaco" }
  end
end
