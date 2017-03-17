require 'docking_station.rb'

describe DockingStation do

  let(:bike) { double :bike } # Creates dummy bike

 ####################################TESTS BEGIN #####################
  it { is_expected.to respond_to :release_bike}

  it 'gets a bike from docking station and expects it to be working' do
    allow(bike).to receive(:working?).and_return(true)
    expect(bike).to be_working #the method the bike double responds to is 'working?'
  end
  it 'checks if DockingStation instance responds to dock_bike method.' do
  expect(subject).to respond_to :dock_bike #It (the station_LB should respond to the method :dock_bike)
end
  it 'checks that station_LB responds to dock_bike method with 1 argument' do
    expect(subject).to respond_to(:dock_bike).with(1).argument
end
 it 'station_LB.dock_bike(bike_56) to return an instance variable which stores bike_56' do
  bike_56 = double(:bike) #Instead of magically creating a bike from DockingStation, we create a bike from the class.
  subject.dock_bike(bike_56)
  expect(subject.bikes.pop).to eq bike_56
  end
  it 'raises an Exception when user tries to release bike and there are no bikes docked at that station' do
  expect { subject.release_bike }.to raise_error("No bikes available.")
end
  it 'raises Exception when user tries to dock a bike to a station that is full (capacity = 20)' do
    DockingStation::DEFAULT_CAPACITY.times {subject.dock_bike(double(:bike))}
    expect { subject.dock_bike(double(:bike)) }.to raise_error("Docking station is full")
  end

  it 'sets the capacity to the argument given when initializing the class' do
    d = DockingStation.new(30)
    expect(d.capacity).to eq 30
  end

  it 'has a default capacity of 20' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'should release a working bike even when there are broken bikes docked' do
    # We create a new bike and break it, then dock it.
    bike1 = double("bike", :broken => true)
    bike1_id = bike1.object_id
    bike1.broken
    subject.dock_bike(bike1)
    #We create another new bike that's working and dock it.
    bike2 = double("bike", :broken => false)
    bike2_id = bike2.object_id
    subject.dock_bike(bike2)
    #We create a third bike, break it, and add it to the dock.
    bike3 = double("bike", :broken => true)
    bike3_id = bike3.object_id
    bike3.broken
    subject.dock_bike(bike3)
    #Now we expect the dock to return us the one working bike.
    # expect((subject.bikes[0]).object_id).to eq(bike1_id)
    expect((subject.release_bike).broken).to eq(false)
  end

  it 'expects to raise an exception when we try to release a broken bike' do
    bike1 = double(:bike)
    allow(bike1).to receive(:broken).and_return(true)
    bike1.broken
    subject.dock_bike(bike1)
    expect {subject.release_bike}.to raise_error 'No working bikes'
  end

end

#subject is always BRAND NEW.
