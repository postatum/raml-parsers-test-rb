require 'brujula'
require 'raml/parser'


def brujula_parse(fpath)
  # Access 'root' because looks like brujula uses lazy loading
  Brujula.parse_file(fpath).root
end

def ramlrb_parse(fpath)
  return Raml::Parser.parse_file(fpath)
end
