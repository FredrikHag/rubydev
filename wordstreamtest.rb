require "./Wordstream.rb"
require "./Token.rb"
require "./parser2"
require "./indexDocument"
require "./Indexer.rb"
require "./counter.rb"



indexer = Indexer.new("./_site_test/gift-cards")


indexer.parseDir()
#indexer.index(false, "test3")

puts indexer.documents[0]


counter = Counter.new(indexer.documents[0])
puts counter.wordTable
counter = Counter.new(indexer.documents[1])
puts counter.wordTable
counter = Counter.new(indexer.documents[2])
puts counter.wordTable
counter = Counter.new(indexer.documents[3])


