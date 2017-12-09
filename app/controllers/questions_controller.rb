class QuestionsController < ApplicationController
    
    def index
        @questions = Question.all
    end
    
    def new

    end
    
    def create
        # render plain: params[:question].inspect
        @question = Question.new(question_params)
        @question.save
        redirect_to @question
    end
    
    def show
        @question = Question.find(params[:id])
    end
    
    private def question_params
        params.require(:question).permit(:title, :body)
    end
    
end
