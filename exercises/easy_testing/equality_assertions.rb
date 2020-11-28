require 'minitest/autorun'

class TestDowncase < Minitest::Test
  def test_downcase
    assert_equal 'xyz', value.downcase
  end
end
