class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
   @sender = sender
   @receiver = receiver
   @status = "pending"
   @amount = amount
   #binding.pry
  end  
  
  def valid?
   @sender.valid? && receiver.valid?
  end  
  
  def execute_transaction
    if valid? && sender.balance > amount
      if status == "pending"
        sender.balance -= amount
        receiver.balance += amount
        self.status = "complete"
      end
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
end
