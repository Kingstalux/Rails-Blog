class LikesController < ActionController::Base
    def create
        post = Post.find(params[:post_id])
        user = User.find(params[:user_id])
        like = Like.new(post: post, author: user)
        if like.save
            Like.count_likes(post.id)
          flash[:success] = 'Your comment has been added!'
          redirect_to user_post_path(user.id, post.id)
        else
          flash.now[:error] = 'Comment could not be added'
          render user_post_path
        end
      end
  end
  