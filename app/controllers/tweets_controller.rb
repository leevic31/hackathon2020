class TweetsController < ApplicationController
  def index
    @tweets = TrumpTweet.page params[:pages]
  end
end
