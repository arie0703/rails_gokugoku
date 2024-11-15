class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:twitter]

         mount_uploader :image, ImageUploader

         has_many :relationships
         has_many :followings, through: :relationships, source: :follow
         has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy
         has_many :followers, through: :reverse_of_relationships, source: :user

         def follow(other_user)
           unless self == other_user
            self.relationships.find_or_create_by(follow_id: other_user.id)
           end
         end
        
         def unfollow(other_user)
            relationship = self.relationships.find_by(follow_id: other_user.id)
            relationship.destroy if relationship
         end
        
         def following?(other_user)
           self.followings.include?(other_user)
         end


         #apiログイン用
         def self.from_omniauth(auth)
          find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |user|
            user.provider = auth["provider"]
            user.uid = auth["uid"]
            user.name = auth["info"]["nickname"]
            user.image = auth["info"]["image"]
          end
        end
      
        def self.new_with_session(params, session)
          if session["devise.user_attributes"]
            new(session["devise.user_attributes"]) do |user|
              user.attributes = params
            end
          else
            super
          end
        end


         has_many :posts
         has_many :likes, dependent: :destroy
         has_many :liked_posts, through: :likes, source: :post
         has_many :comments, dependent: :destroy


         validates :name, presence: true, length: { maximum: 15 } 
         validates :profile, length: { maximum: 200 } 

         def already_liked?(post)
          self.likes.exists?(post_id: post.id)
         end
end
