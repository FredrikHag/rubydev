require "./charStream"
require "./html"




class HtmlParser_old2

   

    Tags = [HTMLsym::Tag::OpenTag, HTMLsym::Tag::CloseTag, HTMLsym::Tag::EndTag]
    Tokens = [HTMLsym::Token::OpenBracket, HTMLsym::Token::CloseBracket, HTMLsym::Token::Slash]

        attr_reader :stream, :tagBuffer, :prevTag, :results, :contentBuffer
       

    def initialize(path)
        @stream = Charstream.new(File.open(path, "r"))
        @tagBuffer = ""
        @prevTag = ""
        @results = {}
        @contentBuffer = ""
    end



def Token?()
   
   return Tokens.include?(@stream.buffer[1]) 

end







 def opentag?

    return @stream.buffer[1] == HTMLsym::Tag::OpenTag

 end

 def closetag?

    return @stream.buffer[1] == HTMLsym::Tag::CloseTag

 end



 def Tag?()

   return closetag? || opentag?
        
 end



 #######################################################


 def saveContent()

    if @results.include?(@prevTag)
        @results[@prevTag].push(@contentBuffer)
    else
        @results[@prevTag] = Array.new
        @results[@prevTag].push(@contentBuffer)
    end
    @contentBuffer = ""
    @prevTag = ""
    @tagBuffer = ""
    return
end

def getNext()
    
     
    @stream.get

  
    if @stream.eof
        return
    end


    
   
    
    if Token?() 
         token() 
    else
    getNext()
    end

end


def content()
    

    if @stream.eof
        return
    end
   

    @contentBuffer += @stream.buffer[1]
    puts "Content  " + @stream.buffer[1]

    @stream.get

    Token? ? token() : content()

    
end



def token()



    if @stream.eof 
        return
    end

    

    Tag? ? tag() : getNext()

end


def tag()



closetag? ? content() : tagContent()


    #if @stream.buffer[0] + @stream.buffer[1] == HTMLsym::Tag::EndTag
    #   tagContent()
  #  elsif opentag? 
   #     tagContent()
  #  end        

end


def tagContent()
    puts "TagContent    " + @stream.buffer[1]

    if @stream.eof 
        return
    end

    @prevTag = @tagBuffer
   
    
    @tagBuffer += @stream.buffer[1]

    @stream.get

    Token? ? token() : nil
    @stream.buffer[1] == " " ? getNext() : tagContent()



   
     
        
   # if @stream.buffer[1] != " " && @stream.buffer[1] != ">"
    #    if @stream.buffer[1] != "/" 
          #   @tagBuffer += @stream.buffer[1]
    #    end
    #    tagContent()
    #end
    #@prevTag = @tagBuffer
    #char()
end

def parse()
   getNext()
   puts @results
end

end
