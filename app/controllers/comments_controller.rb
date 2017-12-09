class CommentsController < ApplicationController
    def create
    @question = Question.find(params[:question_id])
    @comment = @question.comments.create(comment_params)
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