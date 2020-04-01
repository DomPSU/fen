# fen

fen is a command line tool to convert fen into unicode chessboard with
file and rank notation.

## Testing

Fully tested using Minitest.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fen'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fen

## Usage

$ fen display r1bqk2r/pppp1ppp/2n2n2/2b1p3/2BPP3/2P2N2/PP3PPP/RNBQK2R b KQkq - 0 5
```
   a  b  c  d  e  f  g  h  
  ┌──┬──┬──┬──┬──┬──┬──┬──┐
8 │♜ │  │♝ │♛ │♚ │  │  │♜ │ 8
  ├──┼──┼──┼──┼──┼──┼──┼──┤
7 │♟ │♟ │♟ │♟ │  │♟ │♟ │♟ │ 7
  ├──┼──┼──┼──┼──┼──┼──┼──┤
6 │  │  │♞ │  │  │♞ │  │  │ 6
  ├──┼──┼──┼──┼──┼──┼──┼──┤
5 │  │  │♝ │  │♟ │  │  │  │ 5
  ├──┼──┼──┼──┼──┼──┼──┼──┤
4 │  │  │♗ │♙ │♙ │  │  │  │ 4
  ├──┼──┼──┼──┼──┼──┼──┼──┤
3 │  │  │♙ │  │  │♘ │  │  │ 3
  ├──┼──┼──┼──┼──┼──┼──┼──┤
2 │♙ │♙ │  │  │  │♙ │♙ │♙ │ 2
  ├──┼──┼──┼──┼──┼──┼──┼──┤
1 │♖ │♘ │♗ │♕ │♔ │  │  │♖ │ 1
  └──┴──┴──┴──┴──┴──┴──┴──┘
   a  b  c  d  e  f  g  h  
```
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/DomPSU/fen.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
