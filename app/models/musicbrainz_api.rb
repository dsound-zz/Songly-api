class MusicbrainzApi 
   include HTTParty 
    
  @mb_user_agent = {headers: {"User-agent" => "Songly/ver1.0 (demiansims@gmail.com)"},  debug_output: STDOUT }

 
  MB_URI = "http://musicbrainz.org/ws/2/release/?query=name:"
  
    attr_accessor  :titles, :artists, :artists, :lengths

    
    def initialize(response)
    
        @response = response 
        @titles = response['releases'].map { |k,v| k['title'] }.compact
        @artists = response['releases'].map { |k,v|  k['artist-credit'][0]['name'] }.compact
        # @artists = response['releases'].map { |k,v|  k['artist-credit'][0]['artist']['name'] }.compact
        @lengths = response['releases'].map { |k,v| k['length'] }.compact
        @id = response['releases'].map { |k,v| k['id'] }.compact
    end

    def self.search_brainz(search)
    response = get("#{MB_URI}#{search}&fmt=json", @mb_user_agent)
    if response 
        new(response) 
    else
        raise response.response 
     end
  end

end

