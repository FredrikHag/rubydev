require "./Tokenstream.rb"
require 'stringio'
require "./Token.rb"

class Wordstream < Tokenstream
    attr_reader :buffer, :source, :eof, :eot

    def initialize(document)
        source = StringIO.new(document.text)
        super(source)
    end




    def start()

        
    end



def getWord()

    if !@eof 
    char = getNext()
    buffer = ""
    

    while char != " "
        if char != "." 
            buffer += char
        end
        char = getNext()
    end
        return buffer.upcase!
    
end
end





end