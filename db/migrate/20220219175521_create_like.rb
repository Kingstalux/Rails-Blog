class CreateLike < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.date :UpdatedAt
      t.date :CreatedAt

      t.timestamps
    end
  end
end
