require_relative "Tokenstream.rb"


class Parser2    
    attr_reader :stream, :units, :tags, :path, :unitTable, :documents
        def initialize(path)
            @units = {all: Array.new}
            @tags = Array.new
            @path = path
            @unitTable = Array.new
            @documents = Array.new
            @stream = Tokenstream.new(File.open(path, "r"))
        end



def stripTags()
    buffer = ""
    while !@stream.eot && !stream.eof
        token = @stream.getToken()
            if token.type == 'content'
                token.value.squeeze!(" ", "\n", "\r", "\t")
                token.value.strip!
                push = token.value + " "
                push.lstrip!
                buffer += push
            end
        end
        
        return buffer
    end


 
def getText()
    parse()
    text = {content: "", title: ""}
    @unitTable.each do |unit|
        if unit.tag.name == "p" || unit.tag.name == "strong" || unit.tag.name == "h1" 
            unit.content.squeeze!(" ", "\n", "\r", "\t")
            unit.content.strip!
            push = unit.content + " "
            push.lstrip!
            if unit.tag.name == "h1" 
                text[:title] = push
            else
                text[:content] += push
            end 
        end
    end
    return text
end



def parse()

while !@stream.eof
    token = @stream.getToken()

    if token.type == "openTag"
            @stream.putToken(token)
            unit()
    elsif token.type != "content"
        puts "unexpected input"
        return 
    end

end
puts "Parsed file " + @path


rescue Exception

    
    $!.file.close
     return


end


def unit()

   

    buffer = Hash.new
    buffer['content'] = Array.new
    innerUnits = Array.new
    

    token = @stream.getToken()

    if @stream.eot 
        return 
    end
    
    if (token.type == "openTag")
        buffer['tag'] = token
    else
        puts "error"
        return
    end

    token = @stream.getToken()

    while true

        

        if token.type == "content"
        
            buffer['content'].push(token)
            
        end
        
        if token.type == "openTag"
                @stream.putToken(token)
                innerUnits.push(unit())
        end

        token = @stream.getToken()

        

        if token.type == "closeTag"
            break
        end

    end  



    tag = buffer['tag'].value
    content = ""

    buffer['content'].each do |contentToken|
        content += contentToken.value
    end

    thisUnit = Unit.new(tag, content, innerUnits)

    @unitTable.push(thisUnit)

    return thisUnit
end




end