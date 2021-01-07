require 'minitest/autorun'

class NoExperienceError < StandardError; end

class Employee
  def hire
    raise NoExperienceError
  end
end

class ExceptionAssertions < Minitest::Test
  def setup
    @employee = Employee.new
  end

  def test_experience_exception
    assert_raises(NoExperienceError) { @employee.hire }
  end
end
