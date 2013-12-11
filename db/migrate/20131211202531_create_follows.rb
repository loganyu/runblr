class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :runner_followee_id,   :null => false
      t.integer :runner_follower_id,   :null => false

      t.timestamps
    end

    add_index :follows, :runner_followee_id
    add_index :follows, :runner_follower_id
    add_index(
      :follows,
      [:runner_followee_id, :runner_follower_id],
      :unique => true
    )

  end
end
