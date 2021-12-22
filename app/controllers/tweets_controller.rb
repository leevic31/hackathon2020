class TweetsController < ApplicationController
  def index
    @tweets = []
    if params[:start_date] && params[:end_date]
      start_date = params[:start_date]
      end_date = params[:end_date]
      @tweets = TrumpTweet.where(:publishedAt => start_date..end_date).page params[:page]
    end
  end
end