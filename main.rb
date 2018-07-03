require_relative './utils'
require_relative './parsers'

def main()
  options = OptParse.parse(ARGV)
  puts options.verbose
  puts options.parser
end

main
