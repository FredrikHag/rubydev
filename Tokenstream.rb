
require "./Token.rb"

class Tokenstream
    attr_reader :buffer, :source, :eof, :eot

    def initialize(source)
        @buffer = Array.new
        @tokenBuffer = Array.new
        @bufferMax = 1000
        @source = source
        @eof = false
        @eof = false
        start()
    end





def start()

    temp = source.getc 
    
    
   while temp != "<" && !@eof
    temp = source.getc 
   end

   put(temp)



end


def read()
   

    temp = source.getc 
    
    
      
  
    
   if temp.nil? 
        return nil
   end

   
        @buffer.push(temp)
        
  
end

def getToken()
    readToken()

    temp = @tokenBuffer.shift

    if temp.nil?
        @eot = true
    end


    puts caller[0] + "is getting token: " + temp.type

    return temp

end

def getNext()

    read()
   # puts "reading from file: " + (@buffer.first.nil? ? "eof" : @buffer.first)

    if @buffer.first.nil?
        @eof = true
    end

    return @buffer.shift
end

def readToken()
    
    char = getNext()
   
    

    if char  == "<"
        puts "read" + char
        put(char)
        @tokenBuffer.push(tag())
    else
        put(char)
        @tokenBuffer.push(content()) 
    end
end
    


   




def content()
    buffer = ""
    char = getNext()

   

 

    while char != "<" && !@eof
        buffer += char
        char = getNext()
    end

    put(char)

    return Token.new('content', buffer)
end





def tag()
    temp = []
    char = getNext()
    temp.push(char)
    char = getNext()
    temp.push(char)

    if char == "/"
        put(temp.pop)
        put(temp.pop)
        return closeTag()
    else
        put(temp.pop)
        put(temp.pop)
        return openTag()
    end
end



def closeTag()
    char = ""

    while char != "/" && !@eof
        char = getNext()
    end

    name = tagname()

    attributes = attributes()

    char = getNext()

    if char != '>'
        return "error"
    end
    

    return Token.new('closeTag', Tag.new(name, Attributes.new(attributes)))

end




def tagname()
    buffer = ""
    char = getNext()

    while char != " " && char != ">" && !@eof
        buffer += char
        char = getNext()
    end

    put(char)

    return buffer


end


def attributes
    buffer = ""
    char = getNext()

    while char != ">" && !@eof
        buffer += char
        char = getNext()
    end

    put(char)

return Token.new('Attributes', buffer)

end

def openTag()
  char = ""


    while char != "<" && !@eof
        char = getNext()
    end

    name = tagname()

    attributes = attributes()

    char = getNext()

    if char != '>'
        return "error"
    end
    

    return Token.new('openTag', Tag.new(name, Attributes.new(attributes)))

end


def put(chars)

    
        @buffer.prepend(chars)
    
    
end


def putToken(token)

    puts "Putting back token: " + token.type
    
    @tokenBuffer.prepend(token)


end



def Token?(char)

    
        if Tokens.include?(char) || char.match?(/[[:alnum:]]/)
            return true
        end
    
end


end