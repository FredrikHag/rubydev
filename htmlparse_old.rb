require "./consts"
require "./charStream"

class HtmlParser_old


attr_accessor :rootDirectory 
        def initialize(rootDirectory)
            @rootDirectory = rootDirectory
        end

@@tags = ["h1", "strong"]

def self.checkDir(dir)

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


def self.tag(charStream)
    currChar = ""
    tagBuffer = ""


    while currChar != '<' && !charStream.eof
        currChar = charStream.get
    end
    
        while currChar != " " && currChar != ">" && !charStream.eof
            currChar = charStream.get
            currChar ? tagBuffer += currChar : nil
        end
      
       


        tagBuffer.chop!
        tagBuffer.delete!("/")

        puts tagBuffer

       
      return tagBuffer

    end



def self.content(charStream, tag)
    currChar = ""
    contentBuffer = ""


   
    

    while currChar != "<" && !charStream.eof
        currChar = charStream.get
        currChar ? contentBuffer += currChar : nil
     end
     

      nexttag = tag(charStream)

      puts "nexttag: " + nexttag 

     if nexttag == tag then return contentBuffer.delete("<")
     elsif @@tags.include?(nexttag)
        content(charStream, nexttag)
     end

 end



def self.parseHtml(file, tags)
    currChar = ""
    charStream = Charstream.new(File.open(file, "r"))
    results = Hash.new

    tags.each do |tag|
        results[tag] = Array.new
    end
    



 while !charStream.eof
    readTag = tag(charStream)
    
   
    if tags.include?(readTag) 
         results[readTag].push(content(charStream, readTag))
    end
end

      
      return results
      
  end  
        






 





def self.getTag(page, tag)

    puts "Parsing page" + page

    file = File.open(page, "r")
    content = Array.new

   
    while true
        puts("hej")
        resultBuffer = parseHtml(file, tag)
        resultBuffer != END_OF_FILE ? content.push(resultBuffer[:content]) : break
    end

    file.close
    return content
   
end



def self.getContentPerTag(page, tags)

    resultHash = Hash.new

    result = parseHtml(page, tags)


    

    return result

end



end


