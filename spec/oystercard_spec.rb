require 'oystercard.rb'

describe Oystercard do
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
    it "Deducts money from balance " do
      subject.top_up(20)
      expect(subject.deduct(2)).to eq (18)
    end

    it 'is initially not in a journey' do
        expect(subject).not_to be_in_journey
      end

      it "can touch in" do
        subject.touch_in
        expect(subject).to be_in_journey
      end
end