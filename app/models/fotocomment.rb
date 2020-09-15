class Fotocomment < ApplicationRecord
  belongs_to :user
  belongs_to :foto
end
