require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @transaction1 = Transaction.new(10)
    @transaction2 = Transaction.new(8.5)

    @cash_register = CashRegister.new(100)
  end

  def test_accept_money
    @transaction1.amount_paid = @transaction1.item_cost
    @transaction2.amount_paid = @transaction2.item_cost
    
    @cash_register.accept_money(@transaction1)
    assert_equal 110, @cash_register.total_money

    @cash_register.accept_money(@transaction2)
    assert_equal 118.5, @cash_register.total_money
  end
end
