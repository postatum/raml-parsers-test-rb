require 'optparse'
require 'ostruct'


class OptParse

  # brujula: https://github.com/nogates/brujula
  # ramlrb:  https://github.com/jpb/raml-rb
  PARSERS = %w[brujula ramlrb]

  def self.parse(args)
    options = OpenStruct.new
    options.verbose = false
    options.parser = ""

    opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: ruby main.rb [options]"

      opts.separator ""
      opts.separator "Specific options:"


      opts.on("--verbose", "Print errors traces") do |v|
        options.verbose = v
      end

      opts.on("--parser NAME", PARSERS, "Parser to test") do |parser|
        options.parser = parser
      end

      opts.separator ""
      opts.separator "Common options:"

      opts.on_tail("-h", "--help", "Show this message") do
        puts opts
        exit
      end
    end

    opt_parser.parse!(args)
    options
  end  # parse()
end  # class OptParse


def clone_tck_repo()
  # TODO
  repo_dir = "/tmp/raml-tck"
  puts "Cloning raml-tck repo to #{repo_dir}"
  return repo_dir
end

def list_ramls(ex_dir)
  # TODO
  ramls = ["a", "b"]
  ramls
end