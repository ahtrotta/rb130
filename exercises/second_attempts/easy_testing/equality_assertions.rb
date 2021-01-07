require 'minitest/autorun'

class EqualityAssertion < Minitest::Test
  def setup
    @value = 'XYZ'
  end

  def test_downcase
    assert_equal 'xyz', @value.downcase
  end
end

