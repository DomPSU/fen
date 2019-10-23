module ChessConstants
  NUMBER_OF_ROWS = 8
  NUMBER_OF_COLUMNS = 8
  
  FILE_ARRAY = ["a", "b", "c", "d", "e", "f", "g", "h"]
  RANK_ARRAY = ["1", "2", "3", "4", "5", "6", "7", "8"]
end

class Display
  include ChessConstants

  attr_accessor :fen, :piece_array

  def initialize(fen)
    @fen = fen

    @piece_array = convert_fen_to_piece_array
  end

  def convert_fen_to_piece_array
    fen_array = @fen.split("/",)
    first_rank_and_details = fen_array.last.split(" ")
    first_rank = first_rank_and_details[0]
    piece_array = fen_array
    piece_array[-1] = first_rank
    @piece_array = piece_array
  end

=begin
  def contents
    print_file_notation
    print_top_row

    RANK_ARRAY.reverse.each do |value| 
      print_piece_row(value)
      print_line_row unless value == RANK_ARRAY[0]
    end

    print_bottom_row
    print_file_notation

    puts("")
  end
=end
  def print_file_notation
    print "   "
    FILE_ARRAY.each { |value| print "#{value}  "}
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

  def print_piece_row(rank_notation) 
    print(rank_notation)
    print " "

    @piece_array[rank_notation-1].each_char do |board_square|
      print unicode_board(:vertical)

      if board_square == true
        print " "
      else
        print unicode_piece(board_square)
      end
      print " "
    end

    print unicode_board(:vertical)

    print " "
    puts(rank_notation)
  end

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
  end

  def unicode_piece(piece)

    hash = {K: "\u2654",
            Q: "\u2655",
            R: "\u2656",
            B: "\u2657",
            N: "\u2658",
            P: "\u2659",
            k: "\u265A",
            q: "\u265B",
            r: "\u265C",
            b: "\u265D",
            n: "\u265E",
            p: "\u265F"}

    return hash.fetch(piece.to_sym).encode('utf-8')
  end
end

fen = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1"

a = Display.new(fen)
a.print_top_row
a.print_line_row
a.print_bottom_row

puts(a.piece_array)
a.print_piece_row(1)

