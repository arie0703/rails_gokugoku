class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         mount_uploader :image, ImageUploader


         has_many :posts
         has_many :likes, dependent: :destroy
         has_many :liked_posts, through: :likes, source: :post
         has_many :like_posts, through: :likes, source: :post
         has_many :comments, dependent: :destroy

         has_many :beers
         has_many :beerlikes, dependent: :destroy
         has_many :beerliked_beers, through: :beerlikes, source: :beer
         has_many :beercomments, dependent: :destroy


         has_many :highballs
         has_many :highlikes, dependent: :destroy
         has_many :highliked_highballs, through: :highlikes, source: :highball
         has_many :highcomments, dependent: :destroy

         has_many :foods
         has_many :foodlikes, dependent: :destroy
         has_many :foodliked_foods, through: :foodlikes, source: :food
         has_many :foodcomments, dependent: :destroy


         validates :name, presence: true
         validates :profile, length: { maximum: 200 } 

         def already_liked?(post)
          self.likes.exists?(post_id: post.id)
         end    
         
         def already_beerliked?(beer)
          self.beerlikes.exists?(beer_id: beer.id)
         end    

         def already_highliked?(highball)
          self.highlikes.exists?(highball_id: highball.id)
         end 

         def already_foodliked?(food)
          self.foodlikes.exists?(food_id: food.id)
         end 
end
