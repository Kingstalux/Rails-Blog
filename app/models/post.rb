class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'post_id'
  has_many :likes, class_name: 'Like', foreign_key: 'post_id'

  validates :title, presence: true, length: { in: 1..250 }
  validates :likesCounter, numericality: { greater_than_or_equal_to: 0 }
  validates :commentsCounter, numericality: { greater_than_or_equal_to: 0 }

  def self.recent_comments(id)
    Comment.where(post_id: id).limit(5)
  end

  def self.all_comments(id)
    Comment.where(post_id: id)
  end

  def self.count_post(id)
    user = User.find(id)
    user.postsCounter = Post.where(user_id: id).count
    user.save
  end
end
