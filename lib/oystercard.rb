require_relative 'journey_log'

class Oystercard
  attr_reader :balance, :journey

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @journey_log = Journey_log
  end

  def top_up(amount)
    @balance + amount > MAX_BALANCE ? "card has balance limit of £#{MAX_BALANCE}" : @balance += amount
  end

  def touch_in(station)
    raise "Balance below minimum of #{MIN_BALANCE}" unless @balance >= MIN_BALANCE
    @journey = @journey_log.new.start(station)
  end

  def touch_out(station)
    @journey.finish(station)
    # @history << @journey.current_journey
    deduct(MIN_BALANCE)
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
