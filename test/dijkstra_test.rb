require 'lib/dijkstra'
require 'minitest/autorun'

class DijkstraAlgorithmTest < Minitest::Test
  def setup
  end

  def test_dijikstra

    graph =  Graph.new 
    graph.add_edge("A", "B", 5)
    graph.add_edge("B", "C", 4)
    graph.add_edge("C", "D", 8)
    graph.add_edge("D", "C", 8)
    graph.add_edge("D", "E", 6)
    graph.add_edge("A", "D", 5)
    graph.add_edge("C", "E", 2)
    graph.add_edge("E", "B", 3)
    graph.add_edge("A", "E", 7)

    dijkstra_algo = DijkstraAlgorithm.new(graph, "A")
    assert_equal 9, dijkstra_algo.shortest_distance_to("C")
    assert_equal ["A", "B", "C"], dijkstra_algo.shortest_path_to("C")
    dijkstra_algo = DijkstraAlgorithm.new(graph, "B")
    assert_equal 9, dijkstra_algo.shortest_distance_to("B")
    assert_equal ["B","C","E","B"], dijkstra_algo.shortest_path_to("B")

  end

  def test_dijkstra_no_route_found
    graph =Graph.new
    graph.add_edge("A", "B", 5)
    graph.add_edge("B", "C", 4)
    graph.add_edge("C", "D", 8)
    dijkstra_algo = DijkstraAlgorithm.new(graph, "D")
    assert_nil dijkstra_algo.shortest_distance_to("A")
    assert_nil dijkstra_algo.shortest_path_to("A")
  end

end
