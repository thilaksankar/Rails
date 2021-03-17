class CreateTablePostsUsersReadStatus < ActiveRecord::Migration[6.1]
  def change
    create_table :table_posts_users_read_statuses do |t|
      t.references :post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
