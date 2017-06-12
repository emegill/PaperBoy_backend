require "net/http"
require "uri"
class NewssitesController < ApplicationController


    def index

      if params[:source] === "NYT"
        uri = URI("https://api.nytimes.com/svc/news/v3/content/all/all.json")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        uri.query = URI.encode_www_form({
          "api-key" => "6543e05d957841679d17e163ef952950"
          })
        request = Net::HTTP::Get.new(uri.request_uri)
        @result = JSON.parse(http.request(request).body)


        render json: @result

      end
    end
end
