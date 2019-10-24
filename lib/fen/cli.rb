require 'thor'
require 'fen'

module Fen
  class CLI < Thor
    desc "display FEN", "Displays fen."
    def display(*fen)
      fen = Display.new(fen.join(" "))
      print(fen.board)
    end
  end
end