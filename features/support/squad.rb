module SquadHelpers
  def squad
    @squad ||= FactoryGirl.create(:squad, :with_members)
  end

  def manager
    @manager ||= squad.managers.first
  end

  def member
    @member ||= squad.members.last
  end

  def new_member_details
    @new_member_details ||= {
      name: 'Bishop',
      email: 'bishop@sula.co'
    }
  end
end

World(SquadHelpers)
