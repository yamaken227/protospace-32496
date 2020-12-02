class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      puts "aaa"
      @prototype = @comment.prototype
      redirect_to prototype_path(@comment.prototype_id)
    else
      puts "bbb"
      @prototype = @comment.prototype
      @comments = @prototype.comments
      #@prototype = @comment.prototype
      #@comments = @prototype.comments
      render "prototypes/show"
    end
  end

  private
  def comment_params
   params.require(:comment).permit(:text).merge(user_id: current_user.id , prototype_id: params[:prototype_id])
  end
end
