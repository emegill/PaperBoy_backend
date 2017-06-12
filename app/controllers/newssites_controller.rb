require "net/http"
require "uri"

class NewssitesController < ApplicationController


    def index

      uri = URI("https://api.nytimes.com/svc/news/v3/content/all/all.json")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  uri.query = URI.encode_www_form({
    "api-key" => "f18324e1f4af412a9dae2869f9329a95"
  })
  request = Net::HTTP::Get.new(uri.request_uri)
  @result = JSON.parse(http.request(request).body)
  puts @result.inspect
  render json: @result



    end


end
