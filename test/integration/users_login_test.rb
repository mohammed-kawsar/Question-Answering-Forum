require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
    
    def setup
        @user = users(:theRock)
    end

  test "login with empty email and password" do
    get login_path
    assert_template 'sessions/new'
    post login_path, { session: { email: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
  end
  
   test "login with email and password not in database" do
    get login_path
    assert_template 'sessions/new'
    post login_path, { session: { email: "adsfdasfaf@gmail.com", password: "VGBVdlsbejd" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
  end
  
  test "correct login and logout" do
    get login_path
    post login_path, { session: { email: @user.email, password: 'letitgoletitgo' } }
    
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
  end
end