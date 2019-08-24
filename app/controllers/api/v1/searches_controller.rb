class Api::V1::SearchesController < ApplicationController

    
    def index 
        # @discog_result = DiscogsApi.search_discogs('Love me do')
        # @mb_result = MusicbrainzApi.search_brainz('Love me do')
        @itunes_result = ItunesApi.search_itunes("Seasons of love")
        render json: @itunes_result.soundtracks 
        
    end 
end
