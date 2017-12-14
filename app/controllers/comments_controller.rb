class CommentsController < ApplicationController
    
    def create
      if current_user
      @comment.save
     redirect_to question_path(@question)
      else
     redirect_to "/login"
      end
     @question = Question.find(params[:question_id])
     @comment = @question.comments.create(comment_params)
     @comment.user_id = current_user.id
   
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
