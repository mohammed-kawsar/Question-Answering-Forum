require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

  def setup
    @user = users(:theRock)
    @question = @user.questions.build(title: "Title", body: "Body")
  end

  test "should be valid" do
    assert @question.valid?
  end

  test "there is user id" do
    @question.user_id = nil
    assert_not @question.valid?
  end
  
    test "there is a title" do
    @question.title = "   "
    assert_not @question.valid?
  end
  
    test "there is a body" do
    @question.body = "   "
    assert_not @question.valid?
  end

  test "body should be at most 500 characters" do
    @question.body = "a" * 501
    assert_not @question.valid?
  end
  
   test "title should be at most 150 characters" do
    @question.title = "a" * 151
    assert_not @question.valid?
  end

   test "Questions are in chronological order." do
    assert_equal questions(:most_recent), Question.first
  end
  
end