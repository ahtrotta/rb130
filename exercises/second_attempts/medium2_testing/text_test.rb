require 'minitest/autorun'
require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @file = File.open('sample_text.txt')
    @text = @file.read
    @text_object = Text.new(@text)
  end

  def test_swap
    expected = @text.gsub('a', 'e')
    assert_equal expected, @text_object.swap('a', 'e')
  end

  def test_word_count
    assert_equal 72, @text_object.word_count
  end

  def teardown
    @file.close
  end
end
