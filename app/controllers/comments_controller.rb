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

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
