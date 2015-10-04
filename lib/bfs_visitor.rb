require_relative 'graph'

class BfsVisitor
  def initialize(graph)
    @graph=graph
  end

  # def get_paths finds path from source to target with applied result_filter block. 
  # iterate_only_if proc can be passed if result_filter and iterator are different. 
  # Both iterate_only_if  and result_filter will get current weight and level of path as arguments
  # Result:
  # weight of the path as 0 element followed by the path from source to target Eg. [[10, A, B]]

  def get_paths(source, target, iterate_only_if=nil, &result_filter)
      iterate_only_if = result_filter if iterate_only_if.nil?
      queue=[[0, source]]
      result=[]
      while queue.any?
        node = queue.shift
        @graph.each_adjacent(node.last) do |edge, weight|
          nnode = node.dup
          nnode[0]= node[0] + weight
          nnode << edge
          nlevel = nnode.length - 2
          if edge == target
            if result_filter.call(nnode[0], nlevel)
              result << nnode
            end
          end

          if iterate_only_if.call(nnode[0], nlevel)
            queue << nnode
          end
        end
      end
      result
  end
end
