class QuestionsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]


    def index
        @question = current_user.questions.build if logged_in?
    end
    
    def new

    end
    
    def create
        @question = current_user.quiestions.build(question_params)
        if @micropost.save
          flash[:success] = "You have created a new question successfully."
          redirect_to root_url
        else
          render root_url
        end
    end
    
    def destroy
        
    end

    def show
        @question = Question.find(params[:id])
    end
    
    private def question_params
        params.require(:question).permit(:title, :body)
    end
    
end
