require_relative "00_tree_node"
class KnightPathFinder

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
            new_pos =[[curr_x+ dx],[curr_y + dy]]
            
            
            
            valid_moves << new_pos
            
        end


      end


    def initialize(start_pos)
        @start_pos = start_pos
        @possible_position = [start_pos]



    end

    def find_path(position)

    end


    def build_move_tree
        self.root_node
        
    end

end

kpf = KnightPathFinder.new([0, 0])

root = PolyTreeNode.new([0,0])
puts node