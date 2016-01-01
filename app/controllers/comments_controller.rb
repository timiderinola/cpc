class CommentsController < ApplicationController
  def create
    @message = Message.find(params[:message_id])

    if @message.comments.create(comment_params)
      redirect_to @message,
                  notice: 'Comment was successfully created.'
    else
      redirect_to @message,
                  alert: 'Error creating comment, ' + @message.errors
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @message = Message.find(params[:message_id])

    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @message, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :content, :email)
  end
end
