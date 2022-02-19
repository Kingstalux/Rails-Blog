class AddAuthorRefToLike < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :user, null: false, foreign_key: true
    add_column :likes, :AuthorId, :integer
    add_index :likes, :AuthorId
  end
end
