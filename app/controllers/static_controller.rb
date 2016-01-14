class StaticController < ApplicationController
  before_filter :store_location
  before_filter :authenticate_user!, :only => [:search]

  def index
    @inverse = "false"
    @ride = Ride.new
  end

  def result
    if current_user.present?
      @ride = current_user.rides.new(ride_params)
      if !@ride.save
        redirect_to "index"
      end
      @rides = Ride.where("start=? AND end=? AND date=?", params[:ride][:start_point], params[:ride][:end_point], params[:ride][:date])
    else
      session[:ride_params] = params
      redirect_to new_user_registration_path
    end
  end

  def search
    @ride = current_user.rides.new(ride_params)
    @rides = Ride.where("start = ? AND end = ? AND date = ?", {start_point: params[:ride][:start_point], end_point: params[:ride][:end_point], date: params[:ride][:date]})
  end

private
  def ride_params
    params.require(:ride).permit(:date, :time, :start_point, :end_point, :comment)
  end
 def store_location
   session[:login_redirect] = request.path unless current_user
 end
end
