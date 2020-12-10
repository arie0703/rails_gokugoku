class Fotocomment < ApplicationRecord
  belongs_to :user
  belongs_to :foto

  validates :fotocomment, presence: true, length: { maximum: 140 }
end
