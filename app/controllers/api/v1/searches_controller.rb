class Api::V1::SearchesController < ApplicationController

    
    def search 
       byebug 
        @discog_result = DiscogsApi.search_discogs(params[:q]).titles
        # @mb_result = MusicbrainzApi.search_brainz(params[:q])
        # @itunes_result = ItunesApi.search_itunes(params[:q])
        render json: @discog_result
     end 
end
