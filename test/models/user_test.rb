require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
     @user = User.new(name: "Jeroen Keppens", email: "jeroen@keppens.com",  password: "labprojectrocks", password_confirmation: "labprojectrocks")
  end
  
  test "testing valid users" do
    assert @user.valid?
  end
  
  # Email Tests
  test "test email presence" do
    @user.email = "     "
    assert_not @user.valid?
  end
  
    test "test for an email that's too long" do
    @user.email = "elonmusk" * 31 + "@teslamotors.com"
    assert_not @user.valid?
  end
  
    test "test for valid emails." do
    valid_addresses = %w[alex@franch.com WONJOON@seol.COM FCB_BN-Alex@mohammed.org.co.uk
                         john.johnson@jizera.ck ]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} is valid email"
    end
  end
  
  test " invalid addresses" do
    invalid_addresses = %w[mohammed@ jakub.jez@jake,sje alex alex.alex.alex@gmail.com,se ]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} is invalid email"
    end
  end
  
  test "test emails should be saves as lower case" do
    testedEmail = "PaeLLa@MediTerraNiA.COM"
    @user.email = testedEmail
    @user.save
    assert_equal testedEmail.downcase, @user.reload.email
  end
  
  test "test unique email address" do
    user2 = @user.dup
    user2.email = @user.email.upcase
    @user.save
    assert_not user2.valid?
  end
  

  
  # Name Tests
  test "test name presence" do
    @user.name = ""
    assert_not @user.valid?
  end
  
  test "test for a name that's too long" do
    @user.name = "footballclubbarcelonaisthebestteamintheworld"
    assert_not @user.valid?
  end

  # Passwords Test
  
  test "test password is larger than 6 characters" do
    @user.password = "a" * 5
    @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "test there is a password" do
    @user.password = " " * 6
    @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end
end