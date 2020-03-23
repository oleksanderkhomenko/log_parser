require_relative 'parser'

parser = Parser.new(ARGV[0])
p parser.visits
p parser.uniq_visits
