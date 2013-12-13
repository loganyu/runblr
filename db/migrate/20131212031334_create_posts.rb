class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string    :post_type,    null: false
      t.text      :title,        null: false
      t.text      :body
      t.string    :workout_type
      t.decimal   :miles
      t.integer   :hours
      t.integer   :minutes
      t.integer   :seconds
      t.date      :workout_date
      t.time      :workout_time
      t.string    :url
      t.integer   :user_id,      null: false

      t.timestamps
    end

    add_index :posts, :user_id
  end
end
