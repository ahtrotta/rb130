require 'minitest/autorun'

class Refutations < Minitest::Test
  def setup
    @list = [1, 2, 3]
  end
  
  def test_refutation
    refute_includes @list, 'xyz'
  end
end
