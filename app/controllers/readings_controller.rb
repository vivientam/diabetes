class ReadingsController < ApplicationController

before_action :authenticate_user!, only: [:new, :create, :index, :cat]

  def cat
    @my_message = "Hello what's up"
  end

  def index
    # @readings = Reading.all

    @something_something = "lalaalalalala"

    @readings = current_user.readings
    # binding.pry

    respond_to do |format|
      format.json{ render :json =>  @readings }
      format.html
    end
    
  end

  def new
    @reading = Reading.new
  end

  # this is also function
  def create 
    reading = current_user.readings.new(reading_params)
    if reading.save
      redirect_to reading
    end
  end

  def show
    @reading = Reading.find(params[:id])
    @comment = Comment.new
  end

  def data
    @readings = Reading.all
    render json: @readings, status: 201
  end

  private

  def reading_params
    params.require(:reading).permit(:sugar_level, :weight)
  end
end
