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
  ex_dir = clone_tck_repo()
  files_list = list_ramls(ex_dir)

  passed = 0
  error = nil
  total = files_list.length

  files_list.each do |fpath|
    success = true
    print "> Parsing #{fpath}: "

    begin
      parse_with(options.parser, fpath)
    rescue Exception => e
      success = false
      error = e.message
    end

    if should_fail?(fpath)
      success = !success
      error = "Parsing expected to fail but succeeded"
    end

    if success
      passed += 1
      print "OK "
    else
      print "FAIL"
      if options.verbose
        print ": #{error}"
      end
    end
    puts

  end  # loop

  puts "\nPassed/Total: #{passed}/#{total}"
end

main()
