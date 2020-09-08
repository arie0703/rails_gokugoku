class Food < ApplicationRecord
    belongs_to :user
    default_scope -> { order(created_at: :desc) } # 投稿が降順に表示
    mount_uploader :image, ImageUploader

    validates :title, presence: true
    validates :body, presence: true
end
