

require "./parser2"
#require "./indexDocument"
#require "./categories"
#require "./request"
#require "./addDocumentRequest"
require "./Tokenstream"





#filesToParse = HtmlParser::checkDir("./_site_test")

path = "./testfil.html"




parser = Parser2.new(path)

puts parser.stripTags()









#parser.parse

#puts HtmlParser::getContentPerTag("_site_test/checkout-v3/enterprise/introduction.html", ["h1", "strong"])
