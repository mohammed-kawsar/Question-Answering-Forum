require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  
  test "new login" do
    get :new
    assert_response :success
  end

end
