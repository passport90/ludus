class Game < ApplicationRecord
  belongs_to :platform
  belongs_to :publisher
  belongs_to :genre
  belongs_to :esrb_rating
  has_and_belongs_to_many :badges
end
