class MembersController < ApplicationController
  before_action :load_squad
  before_action :load_member, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @member = @squad.members.build
  end

  def create
    @member = @squad.members.build(member_params)
    if @member.save
      redirect_to squad_member_path(@squad, @member)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @member.update(member_params)
      redirect_to squad_member_path(@squad, @member)
    else
      render :edit
    end
  end

  def destroy
    @member.destroy
    redirect_to squad_path(@squad)
  end

  private

  def load_squad
    @squad = Squad.find_by!(slug: params[:squad_id])
  end

  def load_member
    @member = @squad.members.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:name, :email)
  end
end
