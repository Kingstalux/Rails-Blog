class PostsController < ActionController::Base
  def index
    @id = params[:user_id]
    @user = User.find(@id)
    @posts = User.recent_post(@id)
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end
end
