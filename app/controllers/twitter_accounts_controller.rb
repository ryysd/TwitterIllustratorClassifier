class TwitterAccountsController < ApplicationController
  def index
    # client = Twitter::REST::Client.new do |config|
    #   config.consumer_key        = Rails.
    #   config.consumer_secret     = "YOUR_CONSUMER_SECRET"
    #   config.access_token        = "YOUR_ACCESS_TOKEN"
    #   config.access_token_secret = "YOUR_ACCESS_SECRET"
    # end

    render :json => Rails.application.secrets.twitter_api_key
  end
end
