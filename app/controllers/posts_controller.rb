class PostsController < ActionController::Base
  def index
    @id = params[:user_id]
    @user = User.find(@id)
    @posts = User.all_post(@id)
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @comment = Comment.new
    @like = Like.new
  end

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.new
    render :new, locals: { post: @post }
  end

  def create
    @user = User.find(params[:user_id])
    add_post = @user.posts.new(post_params)
    add_post.commentsCounter = 0
    add_post.likesCounter = 0
    respond_to do |format|
      format.html do
        if add_post.save
          Post.count_post(params[:user_id])
          flash[:success] = 'Post created successfully'
          redirect_to user_posts_url
        else
          flash.now[:error] = 'Error: Post could not be created'
          render :new, locals: { post: add_post }
        end
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @post.destroy
    @user.postsCounter -= 1
    @user.save
    redirect_to("/users/#{current_user.id}/posts/")
    flash[:success] = 'Comment was deleted!'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
