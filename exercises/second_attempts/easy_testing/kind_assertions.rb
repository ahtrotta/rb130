require 'minitest/autorun'

class KindAssertions < Minitest::Test
  def setup
    @value = 4
  end

  def test_kind_of_object
    assert_kind_of Numeric, @value
  end
end
