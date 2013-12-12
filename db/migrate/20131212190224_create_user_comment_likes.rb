class CreateUserCommentLikes < ActiveRecord::Migration
  def change
    create_table :user_comment_likes do |t|
      t.integer   :user_id
      t.integer   :comment_id
      t.integer   :value

      t.timestamps
    end

    add_index :user_comment_likes, :user_id
    add_index :user_comment_likes, :comment_id
    add_index(
      :user_comment_likes,
      [:user_id, :comment_id],
      :unique => true
    )
  end
end
