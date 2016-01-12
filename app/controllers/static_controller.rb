class StaticController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]

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
    @rides = Ride.where("start=? AND end=? AND date=?", params[:ride][:start], params[:ride][:end], params[:ride][:date])
    jsakljf;lksjf;
  end
private
  def ride_params
    params.require(:ride).permit(:date, :time, :start, :end, :comment)
  end

end
