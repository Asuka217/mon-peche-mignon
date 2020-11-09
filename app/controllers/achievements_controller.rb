class AchievementsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :move_to_index, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_achievement, only: [:edit, :update, :destroy]

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

  def update
    if @achievement.update(achievement_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @achievement.destroy
      redirect_to root_path
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

  def set_achievement
    @training = Training.find(params[:training_id])
    @achievement = Achievement.find(params[:id])
  end

end
