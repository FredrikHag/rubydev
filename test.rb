

require "./Wordstream.rb"
require "./Token.rb"
require "./parser2"
require "./indexDocument"
require "./Indexer.rb"
require "./counter.rb"

t1 = Time.new



indexer = Indexer.new("./_site_test")


indexer.parseDir()

documents = indexer.documents

documents.each do |document|
    counter = Counter.new(document)
    end

indexer.index(false, "test3")



t2 = Time.new

diff = t2 - t1

puts "Indexed and counted site in #{diff}"

