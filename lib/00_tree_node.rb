


# BFS
# Create queue
# add root node into the queue
# loop through queue until empty
   #remove first node from queue (dequeue)
    # check: if removed node is target
        # if this node is target, return node
        # if this node is not target, add this node's children to queue
        # return if we make it through entire tree without finding target


#DFS

#Use recursion
# start at root node
# if node is target, return node
# else iterate through the node's children
#   calls DFS on each child node
    # if result is not nil, return node(which means we found the node we want and return it)
#return nil if target was not found

# multiple stack frames



class PolyTreeNode

        attr_reader :value, :children, :parent
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent)
        if @parent != nil
            @parent.children.delete(self)
        end
        @parent = parent
        if parent!= nil && !parent.children.include?(self)   
            parent.children << self
        end
    end

    def add_child(node)
        node.parent = self
    end

    def remove_child(node)
    
    raise "Node is root" if node.parent == nil #checks if node is root

        node.parent = nil
    end

    def dfs(target_value)
        #finds value
        return self if self.value == target_value
        self.children.each do |child|
            result = child.dfs(target_value)
            return result unless result.nil?
        end 
        nil
    end

    def add_child(node)
       node.parent = self 
    end

    def inspect
        return @value
    end

    def bfs(target_value)
        queue = [self]
        while !queue.empty?
            current_node = queue.pop
            if current_node.value == target_value
                return current_node
            else 
                current_node.children.each { |child|
                    queue.unshift(child)
                }
            end
        end
        return nil
    end

end
