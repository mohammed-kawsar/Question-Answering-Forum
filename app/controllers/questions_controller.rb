class QuestionsController < ApplicationController

    before_action :logged_in_user, only: [:create]

    def correct_user
     @question = Question.find_by(id: params[:id])
        unless current_user?(@question.user)
     redirect_to user_path(current_user)
        end
    end

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
          redirect_to @question
        else
          render root_url
        end
    end
    
    def destroy

        @question = Question.find(params[:id])
        @question.destroy
        redirect_to questions_path

    end

    def update
        @question = Question.find(params[:id])
        if @question.update(question_params)
          flash[:success] = "You have created a new question successfully."
          redirect_to @question
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
