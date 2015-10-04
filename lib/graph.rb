class Graph
  def initialize
    @vertices={}
  end 

  def add_edge(source, target, weight=0)
    add_vertex(source)
    add_vertex(target)
    @vertices[source][target] = weight
  end

  def add_vertex(vertex)
    @vertices[vertex] ={} if @vertices[vertex].nil? 
  end

  def get_path_weight(path_array)
    weight=0
    for i in (0..(path_array.length - 2))
      source = path_array[i]
      target = path_array[i+1]
      if @vertices[source].nil? || @vertices[source][target].nil?
        return nil
      else
        weight += @vertices[source][target]
      end
    end
    weight
  end

  def vertices
    @vertices.keys
  end

  def each_adjacent(vertex)
    @vertices[vertex].each do |edge, weight|
      yield edge, weight
    end
  end
end
