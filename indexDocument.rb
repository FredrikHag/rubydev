require "./categories"
require "./htmlparse"



class IndexDocument
    attr_accessor :type, :title_val, :implementation_val, :method_val, :parent_val, :path_val, :h1_val

    def initialize(path)
        
        parsePath(path)
        @path_val = path
        @title_val = getTitle(path)
        @h1_val = HtmlParser::getContentPerTag(path, ["h1"])
    
        
    end





    def parsePath(path)
        paymentmethod = false
        implementation = false
        parent = nil
        folders = path.split("/")
            folders.each do |entry|
                paymentmethod ? paymentmethod : paymentmethod = paymentMethod(entry)
                implementation ? implementation : implementation = implementation(entry)
            end
            parent = parent(folders)

            @method_val = paymentmethod ?  paymentmethod : "unknown"
            @implementation_val = implementation ? implementation : "unknown"
            @parent_val = parent ? parent : "unknown"
            
    end


def paymentMethod(entry)    
 index = PaymentMethods::PAYMENTMETHODS.index(entry)
 if index
    return getPaymentMethod(PaymentMethods::PAYMENTMETHODS[index])
else
    return false 
end

end


def implementation(entry)    

    index = Implementations::IMPLEMENTATIONS.index(entry)

    if index
        return getImplementation(Implementations::IMPLEMENTATIONS[index])
    else
        return false 
    end
end


def parent(entries)    

    return entries[(entries.length)-2]

end


def getTitle(path)
    return File.basename(path, ".*")
end

def getImplementation(implementation)
    Implementations::IMPLEMENTATIONHASH.each_pair do |proper, given|
        if given.include?(implementation) then return proper
        end
    end
    return false

end


def getPaymentMethod(paymentmethod)
    PaymentMethods::PAYMENTMETHODHASH.each_pair do |proper, given|
        if given.include?(paymentmethod) then return proper
        end
    end
    return false
    
end


end
