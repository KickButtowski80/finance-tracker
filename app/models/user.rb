class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_many :user_stocks, :dependent => :destroy
         has_many :stocks, through: :user_stocks 
         has_many :friendships
         has_many :friends, through: :friendships 
         
         def full_name             
             return "#{first_name} #{last_name}".strip if first_name || last_name
             "Anonymos"
         end
         
         def stock_already_added?(ticker_symbol)
           stocks_matching_ticker = Stock.where(ticker: ticker_symbol) 
           return false unless stocks_matching_ticker.present?
           stocks.exists?(id: stocks_matching_ticker.pluck(:id))
         end
         
         def under_stock_limit?
           (user_stocks.count < 10)
         end
         
         def can_add_stock? ticker_symbol
           under_stock_limit? && !stock_already_added?(ticker_symbol)
         end
         
         def self.search(params)                
                 params.strip!
                 params.downcase!
                 to_send_back = (first_name_matches(params)+
                                 last_name_matches(params)+  
                                 email_matches(params)).uniq
                 return nil unless to_send_back
                 to_send_back             
         end
         
         
         def self.first_name_matches params
             matches("first_name", params)
         end
         
         def self.last_name_matches params
             matches("last_name", params)
         end
         
     
         
         
         
         
         def self.email_matches params
             matches("email", params)
         end
         
         def self.matches(field_name, params)
             User.where("#{field_name} like ?", "%#{params}%")
         end
         
         def except_current_user(users)
             users.reject{ |user| user.id == self.id }
         end
         
         def not_friends_with?(friend_id)
            friendships.where(friend_id: friend_id).count < 1 
         end
end
