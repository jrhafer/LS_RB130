require 'minitest/autorun' #library that gives us access to certain parts of
                           # minitest framework needed
require_relative 'cash_register' #require the class we want to test
require_relative 'transaction' #also require the collaborator class

class CashRegisterTest < Minitest::Test
  def test_accept_money
    register = CashRegister.new(100)
    transaction = Transaction.new(20)
    transaction.amount_paid = 20
    register.accept_money(transaction)


    assert_equal(120, register.total_money)
  end

  def test_change
    register = CashRegister.new(100)
    transaction = Transaction.new(20)
    transaction.amount_paid = 30

    assert_equal(10, register.change(transaction))
  end

  def test_give_receipt
    register = CashRegister.new(100)
    transaction = Transaction.new(20)
    transaction.amount_paid = 20
    amount = 20

    assert_output("You've paid $#{amount}.\n") do
      register.give_receipt(transaction)
    end
  end

  def test_prompt_for_payment
    transaction = Transaction.new(30)
    output = StringIO.new
    input = StringIO.new("30\n")
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal(30, transaction.amount_paid)
  end
end