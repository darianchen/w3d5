require_relative "00_tree_node"
class KnightPathFinder
    attr_reader :start_pos


    MOVES = [
        [-2, -1],
        [-2,  1],
        [-1, -2],
        [-1,  2],
        [ 1, -2],
        [ 1,  2],
        [ 2, -1],
        [ 2,  1]
      ]

      def self.valid_moves(pos)
        valid_moves = []
        curr_x, curr_y = pos

        MOVES.each do |dx, dy|
            new_pos =[curr_x+ dx,curr_y + dy]
            
            if new_pos.all? { |num| num.between?(0,7) }
                valid_moves << new_pos
            end
        end
        valid_moves
      end


    def initialize(start_pos)
        @start_pos = start_pos
        @considered_positions = [start_pos]
        @root_node = PolyTreeNode.new(start_pos)
    end

    def new_move_positions(pos)
        new_positions = []
        @considered_positions.each do |pos|
            new_positions << pos if KnightPathFinder.valid_moves(pos) && @considered_positions.include?(pos)
        end
        new_positions
    end

    def find_path(end_pos)
        end_node = root_node.dfs(end_pos)
        end_node
    end

    def trace_path_back
        values = []
        curr_node = find_path(end_pos)
        until  curr_node.value == [0, 0]
            values << curr_node.value
            curr_node = curr_node.parent
        end 
        values 
    end 



    def build_move_tree
        nodes = [@root_node] 
       
        until nodes.empty?
            curr_node = nodes.shift
            curr_pos = curr_node.value
            new_move_positions(curr_pos).each do |pos|
                new_node = PolyTreeNode.new(pos)
                curr_node.add_child(new_node)
                nodes << new_node
            end
        end
        #valid moves and new move positions
    end



end

kpf = KnightPathFinder.new([0, 0])