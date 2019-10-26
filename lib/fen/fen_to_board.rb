require_relative 'chess_constants'

class FenToBoard
  attr_accessor :fen
  attr_reader :board_array, :display_array

  def initialize(fen)
    @fen = fen
    @board_array = convert_fen_to_board_array
    @display_array = convert_board_array_to_display_array
  end

  def convert_fen_to_board_array
    fen_array = @fen.split("/")

    first_rank_and_details = fen_array.last.split(" ")
    first_rank = first_rank_and_details[0]

    board_array = fen_array
    board_array[-1] = first_rank
    
    @board_array = board_array
  end

  def convert_board_array_to_display_array
    @display_array = [["_"]*8]*8
  end

  def display
    display = ""
    @display_array.each do |rank|
      display += rank.join
      display += "\n" 
    end
    display
  end
end

fen = "r1bqk2r/pppp1ppp/2n2n2/2b1p3/2BPP3/2P2N2/PP3PPP/RNBQK2R b KQkq - 0 5"

var = FenToBoard.new(fen)
#print(var.convert_board_array_to_display_array)
print(var.display)

#change piece array to board array in display class. Just makes more sense.