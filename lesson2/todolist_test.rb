require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(@todos.size, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end
  
  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal(2, @list.size)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(@todos.all?(&:done?), @list.done?)
  end

  def test_type_error
    assert_raises(TypeError) { @list.add(3) }
    assert_raises(TypeError) { @list.add('string') }
  end

  def test_shovel
    new_todo = Todo.new("Test TodoList class")
    @list << new_todo
    @todos << new_todo
    assert_equal(@todos, @list.to_a)
  end

  def test_add
    new_todo = Todo.new("Test TodoList class")
    @list.add(new_todo)
    @todos << new_todo
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_equal(@todo2, @list.item_at(1))
    assert_raises(IndexError) { @list.item_at(3) }
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(100) }
    @list.mark_done_at(1)
    assert(@todo2.done?)
  end

  def test_mark_undone_at
    @todo2.done!
    assert_raises(IndexError) { @list.mark_undone_at(100) }
    @list.mark_undone_at(1)
    assert_equal(false, @todo2.done?)
  end

  def test_done_bang
    @list.done!
    assert(@todo1.done?)
    assert(@todo2.done?)
    assert(@todo3.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    removed = @list.remove_at(1)
    assert_equal(@todo2, removed)
    assert_equal([@todo1, @todo3], @list.to_a)
  end
  
  def test_to_s
    skip
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    
    assert_equal(output, @list.to_s)
  end

  def test_each
    test_arr = []
    each_return = @list.each { |todo| test_arr.unshift(todo) }
    assert_equal(@todos.reverse, test_arr)
    assert_same(@list, each_return)
  end

  def test_select
    @todo1.done!
    new_list = TodoList.new('')
    new_list.add(@todo2)
    new_list.add(@todo3)

    assert_equal(new_list.to_a, @list.select { |todo| !todo.done? }.to_a)
  end
end
