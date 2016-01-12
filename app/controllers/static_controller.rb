class StaticController < ApplicationController

  def index
    @inverse = "false"
    @ride = Ride.new
  end

  def search
    @ride = Ride.new(ride_params)
    redirect_to results_path
  end

  def result
    @rides = Ride.where(nil)
    # filtering_params(params).each do |key, value|
    #   @rides = @rides.public_send(key, value) if value.present?
    # end
    if current_user.present?
      # @ride = current_user.rides.new(ride_params)
    else
      # @ride = Ride.new
    end
  end

private
  def filtering_params(params)
    params.slice(:start, :date)
  end

  def ride_params
    params.require(:ride).permit(:date, :time, :start, :end)
  end

end
