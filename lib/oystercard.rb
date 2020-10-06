class Oystercard
    attr_reader :balance
    BALANCE = 0
    def initialize(balance = BALANCE)
        @balance = balance 
    end 

    def top_up(value)
      @balance += value 
    end 
end     