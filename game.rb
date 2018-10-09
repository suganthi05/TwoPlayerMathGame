class Game
  attr_accessor :turn, :current_player, :player1, :player2

  def initialize
    @turn = turn
    @player1 = Player.new('Player1', 3)
    @player2 = Player.new('Player2', 3)
    @current_player = self.player1
    @game_playing = true
  end

  def start_game
    while @game_playing == true do
      play_round
      whos_turn
    end
  end

  def whos_turn
    if @current_player == @player1
    else 
      @current_player = @player2
    end
    return @current_player
  end     

  def generate_question
    number_array = []
    first_number = rand(1...12)
    second_number = rand(1...12)
    number_array << first_number
    number_array << second_number
    puts "#{current_player.name}: What does #{first_number} plus #{second_number} equal?"
    return number_array
  end

  def play_round
    puts "----- NEW TURN -----"
    number_array = generate_question
    answer = Integer(gets.chomp)
    if answer == number_array[0] + number_array[1]
      puts "YES! #{current_player.name} you are correct"
      @game_playing = false
    else
      puts "#{current_player.name}  Seriously?  Noo!!!"
      @current_player.lives -= 1
    end

    puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
    if @game_playing == false
      puts "----- GAME OVER -----"
    end

    if @current_player.lives == 0
      puts "We're done!"
      @game_playing = false
    end
    return 
  end
end