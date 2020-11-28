require 'minitest/autorun'

class TestInclusion < Minitest::Test
  def test_object_inclusion
    assert_includes list, 'xyz'
  end
end
