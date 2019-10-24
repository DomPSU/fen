require 'thor'
require 'pgn_fen'

module PgnFen
  class CLI < Thor
    desc "display FEN", "Displays fen."
    def display(*fen)
      fen = Display.new(fen.join(" "))
      print(fen.board)
    end
  end
end