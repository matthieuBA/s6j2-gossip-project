class Gossip < ApplicationRecord
  # has_many :gostags
  # has_many :tags, through: :gostags
  has_many :likes
  has_many :comments
  validates :title, :content, :user_id, presence: true
end
