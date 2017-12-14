class CommentsController < ApplicationController
before_action :correct_user, only: [:edit, :update, :destroy]

    def correct_user
        @comment = Comment.find_by(id: params[:id])
        unless current_user?(@comment.user)
          redirect_to user_path(current_user)
        end
    end
    
    def create
         @question = Question.find(params[:question_id])
         @comment = @question.comments.create(comment_params)
         @comment.user_id = current_user.id
         @comment.save
         redirect_to question_path(@question)
    end
     
    def destroy
         @question = Question.find(params[:question_id])
         @comment = @question.comments.find(params[:id])
         @comment.destroy
         redirect_to question_path(@question)
    end
 
    private def comment_params
         params.require(:comment).permit(:body)
    end
end
