require 'minitest/autorun'

class TestKind < Minitest::Test
  def test_kind
    assert_kind_of Numeric, value
  end
end
