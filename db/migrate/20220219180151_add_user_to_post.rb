class AddUserToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :AuthorId, :integer
    add_index :posts, :AuthorId
  end
end
