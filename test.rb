

require "./parser"
#require "./indexDocument"
#require "./categories"
#require "./request"
#require "./addDocumentRequest"
require "./Tokenstream"





#filesToParse = HtmlParser::checkDir("./_site_test")

path = "./_site_test/index.html"




parser = Parser.new(path)

parser.parse()



strongElements = Array.new

strongElements = parser.results.each do |result|
  if result.include?("<strong>")
    return result
  end
end

puts strongElements.inspect


#parser.parse

#puts HtmlParser::getContentPerTag("_site_test/checkout-v3/enterprise/introduction.html", ["h1", "strong"])
