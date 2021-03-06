require_relative 'bike'

class DockingStation

  attr_reader :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    bikes.pop
  end
  def dock(bike)
    fail 'Docking Station full' if full?
    bikes << bike
  end
  attr_reader :bikes
  private


  def empty?
    bikes.empty?
  end
  def full?
    bikes.count >= capacity
  end
end
