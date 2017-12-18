require_relative "bank_account.rb"
require 'pry'

class Transfer

attr_reader :bank_account

attr_accessor :transfer, :status, :amount, :sender, :receiver

  def initialize(sender, receiver, amount, status='pending')
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def valid?
    if receiver.valid? && sender.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      self.status =  "complete"
      sender.balance -= self.amount
      receiver.balance += self.amount
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    # binding.pry
    if self.status == "complete"

      receiver.balance -= self.amount
      sender.balance += self.amount
      self.status="reversed"

    end
  end

end
