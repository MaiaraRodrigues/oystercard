require 'oystercard.rb'

describe Oystercard do

  let(:leyton) { double :station }

  it "Has a initial balance of 0" do
      expect(subject.balance).to eq (0)
  end
   
  it " Allows to top up card" do
    subject.top_up(5)
    expect(subject.balance).to eq (5)
  end

  it " does not exceeds £90" do
    max_limit = Oystercard::MAX_LIMIT
    subject.top_up(max_limit)
    expect { subject.top_up(1) }.to raise_error "Maximum balance is £#{subject.max_limit}."
  end

    it 'is initially not in a journey' do
        expect(subject).not_to be_in_journey
      end

      it "can touch in" do
        subject.top_up(5)
        subject.touch_in(leyton)
        expect(subject).to be_in_journey
      end

      it "can touch out" do
        subject.touch_out
        expect(subject).not_to be_in_journey
      end

      it " raises error if not enough founds" do
        expect { subject.touch_in(leyton) }.to raise_error "Your balance is unsufficient"
      end

      it "Deducts value when touching out" do
        subject.top_up(5)
        expect { subject.touch_out}.to change{subject.balance}.by(-1)
      end

      it "#touch_in should store the entry station" do
        subject.top_up(5)
        subject.touch_in(leyton)
        expect(subject.entry_station).to eq leyton
      end

      it "#touch_out should reset entry station to nil" do
        subject.top_up(5)
        subject.touch_in(leyton)
        subject.touch_out
        expect(subject.entry_station).to eq nil
      end

end