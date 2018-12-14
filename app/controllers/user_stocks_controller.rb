class UserStocksController < ApplicationController
  def create
    stock = Stock.find_by_ticker(params[:stock_ticker])
   # debugger
    # if stock.blank?
      stock = Stock.new_from_lookup(params[:stock_ticker])
      # stock.save  
      # DateTime.current.in_time_zone(@current_user.time_zone).to_s.to_datetime.strftime("%F %T")
      
      # stock.created_at =   DateTime.current.in_time_zone(@current_user.time_zone).strftime("%F %T")
      # stock.updated_at =   DateTime.current.in_time_zone(@current_user.time_zone).strftime("%F %T")
      stock.save!
    # end   
      
    @user_stock = UserStock.create(user: current_user, stock: stock)  
    # binding.pry
    # @user_stock.update!(Date created_at: Time.current)
    flash[:success] = "Stock #{@user_stock.stock.name} was successfully added to portfolio at #{@user_stock.created_at}"
    redirect_to my_portfolio_path
  end
  
  def destroy
    stock = Stock.find(params[:id])
    @user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id ).first
    @user_stock.destroy
    flash[:notice] = " #{stock.name} was successfully was removed from the portfolio " 
    redirect_to my_portfolio_path      
  end
end
