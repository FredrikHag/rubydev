require "./request"
require "net/http"
require "json"



class AddDocumentRequest < Request
        attr_reader :bulkbody, :index

        def initialize(index)
            super("/_bulk")
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
                Path: document.path_val,
                h1: document.h1_val

            }


         @bulkbody += JSON.generate({create: {_index: @index}}) + "\n" + JSON.generate(singleBody) + "\n"
          
        end


    

      
           

        end
    end