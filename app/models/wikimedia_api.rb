class WikimediaApi 
    include HTTParty

    URI = "https://en.wikipedia.org/w/api.php/w/api.php?"
    
    def initialize(response) 
        @response = response
    end

    def self.search_wiki(search) 
        response = get("#{URI}action=query&format=json&generator=search&gsrsearch=#{search}%20(Song)%20&gsrsort=relevance")
    end 

    def self.select_wiki(pageid)
        response = get("#{URI}action=query&format=json&prop=extracts&pageids=#{pageid}")
    end

    
end