class Platform < ApplicationRecord
  belongs_to :publisher
  has_many :games
end
