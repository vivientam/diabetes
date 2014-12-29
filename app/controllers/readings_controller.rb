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
    params 
    reading = Reading.new
    reading = reading.save

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
