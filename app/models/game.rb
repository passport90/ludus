class Game < ApplicationRecord
  belongs_to :platform
  belongs_to :publisher
  belongs_to :genre
  belongs_to :esrb_rating
  belongs_to :franchise
  has_and_belongs_to_many :badges

  nilify_blanks only: [:remarks, :video_link]
end
