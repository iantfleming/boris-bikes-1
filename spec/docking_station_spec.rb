require 'docking_station'


describe DockingStation do
  it { is_expected.to respond_to(:release_bike)}

  it 'releases working bikes' do
    bike = Bike.new
    expect(bike.working?).to eq true
  end

  # it 'expects a response to dock with 1 argument(bike)' do
  #   expect(subject).to respond_to(:dock).with(1).argument
  # end

  it 'will see if a bike is in the docking station' do
    expect(subject).to respond_to(:bike)
  end


  it 'allows the bike to be docked' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
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

  end
end
