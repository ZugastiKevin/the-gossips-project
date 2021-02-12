class Gossip < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments
  validates :title, length: { in: 3..14 }
  validates :content, presence: true
end
