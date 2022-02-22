class Comment < ApplicationRecord
    belongs_to :author, class_name: "User", foreign_key: "user_id"
    belongs_to :post, class_name: "Post", foreign_key: "post_id"

    def self.count_comments(id)
        post = Post.find(id)
        post.commentsCounter = Comment.where(post_id: id).count
        post.save
    end
end