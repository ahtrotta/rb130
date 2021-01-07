require 'minitest/autorun'

class IncludedObjectAssertions < Minitest::Test
  def setup
    @list = ['xyz']
  end

  def test_included_object
    assert_includes @list, 'xyz'
  end
end
