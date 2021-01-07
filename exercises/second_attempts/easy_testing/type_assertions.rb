require 'minitest/autorun'

class TypeAssertions < Minitest::Test
  def setup
    @value = Numeric.new
  end

  def test_numeric_value
    assert_instance_of Numeric, @value
  end
end
