require_relative 'chess_constants'

class Fen
  attr_accessor :fen, :board, :piece_placement, :active_color, :castling, 
                :en_passant, :halfmove_clock, :fullmove_clock

  def initialize(fen)
    @fen = fen
    split
    @board = board
    @display = display
  end

  def split
    fen_array = @fen.split(" ")
    #@piece_placement = piece_placement(fen_array[0])
    @active_color = fen_array[1]
    @castling = fen_array[2]
    @en_passant = fen_array[3]
    @halfmove_clock = fen_array[4]
    @fullmove_clock = fen_array[5]
    @halfmove_clock = fen_array[4]
  end
=begin
  def piece_placement(fen_array)
    fen_array = @fen.split("/")

    first_rank_and_details = fen_array.last.split(" ")
    first_rank = first_rank_and_details[0]

    piece_placement = fen_array
    piece_placement[-1] = first_rank
    
    piece_placement
  end

  def board
    board = ""
    @piece_placement.each do |rank|
      rank.each_char do |board_square|
        if board_square.to_i == 0
          board += board_square
        elsif
          board += "_" * board_square.to_i
        end
      end
      board += "\n"
    end
     board
  end

  def display
    display = ""
    @board.each do |rank|
      display += rank.join
      display += "\n" 
    end
    display
  end
=end
end

fen = "r1bqk2r/pppp1ppp/2n2n2/2b1p3/2BPP3/2P2N2/PP3PPP/RNBQK2R b KQkq - 0 5"

var = Fen.new(fen)

puts(var.fen)
#puts(var.piece_placement)
puts(var.active_color)
puts(var.castling)
puts(var.en_passant)
puts(var.halfmove_clock)
puts(var.fullmove_clock)
