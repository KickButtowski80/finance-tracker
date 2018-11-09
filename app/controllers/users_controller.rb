class UsersController < ApplicationController
  def my_portfolio
    @user = current_user
    @user_stocks = @user.stocks
  end
  
  def my_friends
    @friendships = current_user.friends 
  end
  
  def add_friend
    friend = User.find(params[:friend])
    
    # or
    
    # current_user.friendships.build friend_id: @friend.id
    # if current_user.save
      
      
    if Friendship.create!( user_id: params[:user], friend_id: params[:friend])
      flash[:success] = "#{friend.full_name} now is friend with you"
    else
      flash[:danger] = "There was something wrong with the friend request"
    end
    redirect_to my_friends_path 
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
    @user_stocks = @user.stocks
  end
  
  def destroy
    # @friendship = current_user.friendships.wehre(friend_id: params[:id]).first
    # or
     @friendship = Friendship.where(friend_id: params[:id]).first  
     unfriended_full_name = User.find(params[:id]).full_name   
     if  @friendship.destroy
      flash[:notice] = "You unfriended #{unfriended_full_name}"
     else
       flash[:danger] = "Something went wrong during unfriending #unfriended_full_name}"
     end
      redirect_to my_friends_path
   
  end
  
end
