# Simple implementation of priroity  queue  in ruby. 
# The  queue is not heapified  with min value at top. When delete_min called it sort the queue and remove the min element. This can be improved with priority_queue gem or properly implementing. 

class PriorityQueue
  def initialize
    @queue={}
  end

  def insert(key,value)
    @queue[key] = value
  end

  def delete_min
    min_element=order_queue.first
    unless min_element.nil?
      @queue.delete(min_element.first)
      min_element.first 
    end
  end

  def any?
    @queue.any?
  end

  private

  def order_queue
    @queue.sort_by do |key,value|
      value
    end
  end
end
