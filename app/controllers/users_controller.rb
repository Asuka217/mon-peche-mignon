class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show

  def show
    @user = User.find(params[:id])
    @trainings = current_user.trainings.order('created_at DESC')
    unless current_user.id == @user.id
      redirect_to root_path
    end
  end
end