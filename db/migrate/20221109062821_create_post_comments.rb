class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|
      t.integer :review_id
      t.integer :user_id
      t.text :comment, null: false

      t.timestamps
    end
  end
end
