require 'minitest/autorun'

class TestEmpty < Minitest::Test
  def test_empty
    assert_empty list
  end
end
