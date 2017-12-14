class QuestionsController < ApplicationController
    before_action :logged_in_user, only: [:create]
    before_action :current_user, only: [:edit, :update, :destroy]

    def index
        @questions = Question.all
    end
    
    def new
        @question = current_user.questions.build
    end
    
    def create
        @question = current_user.questions.build(question_params)
        if @question.save
          flash[:success] = "You have created a new question successfully."
          redirect_to root_url
        else
          render root_url
        end
    end
    
    def destroy
        @question = Question.find(params[:id])
        
        @question.destory
        # redirect_to request.referrer || root_url
        redirect_to questions_url
    end

    def updated
        @question = Question.find(params[:id])

        if @question.update(question_params)
          flash[:success] = "You have created a new question successfully."
          redirect_to questions_path
        else
          render 'edit'
        end        
    end
    
    def edit
        @question = Question.find(params[:id])
    end
    
    def show
        @question = Question.find(params[:id])
    end
    
    private def question_params
        params.require(:question).permit(:title, :body)
    end
    
end
