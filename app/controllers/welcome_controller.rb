require 'faraday'
require 'json'

class WelcomeController < ApplicationController
    def index
        # connection=Faraday.new('https://api.tiingo.com/tiingo/daily/AAPL/prices?startDate=2012-01-03&endDate=2014-01-03&token=https://api.tiingo.com/tiingo/daily/AAPL/prices?startDate=2012-01-03&endDate=2014-01-03&token=d61c1c8f74de5f972428979c8738b73ec3cf6b02')
        response = Faraday.get 'https://api.tiingo.com/tiingo/daily/all/prices?startDate=2012-01-03&endDate=2014-01-03&token=https://api.tiingo.com/tiingo/daily/AAPL/prices?startDate=2012-01-03&endDate=2014-01-03&token=d61c1c8f74de5f972428979c8738b73ec3cf6b02'
        response = JSON.parse(response.body)
    end
end
