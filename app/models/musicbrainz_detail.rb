class MusicbrainzDetail
    include HTTParty 
    
  @mb_user_agent = {headers: {"User-agent" => "Songly/ver1.0 (demiansims@gmail.com)"},  debug_output: STDOUT }

  
  MB_URI = "http://musicbrainz.org/ws/2/release/"

  attr_accessor :release_id, :response

  def initialize(response) 
    @response = response
    @artist_credits = artist_credits(response) 
    
  end

  def self.get_details(release_id)
    response = get("#{MB_URI}#{release_id}?inc=artist-credits+artist-rels+media+recording-level-rels+url-rels+work-level-rels+recording-rels&type=soundtrack&fmt=json", @mb_user_agent) 
    if response 
      new(response) 
    else 
      raise response.response 
    end
  end

  private 

  def artist_credits(response)
    response["relations"].map { |r| r["artist"] }.compact
  end 

end
