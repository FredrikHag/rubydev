require "./parser2"
require "./indexDocument"
require "./Indexer.rb"
require "./searchRequest.rb"




request = SearchRequest.new("test3")

response = request.search("test")


#puts response.code + " " + response.message + " " + response.body


puts JSON.parse(response.body)['hits']['hits']

