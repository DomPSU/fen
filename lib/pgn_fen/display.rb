require_relative 'chess_constants'

class Display
  attr_accessor :fen
  attr_reader :piece_array

  def initialize(fen)
    @fen = fen
    @piece_array = convert_fen_to_piece_array
  end

  def convert_fen_to_piece_array
    fen_array = @fen.split("/")

    first_rank_and_details = fen_array.last.split(" ")
    first_rank = first_rank_and_details[0]

    piece_array = fen_array
    piece_array[-1] = first_rank
    
    @piece_array = piece_array
  end

  def board
    board = file_notation_row
    board += top_row

    ChessConstants::RANK_ARRAY.reverse.each do |rank|
      board += piece_row(rank.to_i)
      board += line_row unless rank.to_i == 1
    end

    board += bottom_row
    board += file_notation_row
  end

  def file_notation_row
    file_notation_row = "   "
    ChessConstants::FILE_ARRAY.each { |value| file_notation_row += "#{value}  "}
    file_notation_row += "\n"
  end

  def top_row
    counter = 0
    top_row = "  "
    top_row += unicode_board(:top_left_corner)
    top_row += unicode_board(:horizontal)
    top_row += unicode_board(:horizontal)

    loop do
      top_row += unicode_board(:top_mid)
      top_row += unicode_board(:horizontal)
      top_row += unicode_board(:horizontal)
      counter += 1
      break if counter == ChessConstants::NUMBER_OF_COLUMNS - 1
    end
    top_row += unicode_board(:top_right_corner)
    top_row += "\n"
  end

  def piece_row(rank_notation) 
    piece_row = rank_notation.to_s
    piece_row += " "

    @piece_array.reverse[rank_notation - 1].each_char do |board_square|
      piece_row += unicode_board(:vertical)

      if board_square.to_i > 1 
        (board_square.to_i - 1).times do
          piece_row += "  "
          piece_row += unicode_board(:vertical)
        end

        piece_row += " "
      elsif board_square.to_i == 1
        piece_row += " "
      else
        piece_row += unicode_piece(board_square.to_sym)
      end
      piece_row += " "
    end

    piece_row += unicode_board(:vertical)

    piece_row += " "
    piece_row += rank_notation.to_s
    piece_row += "\n"
  end

  def line_row
    counter = 0

    line_row =  "  "
    line_row += unicode_board(:left_mid)
    line_row += unicode_board(:horizontal)
    line_row += unicode_board(:horizontal)

    loop do
      line_row += unicode_board(:cross)
      line_row += unicode_board(:horizontal)
      line_row += unicode_board(:horizontal)
      counter += 1
      break if counter == ChessConstants::NUMBER_OF_COLUMNS - 1
    end
    line_row += unicode_board(:right_mid)
    line_row += "\n"    
  end

  def bottom_row 

    counter = 0

    bottom_row = "  "
    bottom_row += unicode_board(:bottom_left_corner)
    bottom_row += unicode_board(:horizontal)
    bottom_row += unicode_board(:horizontal)

    loop do
      bottom_row += unicode_board(:bottom_mid)
      bottom_row += unicode_board(:horizontal)
      bottom_row += unicode_board(:horizontal)
      counter += 1
      break if counter == ChessConstants::NUMBER_OF_COLUMNS - 1
    end
    bottom_row += unicode_board(:bottom_right_corner)  
    bottom_row += "\n"
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

    return hash.fetch(piece).encode('utf-8')
  end
end