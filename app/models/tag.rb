class Tag < ApplicationRecord
  has_many :gostags
  has_many :gossips, through: :gostags
end
