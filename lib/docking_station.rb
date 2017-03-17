require './lib/bike.rb'

class DockingStation
    DEFAULT_CAPACITY = 20
  #We initialize the class and set the bikes variable to be an empty Array
    def initialize(capacity = DEFAULT_CAPACITY)
      @bikes = []
      @capacity = capacity
    end
  def release_bike
    raise "No bikes available." if empty? # Guard condition
    # iterate over array and return the first working bike found
    bikes.each_index { |index| return bikes.slice!(index) unless bikes[index].broken }
    raise "No working bikes"
  end

  def dock_bike(bike_56)
      raise "Docking station is full" if full?
      bikes << bike_56
  end
  attr_reader :bikes, :capacity

  private

  def full?
    bikes.length >= DEFAULT_CAPACITY
  end

  def empty?
    bikes.empty?
  end

end
