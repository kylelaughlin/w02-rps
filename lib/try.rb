


acceptable_choices = [[1,2,3],[4,5,6],[7,8,6]]

def print_board(acceptable_choices)
  board = " #{acceptable_choices[0][0]} | #{acceptable_choices[0][1]} | #{acceptable_choices[0][2]}"
  board += "\n-----------\n"
  board += " #{acceptable_choices[1][0]} | #{acceptable_choices[1][1]} | #{acceptable_choices[1][2]}"
  board += "\n-----------\n"
  board += " #{acceptable_choices[2][0]} | #{acceptable_choices[2][1]} | #{acceptable_choices[2][2]} \n"
end

puts print_board(acceptable_choices)
