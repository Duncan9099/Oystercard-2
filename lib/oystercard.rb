class Oystercard
  attr_reader :balance

  MAX_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    @balance + amount > MAX_BALANCE ? "card has balance limit of £#{MAX_BALANCE}" : @balance += amount
  end
end
