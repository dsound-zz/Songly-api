class Api::V1::SearchesController < ApplicationController

    
    def index 
        # @result = DiscogsApi.search_discogs('Love me do')
        byebug 
        render json: @result 
        
    end 
end
