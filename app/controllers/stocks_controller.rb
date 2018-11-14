class StocksController < ApplicationController
  
  
 
  def search
  # respond_to do |format|
  #   if params[:stock].present?
  #     @stock = Stock.new_from_lookup(params[:stock])      
  #     if @stock       
  #         format.js {render partial: 'users/result'}       
  #     else 
  #       flash.now[:danger]= "You have entered an incorrect symbol"
  #       format.js {render partial: 'users/result'}   
  #     end
  #   else
  #     flash.now[:danger] = "You have entered an empty search string"
  #     format.js {render partial: 'users/result'}   
  #   end
  # end
  # end
  
    if params[:stock].blank?
      flash.now[:danger] = "you have entered an empty search string"
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "you have entered an incorrect symbol" unless @stock
    end
  respond_to do |format|
    format.js{render partial: 'users/result'}
  end
end


  
end


