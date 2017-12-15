require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @question = questions(:one)
  end

  test "redirect to create if not logged in" do
    assert_no_difference 'Question.count' do
      post questions_path, { question: { title: "GI JOE", body: "This is the body." } }
    end
    assert_redirected_to login_url
  end

  test "redirect to destroy when not logged in  " do
    assert_no_difference 'Question.count' do
      delete question_path(@question)
    end
    assert_redirected_to login_url
  end
  
  test "redirect destroy for a wrong question" do
    log_in_as(users(:theRock))
    question = questions(:five)
    assert_no_difference 'Question.count' do
      delete question_path(question)
    end
    assert_redirected_to login_url
  end
end