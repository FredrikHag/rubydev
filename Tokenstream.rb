require "./html.rb"

class Tokenstream
    attr_reader :buffer, :source, :eof

    def initialize(source)
        @buffer = Array.new
        @bufferMax = 1000
        @source = source
        @eof = false
        read()
    end


def read()
   

    temp = source.getc 
    
    
      
  
    
   if temp.nil? 
        @eof = true
        return false
   end

    if Token?(temp)
        @buffer.push(temp)
        
    else
       
        read()
    end


end


def get()
    read()
    return @buffer.shift

end



def put(chars)

    
        @buffer.prepend(chars)
    
    
end



def Token?(char)

    
        if Tokens.include?(char) || char.match?(/[[:alnum:]]/)
            return true
        end
    
end


end