class DiscogsApi 
    include HTTParty 

    @ck = Rails.application.credentials[:discogs_CK]
    @cs = Rails.application.credentials[:discogs_CS]

    URI = "https://api.discogs.com/database/search?q="

    attr_accessor :respnose 
  

    def initialize(response) 
        @response = response
    end

    def self.search_discogs(search) 
        response = get("#{URI}#{search}&type=release&key=#{@ck}&secret=#{@cs}")
    end

end 