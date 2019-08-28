class DiscogsApi 
    include HTTParty 

    DISCOGS_URI = "https://api.discogs.com/database/"
    DISCOGS_URI2 = "https://api.discogs.com/"

  @ck = Rails.application.credentials[:discogs_CK]
  @cs = Rails.application.credentials[:discogs_CS]
  @discogs_user_agent = {headers: {"User-agent" => "Songly/v1.0" }}
 
     attr_accessor :response, :titles, :master_ids, :thumbs 
  

    def initialize(response) 
        @response = response
        @titles = response['results'].map { |k,v| k['title'] }.compact
        @master_ids = response['results'].map { |k,v| k['master_id'] }.compact
        @thumbs = response['results'].map { |k,v| k['thumb'] }.compact
    end

    def self.search_discogs(search) 
        response = get("#{DISCOGS_URI}search?q=#{search}&type=master&key=#{@ck}&secret=#{@cs}")
        if response 
            new(response) 
        else 
            raise response.response 
        end 
    end

end 


