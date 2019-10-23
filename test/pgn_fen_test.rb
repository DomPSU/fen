require "minitest/autorun"
require "pgn_fen"

class DisplayTests < Minitest::Test
  def setup
    fen = "r1bqk2r/pppp1ppp/2n2n2/2b1p3/2BPP3/2P2N2/PP3PPP/RNBQK2R b KQkq - 0 5"
    @display = Display.new(fen)
  end

  def test_display_fen_returns_fen
    fen = "r1bqk2r/pppp1ppp/2n2n2/2b1p3/2BPP3/2P2N2/PP3PPP/RNBQK2R b KQkq - 0 5"
    assert_equal fen, @display.fen
  end

  def test_convert_fen_to_piece_array
    assert_equal "r1bqk2r", @display.piece_array[0]
    assert_equal "pppp1ppp", @display.piece_array[1]
    assert_equal "2n2n2", @display.piece_array[2]
    assert_equal "2b1p3", @display.piece_array[3]
    assert_equal "2BPP3", @display.piece_array[4]
    assert_equal "2P2N2", @display.piece_array[5]
    assert_equal "PP3PPP", @display.piece_array[6]
    assert_equal "RNBQK2R", @display.piece_array[7]
    assert_nil @display.piece_array[8]
  end 

  def test_file_notation_row
    assert_equal "   a  b  c  d  e  f  g  h  \n", @display.file_notation_row
  end

  def test_top_row
    top_row_string = "  \u250C\u2500\u2500\u252c\u2500\u2500\u252c"\
                     "\u2500\u2500\u252c\u2500\u2500\u252c"\
                     "\u2500\u2500\u252c\u2500\u2500\u252c"\
                     "\u2500\u2500\u252c\u2500\u2500\u2510\n"

    assert_equal top_row_string, @display.top_row
  end

  def test_piece_row
    first_rank_string = "1 \u2502\u2656 \u2502\u2658 \u2502\u2657 \u2502\u2655 \u2502\u2654\ \u2502  \u2502  \u2502\u2656 \u2502 1\n"

    assert_equal first_rank_string, @display.piece_row(1)
  end
=begin
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
        piece_row += unicode_piece(board_square)
      end
      piece_row += " "
    end

    piece_row += unicode_board(:vertical)

    piece_row += " "
    piece_row += rank_notation.to_s
    piece_row += "\n"
  end
=end
  def test_print_line_row
  end

  def test_print_bottom_row
  end

  def test_unicode_board
  end

  def test_unicode_piece
  end
end