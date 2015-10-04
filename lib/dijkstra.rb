require_relative 'priority_queue'
require_relative 'graph'

class DijkstraAlgorithm
  def initialize(graph, source)
    @graph = graph
    @source = source
    calculate_distance_map
  end

  def shortest_distance_to(target)
    @distance_map[target]
  end

  def shortest_path_to(target)
    return nil if @distance_map[target].nil?

    path=[target]
    pn=target
    until @parent_map[pn].nil? || (pn == @source && path.length>1)
      pn=@parent_map[pn]
      path << pn
    end
    path.reverse
  end

  private

  def calculate_distance_map
    reset
    @graph.vertices.each { |v| @distance_map[v]=nil}
    @distance_map[@source]=0
    @parent_map[@source] = nil 
    @pq.insert(@source, 0)
    while @pq.any?
      node=@pq.delete_min
      next if @visited_map[node]
      @graph.each_adjacent(node) do |v,w|
        if @parent_map[v].nil?
          @distance_map[v] = @distance_map[node] + w 
          @parent_map[v] = node 
          @pq.insert(v,w)
        elsif @distance_map[node] + w < @distance_map[v] 
          @distance_map[v] = @distance_map[node] + w 
          @parent_map[v] = node
          @pq.insert(v,w)
        end
      end
      @visited_map[node] = true
    end
  end

  private

  def reset
    @distance_map={}
    @parent_map={}
    @pq =PriorityQueue.new
    @visited_map={}
  end
end
