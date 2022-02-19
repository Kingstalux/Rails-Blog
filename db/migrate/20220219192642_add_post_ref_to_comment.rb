class AddPostRefToComment < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :post, null: false, foreign_key: true
    add_column :comments, :PostId, :integer
    add_index :comments, :PostId
  end
end
