class ApplicationController < ActionController::Base
  protect_from_forgery

  def get_facebook_data(victim, type, access_token)
    if type == nil
      logger.ap ["https://graph.facebook.com/#{victim}", :params => { :access_token => access_token }]
      response = RestClient.get "https://graph.facebook.com/#{victim}", :params => { :access_token => access_token }
    else
      logger.ap ["https://graph.facebook.com/#{victim}/#{type}", :params => { :access_token => access_token }]
      response = RestClient.get "https://graph.facebook.com/#{victim}/#{type}", :params => { :access_token => access_token }
    end
    return JSON.parse(response.body)
  end

  def get_locations(long_lat, access_token)
    response = RestClient.get "https://graph.facebook.com/search", :params => {
      :type => "place",
      :center => long_lat,
      :distance => "1000", # in meters
      :access_token => access_token
    }
    return JSON.parse(response.body)
  end
end
