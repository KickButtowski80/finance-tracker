require 'test_helper'
require 'timecop'
# <Stock id: 1, ticker: "A", name: "Agilent Technologies Inc.", last_price: 0.6918e2, created_at: "2018-11-26 20:50
# :48", updated_at: "2018-11-26 20:50:48">  
class ApplicationHelperTest < ActionView::TestCase
include Devise::Test::ControllerHelpers
  setup do
    @user = User.create! first_name: "Admin" , last_name: "SAM" , email: "admin@example.com", password: "password"
    #   sign_in @user
      @user_stock = UserStock.create(user_id: @user.id, created_at: '10-11-2018 03:05:00 -0500')
  end

  test 'database should retreive the correct value when in different time zone' do
    date = DateTime.parse('10-10-2018 03:05:00 -0500')
    Timecop.freeze('10-10-2018 10:05:00 -0800')
    assert_equal stock_by_date('10-11-2018 10:05:00 -0800', @user).all.first, @user_stock
                 
  end
end