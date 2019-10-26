require_relative 'chess_constants'

class FenToBoard
  attr_accessor :fen
  attr_reader :piece_array, :board_array

  def initialize(fen)
    @fen = fen
    @piece_array = convert_fen_to_piece_array
    @board_array = convert_piece_array_to_board_array
  end

  def convert_fen_to_piece_array
    fen_array = @fen.split("/")

    first_rank_and_details = fen_array.last.split(" ")
    first_rank = first_rank_and_details[0]

    piece_array = fen_array
    piece_array[-1] = first_rank
    
    @piece_array = piece_array
  end

  def convert_piece_array_to_board_array
    @board_array = [["_"]*8]*8
  end

  def display
    display = ""
    @board_array.each do |rank|
      display += rank.join
      display += "\n" 
    end
    display
  end
end

fen = "r1bqk2r/pppp1ppp/2n2n2/2b1p3/2BPP3/2P2N2/PP3PPP/RNBQK2R b KQkq - 0 5"

var = FenToBoard.new(fen)
#print(var.convert_piece_array_to_board_array)
print(var.display)