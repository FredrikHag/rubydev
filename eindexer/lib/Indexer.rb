require_relative "parser2"
require_relative "indexDocument"
require_relative "categories"
require_relative "request"
require_relative "addDocumentRequest"



class Indexer
    attr_accessor :dir, :documents
    def initialize(dir)
        @dir = dir
        @documents = Array.new
    end



def parseDir()

    filesToParse = checkDir(@dir)
    filesToParse.each do |filepath|
        @documents.push(IndexDocument.new(filepath))
        puts "Created document for " + filepath
    end
end

     
private def checkDir(dir)

    searchDirectory = Dir.new(dir)
    
    filesToParse = Array.new
    
    searchDirectory.each_child do |entry|
        if entry.end_with?(".html") 
            filesToParse.push(dir + "/" + entry)
        elsif Dir.exist?(dir + "/" + entry)
            filesToParse.push(checkDir(dir + "/" + entry))
        end
    end
    
    searchDirectory.close
    return filesToParse.flatten
    
end      





def index(send,index)

documentBuffer = Array.new

while @documents.size != 0 do

    while documentBuffer.size < 10 && @documents.size != 0 do
        documentBuffer.push(@documents.pop)
    end

    puts send ? AddDocumentRequest.new(index).postBulk(documentBuffer) : "testmode"


documentBuffer.clear

end

puts "Everything Indexed"
end
end