class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         mount_uploader :image, ImageUploader


         has_many :posts
         has_many :likes, dependent: :destroy
         has_many :liked_posts, through: :likes, source: :post
         has_many :comments, dependent: :destroy

         has_many :fotos
         has_many :fotolikes, dependent: :destroy
         has_many :fotoliked_fotos, through: :fotolikes, source: :foto
         has_many :fotocomments, dependent: :destroy


         validates :name, presence: true
         validates :profile, length: { maximum: 200 } 

         def already_liked?(post)
          self.likes.exists?(post_id: post.id)
         end    

         def already_fotoliked?(foto)
          self.fotolikes.exists?(foto_id: foto.id)
         end 
end
