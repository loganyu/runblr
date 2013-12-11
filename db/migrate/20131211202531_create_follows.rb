class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.string :runner_followee_id,   :null => false
      t.string :runner_follower_id,   :null => false

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
