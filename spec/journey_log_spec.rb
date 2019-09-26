require 'journey_log'

describe Journey_log do
  subject(:journey_log) { described_class.new }
  let(:journey) { double(:journey) }
  let(:entry_station) { double(:entry_station) }
  let(:exit_station) { double(:exit_station) }

  it 'should initialize with an empty array' do
    expect(journey_log.journey_list).to eq []
  end

  # it "stores journey to journey list" do
  #   subject.top_up(10)
  #   subject.touch_in(entry_station)
  #   subject.touch_out(exit_station)
  #   expect(subject.journey_list).to include(journey)
  # end

  describe '#start' do
    it "should start a new journey with an entry station" do
      expect(journey_log.start(entry_station).class).to eq Journey
    end

    # it "should not start a new journey if journey incomplete" do
    #   journey_log.start(entry_station)
    #   message = "Error: journey incomplete"
    #   expect(journey_log.start(entry_station)).to raise_error message
    # end
  end

  describe '#finish' do
    it "pushes a completed journey to journey list" do
      journey_log.start(entry_station)
      journey_log.finish(exit_station)

      # allow(journey_class).to received(:new).and_return journey
      journey_log.start(exit_station)
      expect(journey_log.journey_list).to include Journey
    end
  end
end
