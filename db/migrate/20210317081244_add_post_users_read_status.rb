class AddPostUsersReadStatus < ActiveRecord::Migration[6.1]
  def change
    create_table :post_users_read_status do |t|
      t.references :post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
  end
end
