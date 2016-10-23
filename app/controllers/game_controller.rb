class GameController < ApplicationController
  @@rock = "rock"
  @@paper = "paper"
  @@scissors = "scissors"
  @@valid_move_names = [@@rock, @@paper, @@scissors]

  def play
    @user_move = request.path.gsub("/","")
    @computer_move = @@valid_move_names[rand(3)]

    if @user_move == @computer_move
      @result = "Tie"
    else
      case @user_move
      when @@rock
        case @computer_move
        when @@paper
          @result = "Lose"
        when @@scissors
          @result = "Win"
        else
          abort("Error - Unknown computer move found")
        end
      when @@paper
        case @computer_move
        when @@scissors
          @result = "Lose"
        when @@rock
          @result = "Win"
        else
          abort("Error - Unknown computer move found")
        end
      when @@scissors
        case @computer_move
        when @@rock
          @result = "Lose"
        when @@paper
          @result = "Win"
        else
          abort("Error - Unknown computer move found")
        end
      end
    end
    render("game/play.html.erb")
  end
end
