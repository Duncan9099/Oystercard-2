require 'journey'

describe Journey do
  subject(:journey) { described_class.new(:entry_station) }
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }

  describe '#initialize' do

    it 'journey complete equal false on initialization' do
      expect(journey.journey_complete).to eq false
    end
  end

  describe "#finish" do
    it 'sets journey complete to false' do
      journey.finish(exit_station)
      expect(journey.journey_complete).to eq true
    end

    it 'stores entry station in current_journey' do
      journey.finish(exit_station)
      expect(journey.exit_station).to eq(exit_station)
    end
  end

  describe "journey_complete?" do
    it "checks finishing completes a journey" do
      journey.finish(exit_station)
      expect(journey.journey_complete).to eq true
    end

    it "checks not finishing as incomplete journey" do
      expect(journey.journey_complete).to eq false
    end
  end

  describe "#fare" do
    it "deducts penalty fare if exit_station is empty" do
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end

    it "deducts min_fare fare if journey is complete" do
      journey.finish(exit_station)
      expect(journey.fare).to eq Journey::MIN_FARE
    end
  end
end
