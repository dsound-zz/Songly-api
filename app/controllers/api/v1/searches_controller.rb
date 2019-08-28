class Api::V1::SearchesController < ApplicationController

    
    def search 
        @discog_results = DiscogsApi.search_discogs(params[:q])
        @mb_results = MusicbrainzApi.search_brainz(params[:q])
        @itunes_results = ItunesApi.search_itunes(params[:q]).tracks_and_artists
        render json: @mb_results
    end 

    def selected
        # MusicbrainzDetail.get_recordings(params[:recording_id])
        DiscogsDetail.get_details(params[:title], params[:artist])
        # ItunesDetail.new(@title, @artist)
    end
end
