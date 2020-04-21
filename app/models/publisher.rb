class Publisher < ApplicationRecord
  has_many :platforms
  has_many :games
end
