require 'minitest/autorun'
require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @file = File.open('sample_text.txt')
  end

  def test_swap
    text = @file.read
    text_sub = text.gsub('a', 'e')
    obj = Text.new(text)
    assert_equal text_sub, obj.swap('a', 'e')
  end

  def teardown
    @file.close
  end
end
