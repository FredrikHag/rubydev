require_relative "parser2"
require_relative "indexDocument"
require_relative "categories"
require_relative "request"
require_relative "addDocumentRequest"
require_relative "consts"



class Counter
    attr_accessor :wordTable, :stream, :document, :topWords, :topCounts, :wordStream

    def initialize(document)
        @document = document
        @wordStream = Wordstream.new(document)
        @wordTable = Hash.new
        @topWords = Hash.new
        @topCounts = Array.new
        count()
    end


def count()
   
    while !@wordStream.eof
        currentWord = @wordStream.getWord()
        if !currentWord.nil? && !EXCLUDED_WORDCOUNTS.include?(currentWord)

        if @wordTable.include?(currentWord) 
            @wordTable[currentWord] += 1
        else
            @wordTable[currentWord] = 1
        end
    end
    end

    
   

    
    rescue Exception
        
        @wordTable.each_value do |count|
            @topCounts.push(count)
        end
    
        @topCounts.sort!.reverse!
        maxCounts = @topCounts.take(TOP_WORD_SIZE)

        @wordTable.each_pair do |word, count|
            if maxCounts.include?(count)
                @topWords[word] = count
            end
        end
        
        puts @topWords

         return
    
    
    end
end