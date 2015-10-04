require 'minitest/autorun'
require 'lib/priority_queue'

class PriorityQueueTest < Minitest::Test
  def setup
  end
  
  def test_priority_queue
    queue = PriorityQueue.new
    queue.insert "B", 10
    queue.insert "A", 5 
    queue.insert "C", 15 

    assert_equal "A", queue.delete_min
    assert_equal "B", queue.delete_min
    assert_equal "C", queue.delete_min
    assert_nil queue.delete_min
  end
end
