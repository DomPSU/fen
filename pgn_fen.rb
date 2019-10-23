module ChessConstants
  NUMBER_OF_ROWS = 8
  NUMBER_OF_COLUMNS = 8
  
  L_ARRAY = ["a", "b", "c", "d", "e", "f", "g", "h"]
  N_ARRAY = ["1", "2", "3", "4", "5", "6", "7", "8"]
end

class Display
  include ChessConstants

  attr_accessor :fen

  def initialize(fen)
    @fen = fen
  end
=begin
  def contents
    print_l_notation
    print_top_row

    N_ARRAY.reverse.each do |value| 
      print_piece_row(value)
      print_line_row unless value == N_ARRAY[0]
    end

    print_bottom_row
    print_l_notation

    puts("")
  end
=end
  def print_l_notation
    print "   "
    L_ARRAY.each { |value| print "#{value}  "}
    puts ""
  end

  def print_top_row
    counter = 0

    print "  "
    print unicode_board(:top_left_corner)
    print unicode_board(:horizontal)
    print unicode_board(:horizontal)

    loop do
      print unicode_board(:top_mid)
      print unicode_board(:horizontal)
      print unicode_board(:horizontal)
      counter += 1
      break if counter == NUMBER_OF_COLUMNS - 1
    end
    puts unicode_board(:top_right_corner)
  end
=begin
  def print_piece_row(n_notation) 
    print(n_notation)
    print " "

    @board.array[NUMBER_OF_ROWS - n_notation.to_i].each do |board_square|
      print unicode_board(:vertical)

      if board_square.piece.nil?
        print " "
      else
        print unicode_piece(board_square.piece, board_square.piece.color)
      end
      print " "
    end

    print unicode_board(:vertical)

    print " "
    puts(n_notation)
  end
=end
  def print_line_row
    counter = 0

    print "  "
    print unicode_board(:left_mid)
    print unicode_board(:horizontal)
    print unicode_board(:horizontal)

    loop do
      print unicode_board(:cross)
      print unicode_board(:horizontal)
      print unicode_board(:horizontal)
      counter += 1
      break if counter == NUMBER_OF_COLUMNS - 1
    end
    puts unicode_board(:right_mid)    
  end

  def print_bottom_row 

    counter = 0

    print "  "
    print unicode_board(:bottom_left_corner)
    print unicode_board(:horizontal)
    print unicode_board(:horizontal)

    loop do
      print unicode_board(:bottom_mid)
      print unicode_board(:horizontal)
      print unicode_board(:horizontal)
      counter += 1
      break if counter == NUMBER_OF_COLUMNS - 1
    end
    puts unicode_board(:bottom_right_corner)  
  end

  def unicode_board(key)
    hash = {horizontal: "\u2500",
            vertical: "\u2502",
            top_left_corner: "\u250C",
            top_right_corner: "\u2510",
            bottom_left_corner: "\u2514",
            bottom_right_corner: "\u2518",
            top_mid: "\u252c",
            left_mid: "\u251c",
            right_mid: "\u2524",
            bottom_mid: "\u2534",
            cross: "\u253c"}

    return hash.fetch(key).encode('utf-8')   
  
=begin
  def unicode_piece(piece, piece_color)
   key = piece.class.to_s.downcase.to_sym

    white_hash = {king: "\u2654",
                  queen: "\u2655",
                  rook: "\u2656",
                  bishop: "\u2657",
                  knight: "\u2658",
                  pawn: "\u2659"}

   return white_hash.fetch(key).encode('utf-8') if piece_color == "white"

    black_hash = {king: "\u265A",
                  queen: "\u265B",
                  rook: "\u265C",
                  bishop: "\u265D",
                  knight: "\u265E",
                  pawn: "\u265F"}

    return black_hash.fetch(key).encode('utf-8') if piece_color == "black"
  end
=end
end

fen = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1"

a = Display.new(fen)
a.print_top_row
a.print_line_row
a.print_bottom_row

