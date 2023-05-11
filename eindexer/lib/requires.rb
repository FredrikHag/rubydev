 files = ["addDocumentRequest.rb", "categories.rb", "counter.rb", "html.rb", "indexDocument.rb", "Indexer.rb", 
    "parser2.rb", "request.rb", "searchRequest.rb", "testbin.rb", "Token.rb","Tokenstream.rb", "Wordstream.rb", "test.rb"]

files.each do |file|
    require_relative file
end