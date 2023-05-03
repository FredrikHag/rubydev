require "./htmlparse"
require "./indexDocument"
require "./categories"
require "./request"
require "./addDocumentRequest"



filesToParse = HtmlParser::checkDir("./_site_test")


document = IndexDocument.new("./_site_test/checkout-v3/index.html")

=begin
documents = Array.new

filesToParse.each do |path|
    documents.push(IndexDocument.new(path))
end



request = AddDocumentRequest.new("test2")



documentBuffer = Array.new

while documents.size != 0 do

    while documentBuffer.size < 10 && documents.size != 0 do
        documentBuffer.push(documents.pop)
    end

puts postBulk(documentBuffer)

documentBuffer.clear

end

puts "Everything Indexed"