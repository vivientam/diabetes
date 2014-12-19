class ReadingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create] 


  def index
    # @readings = Reading.all
    @readings = current_user.readings
  end

  def new
    @reading = Reading.new
  end

  # this is also function
  def create
    # reading = Reading.new(title: params[:reading][:title], url: params[:reading][:title])
    reading = current_user.readings.new(reading_params)
    
    if reading.save # this goes to the model and check all the validations before it gets saved
      # if validation passes, then it saves, and it returns true
      # otherwise, it returns false
      redirect_to readings_path
    else
      # if the record doesnt save because it didnt pass the validations
      # flash[:message] = reading.errors.messages[:base]

      flash[:message] = reading.errors.messages

      redirect_to :back
    end
  end

  def show
    @reading = Reading.find(params[:id])
    @comment = Comment.new
  end

  private

  def reading_params
    params.require(:reading).permit(:sugar_level, :weight)
  end
end
