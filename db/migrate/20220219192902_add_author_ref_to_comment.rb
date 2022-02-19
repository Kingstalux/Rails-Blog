class AddAuthorRefToComment < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :user, null: false, foreign_key: true
    add_column :comments, :AuthorId, :integer
    add_index :comments, :AuthorId
  end
end
