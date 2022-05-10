class Player
    attr_reader :name, :side

    def initialize(name, side)
        @name = name
        @side = side
    end

    def prompt
        puts "#{@name}, please enter which cup you would like to start from: "
        start_pos = gets.chomp.to_i
        if (start_pos.between?(1,6) && @side != 1 ||
            start_pos.between?(7,12) && @side != 2)
        raise "Not your side!"
        else
        start_pos
        end
    end
end


class Board
    attr_accessor :cups
  
    def initialize(name1, name2)
      @cups = Array.new(14) { 0 }
      place_stones
      @name1, @name2 = name1, name2
    end
  
    def place_stones
      # helper method to #initialize every non-store cup with four stones each
      cups.each_with_index do |cup, i|
        if i == 6 || i == 13
          cups[i] = []
        else
          cups[i] = [:stone, :stone, :stone, :stone]
        end
      end
    end
  
    def valid_move?(start_pos)
      raise "Invalid starting cup" if start_pos < 0 || start_pos >= 13
      raise "Starting cup is empty" if cups[start_pos].length == 0
      true
    end
  
    def make_move(start_pos, current_player_name)
      stone_quant = cups[start_pos].length
      # ending_cup_idx = (start_pos + stone_quant)
  
      temp_queue = cups[start_pos].map {|cup| cup }
      cups[start_pos] = []
      i = start_pos + 1
  
      until temp_queue.empty?
        if i > 13
          j = i % 13 - 1
        else
          j = i
        end
        if !((j == 6 && current_player_name == @name2) || (j == 13 && current_player_name == @name1))
          cups[j].push(temp_queue.pop) 
        end
        i += 1
        ending_cup_idx = j
      end
  
      if ending_cup_idx > 13
        ending_cup_idx = ending_cup_idx % 13 - 1
      end
  
      self.render
      self.next_turn(ending_cup_idx)
    end
  
    def next_turn(ending_cup_idx)
      # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
      if [6, 13].include?(ending_cup_idx)
        return :prompt
      elsif cups[ending_cup_idx].length == 1
        return :switch
      else
        return ending_cup_idx
      end
    end
  
    def render
      print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
      puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
      print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
      puts ""
      puts ""
    end
  
    def one_side_empty?
      if cups[0..5].all? {|cup| cup.length == 0 } || cups[7..12].all?{|cup| cup.length == 0}
        return true
      else
        return false
      end
    end
  
    def winner
      case cups[6].length <=> cups[13].length
      when 0
        return :draw
      when -1
        p @name2
      when 1
        p @name1
      end
    end
  
end
  
  
class Mancala
    def initialize(name1, name2)
      @player1 = Player.new(name1, 1)
      @player2 = Player.new(name2, 2)
      @board = Board.new(name1, name2)
    end
  
    def play
      puts "Welcome to Mancala"
      @board.render
      current_player = @player1
      until won?
        take_turn(current_player)
        current_player = current_player == @player1 ? @player2 : @player1
      end
  
      puts "The game is finished! #{winner_message}"
    end
  
    def take_turn(current_player)
      move_result = :prompt
  
      until move_result == :switch
        if move_result == :prompt
          print_indices
  
          begin
            start_pos = current_player.prompt
            start_pos -= 1 if start_pos <= 6
            @board.valid_move?(start_pos)
          rescue Exception => e
            puts e.message
          retry
          end
          move_result = @board.make_move(start_pos, current_player.name)
        else
          move_result = @board.make_move(move_result, current_player.name)
        end
        break if won?
      end
    end
  
    def won?
       @board.one_side_empty?
    end
  
    def winner_message
      winner = @board.winner
      if winner == :draw
        "It was a draw!"
      else
        "Congrats, #{winner}!"
      end
    end
  
    def print_indices
      puts "\nCup indices:"
      puts "12  11  10   9   8   7"
      puts " 1   2   3   4   5   6"
    end
end
  