require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

# Other tests omitted for brevity

class CashRegisterTest < Minitest::Test
  def test_change
    register = CashRegister.new(100)
    transaction = Transaction.new(20)
    transaction.amount_paid = 30

    assert_equal(10, register.change(transaction))
  end
end
