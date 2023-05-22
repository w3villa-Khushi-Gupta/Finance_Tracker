require 'finnhub_ruby'

class Stock < ApplicationRecord
    def self.new_lookup(ticker_symbol)
        FinnhubRuby.configure do |config|
            config.api_key['api_key'] = Rails.application.credentials.iex_client[:finnhub_api_key]
        end       

        client = FinnhubRuby::DefaultApi.new
        
        begin
            new(ticker: ticker_symbol,name: client.company_profile2({symbol: ticker_symbol}).name, last_price: client.quote(ticker_symbol).c)
        rescue => exception
            return nil
        end

    end
end
