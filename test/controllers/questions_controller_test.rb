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
end