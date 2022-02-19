class AddUserToComment < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :AuthorId, :integer
    add_index :comments, :AuthorId
  end
end
