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
      @header_class = " bg-warning"
    else
      case @user_move
      when @@rock
        case @computer_move
        when @@paper
          @result = "Lose"
          @header_class = " bg-danger"
        when @@scissors
          @result = "Win"
          @header_class = " bg-success"
        else
          abort("Error - Unknown computer move found")
        end
      when @@paper
        case @computer_move
        when @@scissors
          @result = "Lose"
          @header_class = " bg-danger"
        when @@rock
          @result = "Win"
          @header_class = " bg-success"
        else
          abort("Error - Unknown computer move found")
        end
      when @@scissors
        case @computer_move
        when @@rock
          @result = "Lose"
          @header_class = " bg-danger"
        when @@paper
          @result = "Win"
          @header_class = " bg-success"
        else
          abort("Error - Unknown computer move found")
        end
      end
    end

    render("game/play.html.erb")

  end
end
