class DiscogsApi 
    include HTTParty 


    @ck = Rails.application.credentials[:discogs_CK]
    @cs = Rails.application.credentials[:discogs_CS]
    @user_agent = {headers: {"User-agent" => "Songly/v1.0" }}

    URI = "https://api.discogs.com/database/"
    URI2 = "https://api.discogs.com/"

    attr_accessor :respnose, :titles, :master_ids, :thumbs 
  

    def initialize(response) 
        @response = response
        @titles = response['results'].map { |k,v| k['title'] }
        @master_ids = response['results'].map { |k,v| k['master_id'] }
        @thumbs = response['results'].map { |k,v| k['thumb'] }
    end

    def self.search_discogs(search) 
        response = get("#{URI}search?q=#{search}&type=master&key=#{@ck}&secret=#{@cs}")
        if response 
            new(response) 
        else 
            raise response.response 
        end 
    end

    
    # def search_master
  
       
    #         response = HTTParty.get("#{URI2}masters/45574")
    #         puts response 
        
    # end 

 

   

end 