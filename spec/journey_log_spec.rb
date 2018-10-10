require 'journey_log'

describe Journey_log do
  describe 'start' do
    it 'starts a journey' do
      subject.start
      expect(subject.previous_journey).not_to be_empty
    end
  end
  describe 'current journey' do
    it 'shows current journey' do
      subject.start
      expect(subject.current_journey).not_to eq nil
    end
  end
  describe 'end' do
    it 'ends a journey' do
      subject.start
      subject.finish
      expect(subject.previous_journey[:exit_station]).not_to eq nil

    end
  end
  describe 'All journeys' do
    it 'prints all jorneys' do
      subject.start
      subject.finish
      expect(subject.all_journeys).to eq "start oldstreet end barbican"
    end
  end
end
