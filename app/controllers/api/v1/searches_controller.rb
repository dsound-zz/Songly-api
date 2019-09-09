class Api::V1::SearchesController < ApplicationController

    
    def search 
        @mb_results = MusicbrainzApi.search_brainz(params[:q])
        @wiki_results = WikimediaApi.search_wiki(params[:q])
        render json: @wiki_results['query']['pages'].values
    end 

    def selected
        # @mb_details = MusicbrainzDetail.get_details(params[:release_id])
        # DiscogsDetail.get_details(params[:title], params[:artist])
        # @itunes_detials = ItunesApi.itunes_details(@title, @artist)
        @wiki_results = WikimediaApi.select_wiki(params[:q])

        render json: @wiki_results['query']['pages'].values
    end
end
