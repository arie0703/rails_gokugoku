class Beerlike < ApplicationRecord
  belongs_to :beer
  belongs_to :user

  validates_uniqueness_of :beer_id, scope: :user_id
end
