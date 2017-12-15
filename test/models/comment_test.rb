require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  
  
  def setup
    @user = users(:theRock)
    @comment = @user.comments.build(body: "Body")
  end

  test "should be valid" do
    assert @comment.valid?
  end
  
    test "there is a body" do
    @comment.body = "   "
    assert_not @comment.valid?
  end

  test "body should be at most 500 characters" do
    @comment.body = "a" * 501
    assert_not @comment.valid?
  end


  
end
