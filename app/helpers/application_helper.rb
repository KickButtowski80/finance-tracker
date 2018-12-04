module ApplicationHelper
    
  def stock_by_date(date)         
        UserStock.where("date(created_at) = ? and user_id = ? ", date , current_user.id)       
  end
  def start_date
     start_date = (params[:start_month] || Date.today).to_date
  end 
  def color_day(day)
    start_date 
    if (day ==  Date.current )
      "background-color:#face"
    elsif (start_date.beginning_of_month..start_date.end_of_month).include?(day)
      "background-color: #ffff"
    else
      "background-color: gray"
    end    
  end
  
  def find_notes(day)    
    #created_at = day.created_at.split(" ")[0]
    Note.where("Date(created_at)= ? and user_id= ? ",  day , current_user.id)
    # Note.includes(:user).find_by_created_at(day.to_date.all_day) 
  end
  
end