class DiscogsDetail 
    include HTTParty 

    DISCOGS_URI = "https://api.discogs.com/database/"
    DISCOGS_URI2 = "https://api.discogs.com/"

  @ck = Rails.application.credentials[:discogs_CK]
  @cs = Rails.application.credentials[:discogs_CS]
  @discogs_user_agent = {headers: {"User-agent" => "Songly/v1.0" }}

    attr_accessor :title, :name 

    def initialize(response)
        binding.pry 
    end

    def self.get_details(title, artist) 
        binding.pry 
        response = get("#{DISCOGS_URI}search?release_title=#{title}&artist=#{artist}&type=master&key=#{@ck}&secret=#{@cs}")
        if response 
            new(response) 
        else
            raise response.response 
        end
    end


end