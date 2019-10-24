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
    first_rank_string =    "1 \u2502\u2656 \u2502\u2658 \u2502\u2657 \u2502\u2655 \u2502\u2654 \u2502  \u2502  \u2502\u2656 \u2502 1\n"
    second_rank_string =   "2 \u2502\u2659 \u2502\u2659 \u2502  \u2502  \u2502  \u2502\u2659 \u2502\u2659 \u2502\u2659 \u2502 2\n"
    third_rank_string =    "3 \u2502  \u2502  \u2502\u2659 \u2502  \u2502\  \u2502\u2658 \u2502  \u2502  \u2502 3\n" 
    fourth_rank_string =   "4 \u2502  \u2502  \u2502\u2657 \u2502\u2659 \u2502\u2659 \u2502  \u2502  \u2502  \u2502 4\n" 
    fifth_rank_string =    "5 \u2502  \u2502  \u2502\u265D \u2502  \u2502\u265F \u2502  \u2502  \u2502  \u2502 5\n" 
    sixth_rank_string =    "6 \u2502  \u2502  \u2502\u265E \u2502  \u2502  \u2502\u265E \u2502  \u2502  \u2502 6\n"
    seventh_rank_string =  "7 \u2502\u265F \u2502\u265F \u2502\u265F \u2502\u265F \u2502\  \u2502\u265F \u2502\u265F \u2502\u265F \u2502 7\n"
    eigth_rank_string =    "8 \u2502\u265C \u2502  \u2502\u265D \u2502\u265B \u2502\u265A \u2502  \u2502  \u2502\u265C \u2502 8\n" 

    assert_equal first_rank_string,   @display.piece_row(1)
    assert_equal second_rank_string,  @display.piece_row(2)
    assert_equal third_rank_string,   @display.piece_row(3)
    assert_equal fourth_rank_string,  @display.piece_row(4)
    assert_equal fifth_rank_string,   @display.piece_row(5)
    assert_equal sixth_rank_string,   @display.piece_row(6)
    assert_equal seventh_rank_string, @display.piece_row(7)
    assert_equal eigth_rank_string,   @display.piece_row(8)
  end

  def test_line_row
    line_row_string = "  \u251c\u2500\u2500\u253c\u2500\u2500\u253c\u2500\u2500\u253c\u2500\u2500\u253c\u2500\u2500\u253c\u2500\u2500\u253c\u2500\u2500\u253c\u2500\u2500\u2524\n"

    assert_equal line_row_string, @display.line_row
  end

  def test_bottom_row
    bottom_row_string = "  \u2514\u2500\u2500\u2534\u2500\u2500\u2534\u2500\u2500\u2534\u2500\u2500\u2534\u2500\u2500\u2534\u2500\u2500\u2534\u2500\u2500\u2534\u2500\u2500\u2518\n"

    assert_equal bottom_row_string, @display.bottom_row
  end

  def test_unicode_board
    assert_equal "\u2500", @display.unicode_board(:horizontal)
    assert_equal "\u2502", @display.unicode_board(:vertical)
    assert_equal "\u250C", @display.unicode_board(:top_left_corner)
    assert_equal "\u2510", @display.unicode_board(:top_right_corner)
    assert_equal "\u2514", @display.unicode_board(:bottom_left_corner)
    assert_equal "\u2518", @display.unicode_board(:bottom_right_corner)
    assert_equal "\u252c", @display.unicode_board(:top_mid)
    assert_equal "\u251c", @display.unicode_board(:left_mid)
    assert_equal "\u2524", @display.unicode_board(:right_mid)
    assert_equal "\u2534", @display.unicode_board(:bottom_mid)
    assert_equal "\u253c", @display.unicode_board(:cross)
  end

  def test_unicode_piece
    assert_equal "\u2654", @display.unicode_piece(:K)
    assert_equal "\u2655", @display.unicode_piece(:Q)
    assert_equal "\u2656", @display.unicode_piece(:R)
    assert_equal "\u2657", @display.unicode_piece(:B)
    assert_equal "\u2658", @display.unicode_piece(:N)
    assert_equal "\u2659", @display.unicode_piece(:P)

    assert_equal "\u265A", @display.unicode_piece(:k)
    assert_equal "\u265B", @display.unicode_piece(:q)
    assert_equal "\u265C", @display.unicode_piece(:r)
    assert_equal "\u265D", @display.unicode_piece(:b)
    assert_equal "\u265E", @display.unicode_piece(:n)
    assert_equal "\u265F", @display.unicode_piece(:p)

  end
end