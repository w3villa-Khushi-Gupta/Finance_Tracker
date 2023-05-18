class StocksController < ApplicationController
    
    def search
        binding.pry
        stock = Stock.new_lookup(params[:stock])
        binding.pry
        render json: stock
        binding.pry
    end

end