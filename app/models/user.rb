class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :posts
         has_many :likes, dependent: :destroy
         has_many :liked_posts, through: :likes, source: :post
         has_many :comments, dependent: :destroy

         validates :name, presence: true
         validates :profile, length: { maximum: 200 } 

         def already_liked?(post)
          self.likes.exists?(post_id: post.id)
         end
end
