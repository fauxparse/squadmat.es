require 'rails_helper'

RSpec.describe Squad, type: :model do
  subject(:squad) { FactoryGirl.create(:squad) }

  it { is_expected.to validate_presence_of :name }
end
