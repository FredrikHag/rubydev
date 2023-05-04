require "./Tokenstream.rb"


class Parser2    
    attr_reader :stream, :openTags, :closeTags, :content, :units, :tags, :path, :unitTable, :stringId, :stringTable
        def initialize(path)
            @stream = Tokenstream.new(File.open(path, "r"))
            @units = {all: Array.new}
            @tags = Array.new
            @path = path
            @unitTable = Array.new
            @stringTable = Hash.new
            @stringId = 0
        end



def stripTags()
    buffer = ""
    while !@stream.eot && !stream.eof
        token = @stream.getToken()
            if token.type == 'content'
                buffer += token.value
            end
        end
        return buffer
    end



def parse()

while !@stream.eof
    puts "eof?" 
    puts @stream.eof
    token = @stream.getToken()

        puts "parse got token " + token.type

    if token.type == "openTag"
            @stream.putToken(token)
            unit()
    elsif token.type != "content"
        puts "unexpected input"
        return 
    end

end
puts "Parsed file " + @path

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
        puts "saves token: " + token.type
        puts token
        buffer['tag'] = token
    else
        puts "error"
        return
    end

    token = @stream.getToken()

    while true

        if @stream.eot
            return 
        end

        if token.type == "content"
        
            buffer['content'].push(token)
            
        end
        
        if token.type == "openTag"
                @stream.putToken(token)
                innerUnits.push(unit())
        end

        token = @stream.getToken()

        if @stream.eot
            return 
        end

        if token.type == "closeTag"
            break
        end

    end  

    puts "finished unit with tag " + token.value.name


    tag = buffer['tag'].value
    content = ""

    buffer['content'].each do |contentToken|
        content += contentToken.value
    end

    thisUnit = Unit.new(tag, content, innerUnits)

    @unitTable.push(thisUnit)

    return thisUnit
end

def save(unit, innerUnits)

    
end


end