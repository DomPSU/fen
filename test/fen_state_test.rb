class FenStateTests < Minitest::Test
  def setup
    fen = "r1bqk2r/pppp1ppp/2n2n2/2b1p3/2BPP3/2P2N2/PP3PPP/RNBQK2R b KQkq - 0 5"

    @FenState = FenState.new(fen)
  end

  def test_split
    assert_equal "r1bqk2r", @FenState.piece_placement[0]
    assert_equal "pppp1ppp", @FenState.piece_placement[1]
    assert_equal "2n2n2", @FenState.piece_placement[2]
    assert_equal "2b1p3", @FenState.piece_placement[3]
    assert_equal "2BPP3", @FenState.piece_placement[4]
    assert_equal "2P2N2", @FenState.piece_placement[5]
    assert_equal "PP3PPP", @FenState.piece_placement[6]
    assert_equal "RNBQK2R", @FenState.piece_placement[7]
    assert_nil @FenState.piece_placement[8]

    assert_equal "b", @FenState.active_color
    
    assert_equal "KQkq", @FenState.castling

    assert_equal "-", @FenState.en_passant

    assert_equal "0", @FenState.halfmove_clock

    assert_equal "5", @FenState.fullmove_clock
  end 
  
  def test board
  end
end