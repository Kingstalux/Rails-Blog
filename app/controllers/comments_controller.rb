class CommentsController < ActionController::Base
  def create
    post = Post.find(params[:post_id])
    user = User.find(params[:user_id])
    comment = Comment.new(post: post, author: user, text: comment_params['text'])
    if comment.save
      Comment.count_comments(post.id)
      flash[:success] = 'Your comment has been added!'
      redirect_to user_post_path(user.id, post.id)
    else
      flash.now[:error] = 'Comment could not be added'
      render user_post_path
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    @post.commentsCounter -= 1
    @post.save
    redirect_to("/users/#{current_user.id}/posts/#{@post.id}")
    flash[:success] = 'Comment was deleted!'
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
