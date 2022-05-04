require 'set'

class GraphNode
    attr_accessor :val, :neighbors

    def initialize(val)
        self.val = val
        self.neighbors = []
    end

end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]


def bfs(starting_node, target_value)
    visited = Set.new()
    queue = [starting_node]

    until queue.empty?
        node = queue.shift
        puts node.val
        unless visited.include?(node)
            return node.val if node.val == target_value
            visited.add(node)
            queue += node.neighbors
        end
    end

    return nil
end


p bfs(a, "b")
puts "----------------"
p bfs(a, "e")
puts "----------------"
p bfs(a, "d")
puts "----------------"
p bfs(a, "f")