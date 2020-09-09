class Highlike < ApplicationRecord
  belongs_to :highball
  belongs_to :user

  validates_uniqueness_of :highball_id, scope: :user_id
end
