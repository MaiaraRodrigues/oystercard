class Oystercard
    attr_reader :balance, :max_limit, :entry_station
    BALANCE = 0
    MAX_LIMIT = 90
    MIN_BALANCE = 1
    def initialize(balance = BALANCE, max_limit = MAX_LIMIT)
      @balance = balance
      @max_limit = max_limit
      @in_journey = false
      @entry_station = nil
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
      @entry_station = station
      @in_journey = true
    end 

    def touch_out
      deduct(MIN_BALANCE)
      @entry_station = nil
      @in_journey
    end

    private 

    def deduct(fare)
      @balance -= fare
    end
end    