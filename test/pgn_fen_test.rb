require "minitest/autorun"
require "pgn_fen"

class TestDisplay < Minitest::Test
  def setup
    fen = "rnbqkbnr/pp1ppppp/8/2p5/4P3/5N2/PPPP1PPP/RNBQKB1R b KQkq - 1 2"
    @display = Display.new(fen)
  end

  def test_that_display_fen_returns_fen
    assert_equal "rnbqkbnr/pp1ppppp/8/2p5/4P3/5N2/PPPP1PPP/RNBQKB1R b KQkq - 1 2", @display.fen
  end
end