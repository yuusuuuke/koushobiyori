class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :book_id
      t.text :comment, null: false
      t.boolean :status, default: "true"
      t.decimal :score, precision: 5, scale: 3
      t.decimal :magnitude, precision: 5, scale: 3
      t.timestamps
    end
  end
end
