# fen

fen is a command line tool to work with chess fen or pgn.

## Features

Command line interface to convert fen into unicode chessboard with
file and rank notation.

## TODO

pgn parser

pgn to fen converter

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

$fen display r1bqk2r/pppp1ppp/2n2n2/2b1p3/2BPP3/2P2N2/PP3PPP/RNBQK2R b KQkq - 0 5
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

`   a  b  c  d  e  f  g  h  
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
`

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/DomPSU/fen.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
