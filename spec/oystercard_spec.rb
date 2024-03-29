require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }
  let(:entry_station){ double :station }
  let(:exit_station){ double :station }
  let(:journey){ {:entry_station => entry_station, :exit_station => exit_station} }

  it 'checks money on card' do
    expect(oystercard.balance).to eq 0
  end

  describe '#add_money' do
    it 'adds amount to card' do
      oystercard.top_up(10)
      expect(oystercard.balance).to eq 10
    end

    it 'limits the balance to 90' do
      max_balance = Oystercard::MAX_BALANCE
      subject.top_up(max_balance)
      expect(oystercard.top_up(1)).to eq "card has balance limit of £#{Oystercard::MAX_BALANCE}"
    end
  end

  describe "#touch_in" do
    it "throws error if insufficent balance" do
      expect { subject.touch_in(entry_station) } .to raise_error "Balance below minimum of #{Oystercard::MIN_BALANCE}"
    end
  end

  describe "#touch_out" do
    it "deducts minimum fare from balance when touching out" do
      subject.top_up(10)
      subject.touch_in(entry_station)
      expect{subject.touch_out(exit_station)}.to change{oystercard.balance}.by (-Oystercard::MIN_BALANCE)
    end
  end
end
