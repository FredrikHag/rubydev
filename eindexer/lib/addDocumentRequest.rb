require_relative "request"
require "net/http"
require "json"



class AddDocumentRequest < Request
        attr_reader :bulkbody, :index

        def initialize(index)
            super("/_bulk/")
            @bulkbody = ""
            @index = index
        end

        def postBulk(documents)

            documents.each do |document|

            singleBody = {

                Title: document.title_val,
                PaymentMethod: document.method_val,
                Implementation: document.implementation_val,
                Parent: document.parent_val,
                Url: document.url,
                text: document.content

            }

            
         @bulkbody += JSON.generate({create: {_index: @index}}) + "\n" + JSON.generate(singleBody) + "\n"
        
        
        
          
        end


    
        response = post(@bulkbody)

        return response.code + " " + response.message + " " + response.body
      
           

        end
    end