class LeaguesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @league = League.new
  end

  def create
    @league = League.new(league_params)
    if @league.save && current_user.add_role(:owner, @league)
      redirect_to league_path(@league)
    else
      render :new
    end
  end

  def show
    @league = League.find(params[:id])
    raise NotAuthorizedError unless user_is_member_or_better?(current_user, @league)
  end

  private

  def league_params
    params.require(:league).permit(:name, :description, :location, :public_league)
  end
end