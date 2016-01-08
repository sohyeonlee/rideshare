class RideController < ApplicationController
  def index
  end

  def create
    @ride = current_user.rides.new(ride_params)
    if @ride.save
      redirect_to rides_users_path
    else
      render 'new'
    end
  end

  def new
    @ride = current_user.rides.new
  end

  def edit
    @ride = Ride.find_by_id(params[:id])
  end

  def update
    @ride = Ride.
  end
  def destroy
    ride = Ride.find_by_id(params[:id])
    if ride.nil?
      redirect_to "new"
    else
      ride.destroy
      redirect_to rides_users_path
    end
  end

private
  def ride_params
    params.require(:ride).permit(:date, :time, :start, :end)
  end

end
