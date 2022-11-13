class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.integer :read_status_id, default: 1
      t.integer :category_id
      t.string :title
      t.string :author
      t.bigint :isbn
      t.string :item_url
      t.string :item_image_url
      t.timestamps
    end
  end
end
