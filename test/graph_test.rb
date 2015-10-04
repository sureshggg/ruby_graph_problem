require 'minitest/autorun'
require 'lib/graph'

class GraphTest < Minitest::Test
  def setup
  end

  def test_graph
     graph =  Graph.new 
     graph.add_edge("A", "B", 1)
     graph.add_edge("B", "C", 2)
     graph.add_edge("B", "A", 2)
     graph.add_edge("A", "C", 3)
     graph.add_edge("C", "B", 10)

     assert_equal ["A", "B", "C"], graph.vertices
     assert_equal 1, graph.get_path_weight(["A","B"])
     assert_equal 6, graph.get_path_weight(["A","B","A", "C"])
     assert_equal 3, graph.get_path_weight(["A","B", "C"])
     assert_nil graph.get_path_weight(["A","C", "C"])
  end
end
