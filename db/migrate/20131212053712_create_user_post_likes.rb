class CreateUserPostLikes < ActiveRecord::Migration
  def change
    create_table :user_post_likes do |t|
      t.integer   :user_id, :null => false
      t.integer   :post_id, :null => false
      t.integer   :value

      t.timestamps
    end

    add_index :user_post_likes, :user_id
    add_index :user_post_likes, :post_id
    add_index(
      :user_post_likes,
      [:user_id, :post_id],
      :unique => true
    )
  end
end
