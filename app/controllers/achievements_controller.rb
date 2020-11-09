class AchievementsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :move_to_index, only: [:new, :create]

  def new
    @training = Training.find(params[:training_id])
    @achievement = Achievement.new
  end

  def create
    @training = Training.find(params[:training_id])
    @achievement = Achievement.new(achievement_params)
    if @achievement.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def achievement_params
    params.require(:achievement).permit(:date_end, :report, :image).merge(user_id: current_user.id, training_id: (params[:training_id]))
  end

  def move_to_index
    @training = Training.find(params[:training_id])
    unless current_user.id == @training.user_id
      redirect_to root_path
    end
  end
end
