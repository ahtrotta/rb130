require 'minitest/autorun'

class TestException < Minitest::Test
  def test_no_experience_error
    assert_raises(NoExperienceError) { employee.hire }
  end
end
