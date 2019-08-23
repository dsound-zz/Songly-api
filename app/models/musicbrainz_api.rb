class MusicbrainzApi

  include HTTParty 

  @user_agent = {headers: {"User-agent" => "Songly/ver1.0 (demiansims@gmail.com)"},  debug_output: STDOUT }
 
  URI = "http://musicbrainz.org/ws/2/recording/?query=name:"
  
    attr_accessor :results, :titles, :names, :artists, :lengths

    
    def initialize(response)
        @response = response 
        @titles = response['recordings'].map { |k,v| k['title'] }
        @names = response['recordings'].map { |k,v|  k['artist-credit'][0]['name'] }
        @artists = response['recordings'].map { |k,v|  k['artist-credit'][0]['artist']['name'] }
        @lengths = response['recordings'].map { |k,v| k['length'] }
    end

    def self.search_brainz(search)
    response = get("#{URI}#{search}&fmt=json", @user_agent)
    if response 
        new(response) 
    else
        raise response.response 
     end
  end



end
