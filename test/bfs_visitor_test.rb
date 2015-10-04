require 'minitest/autorun'
require  'lib/bfs_visitor'

class  BfsVisitorTest  <  Minitest::Test
  def test_get_paths
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
    bfs_visitor = BfsVisitor.new(graph)

    assert_equal 2, bfs_visitor.get_paths("C", "C") {|w,l| l<=3}.count
    assert_equal 3, bfs_visitor.get_paths("A", "C", proc{|w,l| l<=4}) {|w,l| l==4}.count

    results = bfs_visitor.get_paths("C", "C") {|w,l| w<30 }

    assert_equal 7, results.length
    assert_equal 16, results[0].shift
    assert_equal 9, results[1].shift
    assert_equal 21, results[2].shift
    assert_equal 25, results[3].shift
    assert_equal 25, results[4].shift
    assert_equal 18, results[5].shift
    assert_equal 27, results[6].shift

    assert_equal "CDC", results[0].join
    assert_equal "CEBC", results[1].join
    assert_equal "CDEBC", results[2].join
    assert_equal "CDCEBC", results[3].join
    assert_equal "CEBCDC", results[4].join
    assert_equal "CEBCEBC", results[5].join
    assert_equal "CEBCEBCEBC", results[6].join
  end

  def test_get_paths_not_found
    graph =Graph.new
    graph.add_edge("A", "B", 5)
    graph.add_edge("B", "C", 4)
    graph.add_edge("C", "D", 8)

    bfs_visitor = BfsVisitor.new(graph)
    assert [], bfs_visitor.get_paths("D", "A") { |w,l| w < 10 }
  end
end
