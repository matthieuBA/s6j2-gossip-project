class Gossip < ApplicationRecord
  has_many :gostags
  has_many :tags, through: :gostags
  validates :title, :content, :user_id,presence: true
end
