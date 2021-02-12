class Comment < ApplicationRecord
  belongs_to  :gossip
  belongs_to  :parent, class_name: 'Comment', optional: true
  
  validates :body, presence: :true
end
