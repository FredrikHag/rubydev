require "./parser2"
require "./indexDocument"
require "./Indexer.rb"

t1 = Time.new



indexer = Indexer.new("./_site_test")


indexer.parseDir()
indexer.index(true, "test3")

indexer.documents.each do |document|
    puts document
end

t2 = Time.new

diff = t2 - t1

puts "Indexed site in #{diff}"

