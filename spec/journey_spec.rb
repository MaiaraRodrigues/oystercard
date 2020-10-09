require "journey.rb"

describe Journey do 
    let(:entry_station) { double :entry_station}

    it "takes an entry station when starts a journey" do
        subject = Journey.new(:entry_station)
        expect(subject.entry_station).to eq :entry_station
    end

    it "calculates the fare of the journey" do
        subject = Journey.new(:entry_station)
        expect(subject.end(:exit_station)).to eq Oystercard::MIN_BALANCE
    end 

    it "gives a penalty fare of 6 if entry/exit station is nil" do
        subject = Journey.new
        expect(subject.calc_fare).to eq Journey::PENALTY_FARE
    end
end 


