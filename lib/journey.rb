require "oystercard.rb"
class Journey
  PENALTY_FARE = 6
  attr_reader :entry_station
  def initialize(entry_station = nil)
    @entry_station = entry_station
    @exit_station = nil
  end
  def end(exit_station)
    @exit_station = exit_station
    calc_fare
  end
  def calc_fare
    return PENALTY_FARE if penalty?
    @fare = Oystercard::MIN_BALANCE
  end
end
private
def penalty?
  @exit_station == nil || @entry_station == nil
end