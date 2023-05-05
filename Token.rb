class Token

CONTROLCHARS = ["\n", "\r", "\t"]

    attr_accessor :type, :value
    def initialize(type, value)
        @type = type
        @value = value
    end

end


class Tag
    attr_accessor :name, :attributes
    def initialize(name, attributes)
        @name = name
        @attributes = attributes
    end
end


class Attributes
    attr_accessor :type, :value, :attributes
    def initialize(attributes)
        @attributes = attributes
    end
end


class Unit
    attr_accessor :tag, :content, :innerUnits
    def initialize(tag, content, innerUnits)
        @tag = tag
        @content = content
        @innerUnits = innerUnits
    end
end


class Eot < Exception
    attr_accessor :file, :message
    def initialize(file)
        @message = "Reached end of tokenstream for #{file.path}"
        @file = file
    end
end


class ParseError < Exception
    attr_accessor :message
    def initialize(currentFilePath)
        @message = "Could not parse #{currentFilePath}"
    end
end