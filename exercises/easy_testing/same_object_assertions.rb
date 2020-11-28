require 'minitest/autorun'

class TestObject < Minitest::Test
  def test_object
    assert_same list, list.process
  end
end
