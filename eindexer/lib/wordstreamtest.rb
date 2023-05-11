require "./Wordstream.rb"
require "./Token.rb"
require "./parser2"
require "./indexDocument"
require "./Indexer.rb"
require "./counter.rb"



indexer = Indexer.new("./_site_test/checkout-v3")


indexer.parseDir()
#indexer.index(false, "test3")

documents = indexer.documents

documents.each do |document|
counter = Counter.new(document)
end



