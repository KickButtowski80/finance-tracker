module ApplicationHelper
    
  def stock_by_date(date)      
    UserStock.where("date(created_at) = ? and user_id = ? ", date , current_user.id)  
  end
  
  def url_for_next_view
    view_context.url_for(@params.merge(start_date_param => date_range.last + 1.day))
  end
end
