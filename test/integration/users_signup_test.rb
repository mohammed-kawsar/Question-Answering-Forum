require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "failed singup" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, { user: { name:  "", email: "notgood@emailaddress", password:"star", password_confirmation: "wars" } }
    end
    assert_template 'users/new'
  end
  
  test "valid user signup" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, { user: { name:  "Obi-Wan Kenobi", email: "obi-wam@jedi.sw", password: "bluelightsaver", password_confirmation: "bluelightsaver" } }
    end
    follow_redirect!
    assert_template 'users/show'
  end
end
