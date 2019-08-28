class MusicbrainzDetail
    include HTTParty 
    
  @mb_user_agent = {headers: {"User-agent" => "Songly/ver1.0 (demiansims@gmail.com)"},  debug_output: STDOUT }

  
  MB_URI = "http://musicbrainz.org/ws/2/recording/"

  attr_accessor :recording_id

  def initialize(response) 
     
  end

  def self.get_recordings(recording_id)
    response = get('#{MB_URI}#{recording_id}?inc=artist-credits+isrcs+releases&fmt=json') 
    if response 
      new(response) 
    else 
      raise response.response 
    end
  end

end
