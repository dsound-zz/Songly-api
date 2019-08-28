class ItunesApi 
    include HTTParty

    attr_accessor :response, :collection_names, :artists, :tracks 


    def initialize(response) 
        @response = JSON.parse(response) 
        @collections  = @response["results"].map { |k,v| k["collectionName"] }.compact
        @artists = @response["results"].map { |k,v| k["artistName"] }.compact
        @tracks = @response["results"].map { |k,v| k["trackName"] }.compact
    end 

    def self.search_itunes(search)
        response = get("https://itunes.apple.com/search?term=#{search}")
        if response 
            new(response) 
        else 
            raise response.response
        end
    end 

    def tracks_and_artists
        t_and_a = {}
        @tracks.each_with_index do |track, index|
            t_and_a[track] = @artists[index]
         end
        t_and_a 
    end

    def soundtracks
        found_soundtracks = @collections.select { |cn| cn.include?("Soundtrack") }
    end

   
end 