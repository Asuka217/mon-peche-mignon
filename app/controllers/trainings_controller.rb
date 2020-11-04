class TrainingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
  end

  def new
    @training = Training.new
  end

  def create
    @training = Training.new(training_params)
    if @training.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def training_params
    params.require(:training).permit(:goal, :reward, :date_start).merge(user_id: current_user.id)
  end

end
