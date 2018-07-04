require_relative './utils'
require_relative './parsers'


def parse_with(parser_name, fpath)
  case parser_name
  when "brujula"
    brujula_parse(fpath)
  when "ramlrb"
    ramlrb_parse(fpath)
  end
end

def main()
  options = OptParse.parse(ARGV)
  puts options.verbose
  puts options.parser

  ex_dir = clone_tck_repo()
  puts ex_dir
  files_list = list_ramls(ex_dir)
  puts files_list

  passed = 0
  total = files_list.length
  files_list.each do |fpath|
    puts "> Parsing #{fpath}:"
    parse_with(options.parser, fpath)
  end

  puts "\nPassed/Total: #{passed}/#{total}"
end

main()
