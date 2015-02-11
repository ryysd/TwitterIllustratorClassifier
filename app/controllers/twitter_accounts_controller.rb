class TwitterAccountsController < ApplicationController
  def index
  end

  def illustrators
    if params[:format] != 'json'
      render :html => ''
      return
    end

    # followers = client.followers params[:screen_name]
    # illustrators = followers.select {|follower| (TwitterAccount.new raw_data: follower).is_illustrator?}
    illustrators = ActiveRecord::Base.connection.select("select * from dummy_data")
    render :json => illustrators
  end
end
