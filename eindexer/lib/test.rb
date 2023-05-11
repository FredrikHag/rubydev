

require_relative "Wordstream"
require_relative "Token"
require_relative "parser2"
require_relative "indexDocument"
require_relative "Indexer"
require_relative "counter"
require "jekyll"

Jekyll::Hooks.register :site, :post_write do |page|
    test()
end    


def test()
    
t1 = Time.new



indexer = Indexer.new("./_site")


indexer.parseDir()

documents = indexer.documents

documents.each do |document|
    counter = Counter.new(document)
    end

indexer.index(true, "test4")



t2 = Time.new

diff = t2 - t1

puts "Indexed and counted site in #{diff}"



end

