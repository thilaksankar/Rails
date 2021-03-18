class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_and_belongs_to_many :read_posts, class_name: "Post", join_table: 'table_posts_users_read_statuses'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

