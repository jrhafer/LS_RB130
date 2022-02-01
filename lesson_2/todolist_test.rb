require 'simplecov'
SimpleCov.start

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
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    todo = @list.shift
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
    @list.mark_all_done
    assert_equal(true, @list.done?)
  end

  def test_raises_TypeError
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add('hello') }
  end

  def test_shovel
    @todo4 = Todo.new("Fold Laundry")
    @list << @todo4
    assert_equal([@todo1, @todo2, @todo3, @todo4], @list.to_a)
  end

  def test_add
    @todo4 = Todo.new("Fold Laundry")
    @list.add @todo4
    assert_equal([@todo1, @todo2, @todo3, @todo4], @list.to_a)
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_raises(IndexError) { @list.item_at(5) }
  end

  def test_mark_done_at
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
    assert_raises(IndexError) { @list.mark_done_at(100) }
  end

  def test_mark_undone_at
    @list.mark_all_done
    @list.mark_undone_at(0)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_raises(IndexError) { @list.mark_undone_at(100) }
  end

  def test_done!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    removed_todo = @list.remove_at(0)
    assert_equal(@todo1, removed_todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_to_s_one_done
    output_one_done = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    @list.mark_done_at(0)
    assert_equal(output_one_done, @list.to_s)
  end

  def test_to_s_all_done
    output_all_done = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
    @list.mark_all_done
    assert_equal(output_all_done, @list.to_s)
  end

  def test_each
    result = []
    @list.each { |todo| result << todo }
    assert_equal([@todo1, @todo2, @todo3], result)
  end

  def test_each_return_original_object
    assert_equal(@list, @list.each { |todo| puts todo })
  end

  def test_select
    return_todo_list = TodoList.new("@list.title")
    @list.mark_done_at(1)
    @list.select { |todo| return_todo_list.add(todo) if todo.done? }
    assert_equal([@todo2], return_todo_list.to_a)
  end

  def test_find_by_title
    assert_equal(@todo1, @list.find_by_title("Buy milk"))
  end

  def test_all_done
    @list.mark_done_at(0)
    assert_equal([@todo1], @list.all_done.to_a)
    @list.mark_done_at(1)
    assert_equal([@todo1, @todo2], @list.all_done.to_a)
    @list.mark_done_at(2)
    assert_equal([@todo1, @todo2, @todo3], @list.all_done.to_a)
  end

  def test_all_not_done
    assert_equal([@todo1, @todo2, @todo3], @list.all_not_done.to_a)
    @list.mark_done_at(0)
    assert_equal([@todo2, @todo3], @list.all_not_done.to_a)
    @list.mark_done_at(1)
    assert_equal([@todo3], @list.all_not_done.to_a)
    @list.mark_done_at(2)
    assert_equal([], @list.all_not_done.to_a)
  end

  def test_mark_done
    @list.mark_done("Buy milk")
    assert_equal([@todo1], @list.all_done.to_a)
    @list.mark_done("Clean room")
    assert_equal([@todo1, @todo2], @list.all_done.to_a)
    @list.mark_done("Go to gym")
    assert_equal([@todo1, @todo2, @todo3], @list.all_done.to_a)
  end

  def test_mark_all_unddone
    @list.mark_all_done
    assert_equal([@todo1, @todo2, @todo3], @list.all_done.to_a)
    @list.mark_all_undone
    assert_equal([@todo1, @todo2, @todo3], @list.all_not_done.to_a)
  end
end
