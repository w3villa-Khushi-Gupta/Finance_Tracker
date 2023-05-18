class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    # require 'net/http'

    # url = URI.parse('https://api.tiingo.com/api/test?token=d61c1c8f74de5f972428979c8738b73ec3cf6b02')

    # http = Net::HTTP.new(url.host, url.port)
    # http.use_ssl = true

    # request = Net::HTTP::Get.new(url.request_uri)
    # request['Content-Type'] = 'application/json'

    # response = http.request(request)
    # puts response.body

end
