class User < ApplicationRecord
  has_many :gossips
  belongs_to :city, optional: true

  has_secure_password
  
  before_save { self.email = email.downcase }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }
end
