require "bundler/gem_tasks"
require 'rake/testtask'

desc 'Run unit tests'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/fen_test.rb'
  t.verbose = true
end