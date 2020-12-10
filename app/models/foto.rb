class Foto < ApplicationRecord
    acts_as_taggable
    belongs_to :user
    default_scope -> { order(created_at: :desc) } # 投稿が降順に表示
    mount_uploader :image, ImageUploader
    has_many :fotolikes, dependent: :destroy
    has_many :fotoliked_users, through: :fotolikes, source: :user
    has_many :fotocomments, dependent: :destroy

    validates :title, presence: true, length: { maximum: 20 }
    validates :image, presence: true
    validates :body, presence: true, length: { maximum: 140 }
end
