class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.integer :user_id
      t.string :title
      t.string :author
      t.bigint :isbm
      t.string :item_url
      t.string :item_image_url

      t.timestamps
    end
  end
end
