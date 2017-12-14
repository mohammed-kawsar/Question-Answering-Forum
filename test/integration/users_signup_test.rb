require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "failed singup no name" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, { user: { name:  "", email: "notgood@emailaddress.com", password:"starwars", password_confirmation: "starwars" } }
    end
    assert_template 'users/new'
  end
  
  test "failed singup no email" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, { user: { name:  "Kylo Ren", email: "", password:"starwars", password_confirmation: "starwars" } }
    end
    assert_template 'users/new'
  end
  
   test "failed singup wrong email" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, { user: { name:  "Kylo Ren", email: "asdfasd@", password:"starwars", password_confirmation: "starwars" } }
    end
    assert_template 'users/new'
  end
  
  test "failed singup no password" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, { user: { name:  "KyloRen", email: "notgood@emailaddress.com", password:"", password_confirmation: "starwars" } }
    end
    assert_template 'users/new'
  end
  
   test "failed singup invalid password" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, { user: { name:  "KyloRen", email: "notgood@emailaddress.com", password:"a", password_confirmation: "starwars" } }
    end
    assert_template 'users/new'
  end
  
   test "failed singup invalid password_confirmation" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, { user: { name:  "KyloRen", email: "notgood@emailaddress.com", password:"starwars", password_confirmation: "s" } }
    end
    assert_template 'users/new'
  end
  
  test "failed singup no password_confirmation" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, { user: { name:  "KyloRen", email: "notgood@emailaddress.com", password:"starwars", password_confirmation: "" } }
    end
    assert_template 'users/new'
  end
  
  test "failed singup password and confirmation don't match" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, { user: { name:  "", email: "notgood@emailaddress.com", password:"starwars", password_confirmation: "starwars" } }
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
    assert is_logged_in?
  end
end
