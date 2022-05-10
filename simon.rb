class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
      system("clear")
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    seq.each do |e|
      puts e 
      sleep 0.75
      system("clear")
      sleep 0.25
    end
  end

  def require_sequence
    @seq.each do |ea|
      user_input = gets.chomp
      if ea != user_input
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    seq.push(COLORS.shuffle.first)
  end

  def round_success_message
    puts "Now you can take another round!"
  end

  def game_over_message
    puts "Sorry, you failed. Game over."
  end

  def reset_game
    game_over = false
    seq = []
    sequence_length = 1
  end
end
