class SquadsController < ApplicationController
  before_action :load_squad, only: %i(show edit update destroy)

  def show
  end

  private

  def load_squad
    @squad = Squad.with_members.find_by!(slug: params[:id])
  end
end
