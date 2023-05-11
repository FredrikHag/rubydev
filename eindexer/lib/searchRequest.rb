require_relative "request"
require "net/http"
require "json"



class SearchRequest < Request
        attr_reader :bulkbody, :index

        def initialize(index)
            super("/" + index + "/_search/")
            @body = ""
            @index = index
        end

        def search(query)

            body = {

                docvalue_fields: ["checkout"],
                _source: {
                    includes: "Title"
                }



            }
            
            
            
        @body = JSON.generate(body)
        
        response = post(@body)

        return response
          
        end

      
      
           

       
    end