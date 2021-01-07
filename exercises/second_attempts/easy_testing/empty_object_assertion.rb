require 'minitest/autorun'

class EmptyObjectAssertions < Minitest::Test
  def setup
    @list = []
  end

  def test_empty_list
    assert_empty @list
  end
end
