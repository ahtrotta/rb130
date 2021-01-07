require 'minitest/autorun'

class BooleanAssertions < Minitest::Test
  def test_odd_value
    assert 4.odd?, 'expected value to be odd'
  end
end
