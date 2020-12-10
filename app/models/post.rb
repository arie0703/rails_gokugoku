class Post < ApplicationRecord
    acts_as_taggable
    belongs_to :user
    default_scope -> { order(created_at: :desc) } # 投稿が降順に表示
    mount_uploader :image, ImageUploader
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy

    validates :title, presence: true, length: { maximum: 20 }
    validates :product, presence: true, length: { maximum: 20 }
    validates :maker, presence: true, length: { maximum: 20 }
    validates :rate, presence: true
    validates :alcohol, presence: true
    validates :body, presence: true, length: { maximum: 140 }

end