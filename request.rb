require "net/http"
require "json"
require "./consts"

class Request

    attr_reader :uri, :headers, :session

    def initialize(path)
        @uri = URI(BASEURL)
        @uri.path = path
        @headers = {"Authorization" => AUTHORIZATION,
                    "content-type" => CONTENT_TYPE}

        @session = Net::HTTP.new(uri.host, uri.port)
        @session.use_ssl = true
        @session.ca_file = CA_FILE
        @session.start
    end

    def post(content)
       return @session.post(@uri, content, @headers)
    end

end