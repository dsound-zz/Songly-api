class Api::V1::SearchesController < ApplicationController

    
    def search 
        @discog_result = DiscogsApi.search_discogs(params[:q])
        @mb_result = MusicbrainzApi.search_brainz(params[:q])
        @itunes_result = ItunesApi.search_itunes(params[:q]).tracks_and_artists
        render json: {discogs: @discog_result, musicbrainz: @mb_result, iTunes: @itunes_result}
     end 
end
