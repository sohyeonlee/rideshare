class StaticController < ApplicationController
  before_filter :store_location
  before_filter :authenticate_user!, :only => [:result, :search]

  def index
    @inverse = "false"
    @ride = Ride.new
  end

  def result
    @ride = current_user.rides.new(ride_params)
    if !@ride.save
      redirect_to "index"
    end
    @rides = Ride.where("start=? AND end=? AND date=?", params[:ride][:start], params[:ride][:end], params[:ride][:date])
  end

  def search
    @ride = current_user.rides.new(ride_params)
    @rides = Ride.where("start=? AND end=? AND date=?", params[:ride][:start], params[:ride][:end], params[:ride][:date])
  end

private
  def ride_params
    params.require(:ride).permit(:date, :time, :start, :end, :comment)
  end
 def store_location
  session[:login_redirect] = request.path unless current_user
end
end
