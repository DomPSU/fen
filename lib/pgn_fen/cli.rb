require 'thor'
require 'pgn_fen'

module PgnFen
  class CLI < Thor
    desc "display FEN", "Displays fen."
    def display(fen)
      display = Display.new(fen).board
      print(display)
    end
  end
end