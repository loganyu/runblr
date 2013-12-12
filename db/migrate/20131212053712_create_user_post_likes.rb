class CreateUserPostLikes < ActiveRecord::Migration
  def change
    create_table :user_post_likes do |t|
      t.integer   :user_id
      t.integer   :post_id
      t.integer   :value

      t.timestamps
    end
  end
end
