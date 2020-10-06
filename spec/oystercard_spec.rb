require 'oystercard.rb'

describe Oystercard do
  it "Has a initial balance of 0" do
      expect(subject.balance).to eq (0)
  end
   
  it " Allows to top up card" do
    subject.top_up(5)
    expect(subject.balance).to eq (5)
  end
    
end