require 'thor'
require 'pgn_fen'

module PgnFen
  class CLI < Thor
    desc "display FEN", "Displays fen."
    def display(fen)
      display = Pgn_Fen::Display.new(fen)
      print (display.board)
    end
  end
end