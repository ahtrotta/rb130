require 'minitest/autorun'

class TestList
  def process
    self
  end
end

class SameObjectAssertions < Minitest::Test
  def setup
    @list = TestList.new
  end

  def test_same_object
    assert_same @list, @list.process
  end
end
