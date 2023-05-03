

    module Token
        CloseBracket = ">"
        OpenBracket = "<"
        Slash = "/"
    end 

    module Tag
        OpenTag = Token::OpenBracket #<
        CloseTag = Token::CloseBracket #>
        EndTag = Token::OpenBracket + Token::Slash #</
    end 


    Tokens = [">", "<", "/", " "]


