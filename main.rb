require_relative './utils'
require_relative './parsers'


PARSERS = {
  "brujula" => method(:brujula_parse),
  "ramlrb" => method(:ramlrb_parse)
}

def main()
  options = OptParse.parse(ARGV)
  puts options.verbose
  puts options.parser

  # case options.parser
  # when "brujula"
  #   parser_func = lambda { |x| brujula_parse(x) }
  # when "ramlbr"
  #   parser_func = lambda { |x| ramlrb_parse(x) }
  # end

  parser_func = PARSERS[options.parser]
  puts parser_func

  ex_dir = clone_tck_repo()
  puts ex_dir
  files_list = list_ramls(ex_dir)
  puts files_list

  passed = 0
  total = files_list.length
  files_list.each do |fpath|
    puts "> Parsing #{fpath}:"
    parser_func(fpath)
  end

  puts "\nPassed/Total: #{passed}/#{total}"
end

main()
