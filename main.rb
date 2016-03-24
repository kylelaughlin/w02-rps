require 'pry'


#Loop that controls game - back and forther between players stops when winner is made

#player selection

def player_select_choice
  acceptable_choices = ['rock', 'paper', 'scissors']
  puts "Please select one of the following:"
  acceptable_choices.each { |e| puts e}
  player_choice = gets.chomp.downcase
  while !acceptable_choices.include? player_choice
    puts "\n\n'#{player_choice}' is not a valid option. Please select one of the following: #{acceptable_choices.each { |e| print e}}"
    player_choice = gets.chomp.downcase
  end
  player_choice
end

#selection comparison
def compare_player_selections(player_one_selection, player_two_selection)
  if player_one_selection == player_two_selection
    outcome = "tie"
  elsif player_one_selection == "rock" && player_two_selection == "scissors" ||
    player_one_selection == "paper" && player_two_selection == "rock" ||
    player_one_selection == "scissors" && player_two_selection == "paper"
    outcome = "player one wins"
  elsif player_two_selection == "rock" && player_one_selection == "scissors" ||
    player_two_selection == "paper" && player_one_selection == "rock" ||
    player_two_selection == "scissors" && player_one_selection == "paper"
    outcome = "player two wins"
  else
    puts "Something strange happened here"
  end
  outcome
end

player_one_selection = player_select_choice

player_two_selection = player_select_choice

compare_player_selections(player_one_selection, player_two_selection)

#winner of round - may be part of the method above







=begin
puts "Lets Play Rock Paper Scissors. First player to two wins, wins!"
score_1 = 0
score_2 = 0
while (score_1 <= 2 && score_2 <= 2) do
    puts "Player 1, please input rock, paper or scissors."
    i=0
    while i < 1
        player1 = gets.chomp.downcase
        if player1 == "rock" || (player1 == "paper" || player1 == "scissors")
            i += 1
        else
            puts "Player 1, I didn't recognize that selection please select rock, paper, or scissors."
        end
    end
    puts "Player 2, please input rock, paper or scissors."
    i=0
    while i < 1
        player2 = gets.chomp.downcase
        if player2 == "rock" || (player2 == "paper" || player2 == "scissors")
            i += 1
        else
            puts "Player 2, I didn't recognize that selection please select rock, paper, or scissors."
        end
    end
    if player1 == "rock" && player2 == "rock"
        puts "Tie, no score."
        puts "1: #{score_1}\n2: #{score_2}"
    elsif player1 == "rock" && player2 =="paper"
        puts "Player 1 wins."
      score_1 += 1
      puts "1: #{score_1}\n2: #{score_2}"
    elsif player1 == "rock" && player2 == "scissors"
        puts "Player 1 wins."
        score_1 += 1
        puts "1: #{score_1}\n2: #{score_2}"
    elsif player1 == "paper" && player2 =="rock"
      puts "Player 2 wins"
      score_2 += 1
      puts "1: #{score_1}\n2: #{score_2}"
    elsif player1 == "paper" && player2 == "paper"
      puts "Tie, no score."
    elsif player1 == "paper" && player2 == "scissors"
        puts "Player 2 wins."
        score_2 += 1
        puts "1: #{score_1}\n2: #{score_2}"
    elsif player1 == "scissors" && player2 =="rock"
        puts "Player 2 wins"
        score_2 += 1
        puts "1: #{score_1}\n2: #{score_2}"
    elsif player1 == "scissors" && player2 == "scissors"
        puts "Tie, no score."
        puts "1: #{score_1}\n2: #{score_2}"
    else #player 1 == "scissors" && player2 == "paper"
        puts "Player 1 wins."
        score_1 += 1
        puts "1: #{score_1}\n2: #{score_2}"
    end
end
if score_1 > score_2
    puts "Player 1 Wins!"
else
    puts "Player 2 Wins!"
end
=end
