require 'minitest/autorun'

class TestRefutations < Minitest::Test
  def test_refutation
    refute_includes list, 'xyz'
  end
end
