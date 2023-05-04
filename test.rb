

require "./parser2"
#require "./indexDocument"
#require "./categories"
#require "./request"
#require "./addDocumentRequest"
require "./Tokenstream"





#filesToParse = HtmlParser::checkDir("./_site_test")

path = "./testfil.html"
path2 = "./_site_test/index.html"

resultfile = File.open("./test.txt", "w")




parser = Parser2.new(path2)

resultfile << parser.stripTags()









#parser.parse

#puts HtmlParser::getContentPerTag("_site_test/checkout-v3/enterprise/introduction.html", ["h1", "strong"])
