class JSONByURL
    attr_reader :url, :logger
    attr_accessor :result, :clean, :code, :json

    def initialize(url, logger = false)
        @url = url
        @logger = logger
    
        @result = {clean: false}
        
        puts "GETting JSON: #{url}" if @logger
        begin
          response = RestClient.get(url)
          @code = response.code
          @json = JSON.parse(response)
        rescue RestClient::BadRequest => e
          @code = e.http_code
        else #check for 2xx also?
          @clean = true
        end
    end
end