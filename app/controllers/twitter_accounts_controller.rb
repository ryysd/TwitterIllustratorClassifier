class TwitterAccountsController < ApplicationController
  def index
  end

  def illustrators
    if params[:format] != 'json'
      render :html => ''
      return
    end

    begin
      follower_ids = client.follower_ids params[:screen_name]
      followers = (client.users follower_ids.to_a).map {|raw_data| TwitterAccount.new raw_data: raw_data} 
    rescue Twitter::Error::TooManyRequests => error
      render :json => error
      return
    end

    # followers = client.followers params[:screen_name]
    illustrators = followers.select {|follower| follower.is_illustrator?}
    # illustrators = ActiveRecord::Base.connection.select("select * from dummy_data")
    render :json => illustrators
  end
end
