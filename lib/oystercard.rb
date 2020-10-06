class Oystercard
    attr_reader :balance, :max_limit
    BALANCE = 0
    MAX_LIMIT = 90
    def initialize(balance = BALANCE, max_limit = MAX_LIMIT)
        @balance = balance 
        @max_limit = max_limit
        # @in_journey = true

    end 

    def top_up(value)
     fail "Maximum balance is £#{max_limit}." if value + balance > MAX_LIMIT
        @balance += value 
      end

    def deduct(fare)
      @balance -= fare
    end   

    def in_journey?
        false 
      else 
        touch_in
    end 

    def touch_in
      true 
    end 

end    