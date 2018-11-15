module ApplicationHelper
    
  def stock_by_date(date)      
    UserStock.includes(:user, :stock ).where("date(created_at) = ? and user_id = ? ", date , current_user.id)  
  end
 
end
