class Post < ApplicationRecord
    belongs_to :author, class_name: "User", foreign_key: "user_id"
    has_many :comments, class_name: "Comment", foreign_key: "post_id"
    has_many :likes, class_name: "Like", foreign_key: "post_id"
end