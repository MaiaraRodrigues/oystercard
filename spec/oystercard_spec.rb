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
    
end

# it 'should not exceed the balance of #{subject.maximum limit}' do
#     maximum_limit = Oystercard::BALANCE_LIMIT
#     subject.top_up(maximum_limit)
#     expect { subject.top_up(1) }
#       .to raise_error "Maximum balance is £#{subject.maximum_limit}."
#   end