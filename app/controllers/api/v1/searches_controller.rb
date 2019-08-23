class Api::V1::SearchesController < ApplicationController

    
    def index 
        @result = DiscogsApi.search_discogs
        byebug 
        render json: @result 
        
    end 
end
