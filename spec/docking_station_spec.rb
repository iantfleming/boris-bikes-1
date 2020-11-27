require 'docking_station'

describe DockingStation do

  it 'will accept a set capacity' do

    #set_capacity = subject(@capacity)
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end
  it { is_expected.to respond_to(:release_bike)}

  it 'releases working bikes' do
    bike = Bike.new
    expect(bike.working?).to eq true
  end

  # it 'expects a response to dock with 1 argument(bike)' do
  #   expect(subject).to respond_to(:dock).with(1).argument
  # end

  it 'will see if a bike is in the docking station' do
    expect(subject).to respond_to(:bikes)
  end


  it 'allows the bike to be docked' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to eq [bike]
  end

  describe '#release_bike' do
    it 'releses a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'will raise an error if docking station is empty' do
      expect { subject.release_bike }.to raise_error "No bikes available"
    end

    # it 'will raise an error if docking station contains 1 bike' do
    #   bike = Bike.new
    #   subject.dock(bike)
    #   expect { subject.dock(bike) }.to raise_error 'Bike already in dock'
    # end

    describe '#dock' do
      it 'raises an error when full' do
        subject.capacity.times { subject.dock(Bike.new) }
        expect { subject.dock(Bike.new) }.to raise_error 'Docking Station full'
      end
    end

  end
end
