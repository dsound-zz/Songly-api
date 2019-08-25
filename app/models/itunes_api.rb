class ItunesApi
    include HTTParty

    attr_accessor :response, :collection_names, :artist_names, :track_names 


    def initialize(response) 
        @response = JSON.parse(response) 
        @collection_names  = @response["results"].map { |k,v| k["collectionName"] }.compact
        @artist_names = @response["results"].map { |k,v| k["artistName"] }.compact
        @track_names = @response["results"].map { |k,v| k["trackName"] }.compact
    end 

    def self.search_itunes(search)
        response = get("https://itunes.apple.com/search?term=#{search}")
        if response 
            new(response) 
        else 
            raise response.response
        end
    end 

    def soundtracks
        found_soundtracks = @collection_names.select { |cn| cn.include?("Soundtrack") }
    end

   
end 