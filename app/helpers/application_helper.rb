module ApplicationHelper
    
  def stock_by_date(date)      
    UserStock.includes(:user, :stock ).where("date(created_at) = ? and user_id = ? ", date , current_user.id)  
  end
  
  def color_day(day)
    start_date = (params[:start_month] || Date.today).to_date
    if (day ==  Date.current )
      "background-color:#face"
    elsif (start_date.beginning_of_month..start_date.end_of_month).include?(day)
      "background-color: #ffff"
    else
      "background-color: gray"
    end
    
  end
  
end
