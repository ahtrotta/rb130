# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(item)
    raise TypeError, 'Can only add Todo objects' unless item.is_a?(Todo)
    @todos << item
  end

  def <<(item)
    add(item)
  end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def to_a
    @todos.map(&:dup)
  end

  def done?
    @todos.all?(&:done?)
  end

  def item_at(idx)
    @todos.fetch(idx)
  end

  def mark_done_at(idx)
    @todos.fetch(idx).done!
  end

  def mark_undone_at(idx)
    @todos.fetch(idx).undone!
  end

  def done!
    @todos.each(&:done!)
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(idx)
    @todos.fetch(idx)
    @todos.delete_at(idx)
  end

  def to_s
    puts "---- #{@title} ----"
    puts @todos
  end
end

# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
begin
  list.add(1)                     # raises TypeError with message "Can only add Todo objects"
rescue TypeError
  p true
end

# <<
# same behavior as add

# ---- Interrogating the list -----

# size
p list.size == 3                       # returns 3

# first
p list.first == todo1                      # returns todo1, which is the first item in the list

# last
p list.last == todo3                       # returns todo3, which is the last item in the list

#to_a
puts list.to_a                      # returns an array of all items in the list

#done?
p list.done? == false                     # returns true if all todos in the list are done, otherwise false

# ---- Retrieving an item in the list ----

# item_at
begin
  list.item_at                    # raises ArgumentError
rescue ArgumentError
  p true
end
p list.item_at(1) == todo2                 # returns 2nd item in list (zero based index)
begin
  list.item_at(100)               # raises IndexError
rescue IndexError
  p true
end

# ---- Marking items in the list -----

# mark_done_at
begin
  list.mark_done_at               # raises ArgumentError
rescue ArgumentError
  p true
end
list.mark_done_at(1)            # marks the 2nd item as done
begin
  list.mark_done_at(100)          # raises IndexError
rescue IndexError
  p true
end

# mark_undone_at
begin
  list.mark_undone_at             # raises ArgumentError
rescue ArgumentError
  p true
end
list.mark_undone_at(1)          # marks the 2nd item as not done,
begin
  list.mark_undone_at(100)        # raises IndexError
rescue IndexError
  p true
end

# done!
list.done!                      # marks all items as done
p list.done? == true

# ---- Deleting from the list -----

# shift
#puts list.shift == todo1                      # removes and returns the first item in list

# pop
#puts list.pop == todo3                        # removes and returns the last item in list

# remove_at
begin
  list.remove_at                  # raises ArgumentError
rescue ArgumentError
  p 'ArgumentError for remove_at'
end
puts list.remove_at(1)               # removes and returns the 2nd item
begin
  list.remove_at(100)             # raises IndexError
rescue IndexError
  p 'IndexError for remove_at'
end

# ---- Outputting the list -----

# to_s
list.to_s                      # returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym
