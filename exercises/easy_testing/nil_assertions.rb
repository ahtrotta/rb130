require 'minitest/autorun'

class TestNil < Minitest::Test
  def test_nil
    assert_nil value
  end
end
