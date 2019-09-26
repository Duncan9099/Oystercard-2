
class Journey

  attr_reader :journey_complete, :exit_station

  PENALTY_FARE = 6
  MIN_FARE = 1

  def initialize(entry_station)
    @journey_complete = false
    @entry_station = entry_station
  end

  def finish(exit_station)
    @exit_station = exit_station
    @journey_complete = true
  end

  def journey_complete?
    @journey_complete
  end

  def fare
    journey_complete? ? MIN_FARE : PENALTY_FARE
  end
end
