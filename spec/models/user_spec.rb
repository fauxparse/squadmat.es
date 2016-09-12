require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { FactoryGirl.create(:user) }

  describe '#confirm' do
    context 'when there is an existing member with the same email' do
      before { FactoryGirl.create(:member, email: user.email) }

      it 'links the user with the member' do
        expect { user.confirm }.to change { user.members.count }.by 1
      end

      it 'gives the user access to the squad' do
        expect { user.confirm }.to change { user.squads.count }.by 1
      end
    end
  end
end
