class FenState
  attr_accessor :fen, :board, :piece_placement, :active_color, :castling, 
                :en_passant, :halfmove_clock, :fullmove_clock

  def initialize(fen)
    @fen = fen
    split_fen
    @board = board
  end

  def split_fen
    fen_array = @fen.split(" ")
    @piece_placement = fen_array[0].split("/")
    @active_color = fen_array[1]
    @castling = fen_array[2]
    @en_passant = fen_array[3]
    @halfmove_clock = fen_array[4]
    @fullmove_clock = fen_array[5]
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

  def board_array
    board.split("\n")
  end
end