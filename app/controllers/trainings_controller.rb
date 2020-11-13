class TrainingsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_training, only: [:edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @trainings = Training.all.order('created_at DESC')
  end

  def new
    @training = Training.new
  end

  def create
    @training = Training.new(training_params)
    if @training.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def update
    if @training.update(training_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def destroy
    @training.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def training_params
    params.require(:training).permit(:goal, :reward, :date_start,:expected_date, :image).merge(user_id: current_user.id)
  end

  def set_training
    @training = Training.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @training.user_id
      redirect_to root_path
    end
  end
end
