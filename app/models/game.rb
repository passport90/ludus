class Game < ApplicationRecord
  belongs_to :platform
  belongs_to :publisher
  belongs_to :genre
  belongs_to :esrb_rating
end
