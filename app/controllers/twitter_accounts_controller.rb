require "oauth"

class TwitterAccountsController < ApplicationController
  def index
  end

  def illustrators
    start = Time.now
    followers = client.followers params[:screen_name]
    time = Time.now - start
    respond_to do |format|
        format.json {render :json => time} 
    end
  end
end
