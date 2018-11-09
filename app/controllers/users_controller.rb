class UsersController < ApplicationController
  def my_portfolio
    @user = current_user
    @user_stocks = @user.stocks
  end
  
  def my_friends
    @friendships = current_user.friends 
  end
  
  def add_friend
    
    
  end
  
  def search
    if params[:search].blank?
      flash.now[:danger] = "You have entered an empty search string"
    else      
      @users = User.search(params[:search])    
      @users = current_user.except_current_user(@users)
      flash.now[:danger] = "No users match this search criteria" if  @users.blank?
    end
    respond_to do |format|
       format.js { render partial: "friends/result"}
    end
 
  end
  
  
  
  
  def show 
    @user = User.find(params[:id])
  end
  
  def destroy
    @friend = Friendship.find(params[:id])    
    unfriended_full_name = User.find(@friend.user_id).full_name  
    @unfriended = User.where(user_id: current_user.id, friend_id: @friend.id ).first
    @unfriended.destroy!
    flash[:danger] = "You were unfriended #{unfriended_full_name}"
    redirect_to my_friends_path
    
    
  end
  
end
