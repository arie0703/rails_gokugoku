class Fotolike < ApplicationRecord
  belongs_to :user
  belongs_to :foto

  validates_uniqueness_of :foto_id, scope: :user_id
end
