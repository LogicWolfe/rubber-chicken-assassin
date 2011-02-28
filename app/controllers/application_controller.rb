class ApplicationController < ActionController::Base
  protect_from_forgery

  def get_facebook_data(victim, type, access_token)
    if type == nil
      url = "https://graph.facebook.com/#{victim}"      
    else
      url = "https://graph.facebook.com/#{victim}/#{type}"
    end
    response = fb_req(url, { :access_token => access_token })
    return JSON.parse(response.body)
  end

  def get_locations(long_lat, access_token)
    response = fb_req("https://graph.facebook.com/search", {
      :type => "place",
      :center => long_lat,
      :distance => "1000", # in meters
      :access_token => access_token
    })
    return JSON.parse(response.body)
  end

  def fb_req(url, params)
    logger.info "FB_REQ_URL: #{url}?#{params.map{|key,val| "#{key}=#{val}"}.join('&')}"
    return RestClient.get url, :params => params
  end
end