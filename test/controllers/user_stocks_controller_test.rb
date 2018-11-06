require 'test_helper'

class UserStocksControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_stocks_create_url
    assert_response :success
  end

end
