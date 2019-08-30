class Api::V1::SearchesController < ApplicationController

    
    def search 
        @mb_results = MusicbrainzApi.search_brainz(params[:q])
        render json: @mb_results
    end 

    def selected
        @mb_details = MusicbrainzDetail.get_details(params[:release_id])
        DiscogsDetail.get_details(params[:title], params[:artist])
        # ItunesDetail.new(@title, @artist)
        binding.pry 
        render json: @mb_details
    end
end
