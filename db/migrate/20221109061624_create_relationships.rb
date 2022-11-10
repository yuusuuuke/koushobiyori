class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.integer :follower_id#フォローされているユーザのid
      t.integer :followed_id#フォローしているユーザのid

      t.timestamps
    end
  end
end
