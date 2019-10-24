$LOAD_PATH.unshift File.expand_path('../test', __FILE__)

require_relative 'test_helper'
require 'minitest/autorun'

class FirstRun < Minitest::Test
  include Aruba::Api

  def setup
    aruba_setup
  end

  def getting_started_with_aruba
    file = 'file.txt'
    content = 'Hello World' 

    write_file file, content
    read(file).must_equal [content]
  end
end