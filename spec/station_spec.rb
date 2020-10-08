require 'station'

describe Station do
     
    it "assigns variable for station name"  do
        subject = Station.new("Stratford", 1)
        expect(subject.name).to eq "Stratford"
    end

    it "assigns variable for zone" do
        subject = Station.new("Stratford", 1)
        expect(subject.zone).to eq 1
    end
end