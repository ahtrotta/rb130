require 'minitest/autorun'

class TestOdd < Minitest::Test
  def test_odd
    assert(value.odd?)
  end
end
