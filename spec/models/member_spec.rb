require 'rails_helper'

RSpec.describe Member, type: :model do
  subject(:member) { FactoryGirl.create(:member) }

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :email }

  describe '#to_s' do
    subject { member.to_s }
    let(:member) { FactoryGirl.create(:member, name: "Ripley") }
    it { is_expected.to eq "Ripley" }
  end

  context 'with a gross-looking email address' do
    subject(:member) { FactoryGirl.create(:member, email: " Ripley@sula.co\t") }

    it 'sanitizes the email address' do
      expect(member.email).to eq 'ripley@sula.co'
    end
  end
end
