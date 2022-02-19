class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :Name
      t.string :Photo
      t.string :Bio
      t.date :UpdatedAt
      t.date :CreatedAt
      t.integer :PostsCounter

      t.timestamps
    end
  end
end
