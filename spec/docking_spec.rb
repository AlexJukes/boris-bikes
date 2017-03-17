require 'docking_station.rb'

describe DockingStation do
  it { is_expected.to respond_to :release_bike}

  it 'gets a bike from docking station and expects it to be working' do
    bike_56 = Bike.new
    expect(bike_56).to be_working
  end
  it 'checks if DockingStation instance responds to dock_bike method.' do
  expect(subject).to respond_to :dock_bike #It (the station_LB should respond to the method :dock_bike)
end
  it 'checks that station_LB responds to dock_bike method with 1 argument' do
    expect(subject).to respond_to(:dock_bike).with(1).argument
end
 it 'station_LB.dock_bike(bike_56) to return an instance variable which stores bike_56' do
  bike_56 = Bike.new #Instead of magically creating a bike from DockingStation, we create a bike from the class.
  subject.dock_bike(bike_56)
  expect(subject.bikes.pop).to eq bike_56
  end
  it 'raises an Exception when user tries to release bike and there are no bikes docked at that station' do
  expect { subject.release_bike }.to raise_error("No bikes available.")
end
  it 'raises Exception when user tries to dock a bike to a station that is full (capacity = 20)' do
    DockingStation::DEFAULT_CAPACITY.times {subject.dock_bike(Bike.new)}
    expect { subject.dock_bike(Bike.new) }.to raise_error("Docking station is full")
  end

  it 'sets the capacity to the argument given when initializing the class' do
    d = DockingStation.new(30)
    expect(d.capacity).to eq 30
  end

  it 'has a default capacity of 20' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'expects to raise an exception when we try to release a broken bike' do
    bike1 = Bike.new
    bike1.report_broken
    subject.dock_bike(bike1)
    3.times {subject.dock_bike(Bike.new)}
    bike2 = Bike.new
    bike2.report_broken
    subject.dock_bike(bike2)
    expect(subject.release_bike).to be_a(Bike)
  end

  it 'expects to raise an exception when we try to release a broken bike' do
    bike = Bike.new
    bike.report_broken
    subject.dock_bike(bike)
    expect {subject.release_bike}.to raise_error 'No working bikes'
  end

end

#subject is always BRAND NEW.
