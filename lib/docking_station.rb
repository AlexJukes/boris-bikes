require './lib/bike.rb'

class DockingStation
  #We initialize the class and set the bikes variable to be an empty Array
    def initialize
      @bikes = []
    end
  def release_bike
    raise "No bikes available." if empty? # Guard condition
    bikes.pop
  end

  def dock_bike(bike_56)
      raise "Docking station is full" if full?
      bikes << bike_56
  end
  attr_reader :bikes

  private

  def full?
    bikes.length >= 20
  end

  def empty?
    bikes.empty?
  end

end
