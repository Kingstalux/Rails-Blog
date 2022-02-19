class AddUserToLike < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :AuthorId, :integer
    add_index :likes, :AuthorId
  end
end
