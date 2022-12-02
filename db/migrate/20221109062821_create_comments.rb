class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :review_id
      t.integer :user_id
      t.text :comment, null: false
      t.decimal :score, precision: 5, scale: 3
      t.decimal :magnitude, precision: 5, scale: 3

      t.timestamps
    end
  end
end
