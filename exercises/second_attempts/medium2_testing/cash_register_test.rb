require 'minitest/autorun'
require_relative 'transaction'
require_relative 'cash_register'

class CashRegisterTest < Minitest::Test
  def setup
    @transaction1 = Transaction.new(50)
    @transaction2 = Transaction.new(75.0)
    @cash_register = CashRegister.new(100)
  end

  def test_accept_money
    @transaction1.amount_paid = 50
    assert_equal 150, @cash_register.accept_money(@transaction1)

    @transaction2.amount_paid = 75.0
    assert_equal 225, @cash_register.accept_money(@transaction2)
  end

  def test_change
    @transaction1.amount_paid = 50
    assert_equal 0, @cash_register.change(@transaction1)

    @transaction2.amount_paid = 25
    assert_equal -50, @cash_register.change(@transaction2)

    @transaction1.amount_paid = 75
    assert_equal 25, @cash_register.change(@transaction1)
  end

  def test_give_receipt
    assert_output("You've paid $50.\n", '') do
      @cash_register.give_receipt(@transaction1)
    end

    assert_output("You've paid $75.0.\n", '') do
      @cash_register.give_receipt(@transaction2)
    end
  end

  def test_prompt_for_payment
    output = StringIO.new
    input = StringIO.new("50\n")
    @transaction1.prompt_for_payment(input: input, output: output)
    assert_equal 50, @transaction1.amount_paid

    input = StringIO.new("95\n")
    @transaction2.prompt_for_payment(input: input, output: output)
    assert_equal 95, @transaction2.amount_paid
  end
end
