class Oystercard
    attr_reader :balance, :max_limit
    BALANCE = 0
    MAX_LIMIT = 90
    def initialize(balance = BALANCE, max_limit = MAX_LIMIT)
        @balance = balance 
        @max_limit = max_limit
    end 

    def top_up(value)
     fail "Maximum balance is £#{max_limit}." if value + balance > MAX_LIMIT
        @balance += value 
      end
end     