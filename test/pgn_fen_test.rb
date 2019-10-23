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

  def test_print_file_notation_row
    assert_equal "r1bqk2r", @display.print_file_notation_row
  end

  def test_print_top_row
  end

  def test_print_piece_row
  end

  def test_print_line_row
  end

  def test_print_bottom_row
  end

  def test_unicode_board
  end

  def test_unicode_piece
  end

end