class StaticController < ApplicationController

  def index
    @inverse = "false"
    @ride = Ride.new
  end

  def search
    @ride = Ride.new
    render "result"
  end

  def result
    @rides = Ride.where(nil)
    filtering_params(params).each do |key, value|
      @rides = @rides.public_send(key, value) if value.present?
    end
  end

private
  def filtering_params(params)
    params.slice(:start, :date)
  end
end
