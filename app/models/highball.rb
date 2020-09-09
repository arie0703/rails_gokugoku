class Highball < ApplicationRecord
    belongs_to :user
    default_scope -> { order(created_at: :desc) } # 投稿が降順に表示
    mount_uploader :image, ImageUploader
    has_many :highlikes, dependent: :destroy
    has_many :highliked_users, through: :highlikes, source: :user
    has_many :highcomments, dependent: :destroy

    validates :title, presence: true
    validates :product, presence: true
    validates :maker, presence: true
    validates :rate, presence: true
    validates :alcohol, presence: true
    validates :body, presence: true
end
