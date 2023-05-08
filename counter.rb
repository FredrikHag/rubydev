require "./parser2"
require "./indexDocument"
require "./categories"
require "./request"
require "./addDocumentRequest"


class Counter
    attr_accessor :wordTable, :stream, :document

    def initialize(document)
        @document = document
        @wordstream = Wordstream.new(document)
        @wordTable = Hash.new
        count()
    end


def count()
    while !@wordstream.eof
        currentWord = @wordstream.getWord()

        if @wordTable.include?(currentWord)
            @wordTable[currentWord] += 1
        else
            @wordTable[currentWord] = 1
        end

    end
    puts "Counted Document " + @document.path
    
    @wordTable.each_pair |word, count| do
        
    
    rescue Exception
    
        
        
         return
    
    
    end
end