class Oystercard
    attr_reader :balance, :max_limit, :entry_station, :exit_station
    BALANCE = 0
    MAX_LIMIT = 90
    MIN_BALANCE = 1
    def initialize(balance = BALANCE, max_limit = MAX_LIMIT)
      @balance = balance
      @max_limit = max_limit
      @in_journey = false
      @current_journey = {}
      @journey_history = []
    end 

    def top_up(value)
     fail "Maximum balance is £#{max_limit}." if value + balance > MAX_LIMIT
        @balance += value 
      end

    def in_journey?
      @in_journey
    end 

    def touch_in(station)
      fail "Your balance is unsufficient" if @balance < MIN_BALANCE
      @in_journey = true
      @current_journey[:entry] = station
    end 

    def touch_out(exit_station)
      deduct(MIN_BALANCE)
      @in_journey = false
      @current_journey[:exit] = exit_station
      add_journey
    end

    private 

    def deduct(fare)
      @balance -= fare
    end

    def add_journey
      @entry_station = nil
      @journey_history.push(@current_journey)
    end 
end    