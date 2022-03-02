class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :posts, class_name: 'Post', foreign_key: 'user_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'user_id'
  has_many :likes, class_name: 'Like', foreign_key: 'user_id'

  validates :name, presence: true
  validates :postsCounter, numericality: { greater_than_or_equal_to: 0 }

  def self.recent_post(id)
    Post.where(user_id: id).limit(3)
  end

  def self.all_post(id)
    Post.where(user_id: id)
  end
end
