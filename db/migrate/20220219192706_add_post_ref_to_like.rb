class AddPostRefToLike < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :post, null: false, foreign_key: true
    add_column :likes, :PostId, :integer
    add_index :likes, :PostId
  end
end
