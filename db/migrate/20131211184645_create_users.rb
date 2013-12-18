class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username,             :null => false
      t.string :email,                :null => false
      t.string :password_digest
      t.string :session_token
      t.string :password_reset_token
      t.boolean :has_profile_picture

      t.timestamps
    end
  end
end
