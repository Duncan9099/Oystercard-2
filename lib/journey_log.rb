require_relative 'journey'

class Journey_log

  attr_reader :journey_list, :current_journey

  def initialize(journey_class = Journey)
    @journey_list = []
    # @current_journey = []
    @journey_class = journey_class
  end

  def start(entry_station)
    @journey = @journey_class.new(entry_station)
    # @current_journey << entry_station
  end

  def finish(exit_station)
    @journey.finish(exit_station)
    @journey_list << @journey
  end

  private

  def current_journey
    incomplete_journey ||= @journey_class.new
  end

  def incomplete_journey
    journey.journey_complete? == false
  end

end
