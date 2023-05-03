require "./Tokenstream.rb"


class Parser    
    attr_reader :stream, :openTags, :closeTags, :content, :units, :results
        def initialize(path)
            @stream = Tokenstream.new(File.open(path, "r"))
            @openTags = Array.new
            @closeTags = Array.new
            @content = Array.new
            @token = ""
            @units = {all: ""}
            @results = Array.new
        end

def parse()
    while !@stream.eof
    unit()
    end
end

def unit()

    tagBuffer = ""
    contentBuffer = ""

    token = @stream.get

    while !@stream.eof

    puts "unit got token: " + token
    if token.nil? 
        @results.push([tagBuffer, contentBuffer])
        return
    end

     if token == "<"  
        @stream.put(token)
         tagBuffer += openTag()
     else puts "file does not start with a tag"
     end


     token = @stream.get
     puts "unit got token: " + token
     if token.nil? 
        @results.push([tagBuffer, contentBuffer])
        return
    end

     if token == "<"  
        token = @stream.get
        puts "unit got token: " + token
        if token == "/"  
            @results.push([tagBuffer, contentBuffer])
            return
        end
    end



            @stream.put(token)
            contentBuffer += content()
    puts "contentBuffer: " + contentBuffer


            token = @stream.get
            puts "unit got token: " + token
            if token.nil? 
                puts "read nil"
                @results.push([tagBuffer, contentBuffer])
                return
            end

            temp = []

            if token == "<"  
                temp.push(token)
               token = @stream.get
               temp.push(token)
               puts "unit got token: " + token
               if token == "/"  
                token = @stream.get
                puts "unit got token: " + token
                    while token != ">"
                        token = @stream.get
                        puts "unit got token: " + token
                    end 
                    puts "finished"   
                    @results.push([tagBuffer, contentBuffer])
                    return
                else
                    @stream.put(temp.pop)
                    @stream.put(temp.pop)
                    unit()
                end

            else
                @stream.put(token)
                unit()

            end
               

              
                
           




  end




     
    
 end


 def content()

 buffer = ""

    token = @stream.get

    puts "content got token: " + token

    if token.nil? 
        return buffer
    end

    while token != "<"
        buffer += token
        token = @stream.get
        puts "content got token: " + token
    end

    if token == "<"
    @stream.put(token)
    end

    return buffer
end




def openTag()

tagBuffer = ""

token = @stream.get

puts "opentag got token: " + token

if token.nil? 
    return tagbuffer
end


    if token == "<"
        tagBuffer += token
        tagBuffer += tagName()
        attributes()
        token = @stream.get
        puts "opentag got token: " + token
        if token != ">"
            return "error"
        else
        tagBuffer += token
        end
    end
    return tagBuffer
end

def tagName()
    buffer = ""

    token = @stream.get

    puts "tagname got token: " + token

    if token.nil? 
        return buffer
    end

    while token != " " && token != ">"
        buffer += token
        token = @stream.get
        puts "tagname got token: " + token
    end

    @stream.put(token)

    return buffer

end


def attributes()
    token = @stream.get

    puts "attributes got token: " + token

    if token.nil? 
        return
    end

    while token != ">"
        token = @stream.get
        puts "attributes got token: " + token
    end

    @stream.put(token)

return

   
end






end