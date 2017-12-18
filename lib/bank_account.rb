require_relative "transfer.rb"


class BankAccount

attr_accessor :balance, :status
attr_reader :name

  def initialize(name, balance= 1000, status= "open")
    @name = name
    @balance = balance
    @status = status
  end

  def deposit(money)
    @balance += money
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def close_account
    @status = 'closed'
  end

  def valid?
    if @status == 'open' && @balance > 0
      true
    else
      false
    end
  end
end
