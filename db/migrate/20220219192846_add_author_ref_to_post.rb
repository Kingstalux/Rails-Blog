class AddAuthorRefToPost < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :user, null: false, foreign_key: true
    add_column :posts, :AuthorId, :integer
    add_index :posts, :AuthorId
  end
end
