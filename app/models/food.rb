class Food < ApplicationRecord
    belongs_to :user
    default_scope -> { order(created_at: :desc) } # 投稿が降順に表示
    mount_uploader :image, ImageUploader
    has_many :foodlikes, dependent: :destroy
    has_many :foodliked_users, through: :foodlikes, source: :user
    has_many :foodcomments, dependent: :destroy

    validates :title, presence: true
    validates :body, presence: true
end
