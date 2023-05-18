require 'finnhub_ruby'

class Stock < ApplicationRecord
    def self.new_lookup(ticker_symbol)
        FinnhubRuby.configure do |config|
            config.api_key['api_key'] = Rails.application.credentials.iex_client[:finnhub_api_key]
        end       

        client = FinnhubRuby::DefaultApi.new

        client.quote(ticker_symbol).c

    end
end
