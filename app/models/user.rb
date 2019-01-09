class User < ApplicationRecord
  has_secure_password
  attr_accessor :current_password
  validates :email, presence: true, uniqueness: true

  has_many :tasks, dependent: :destroy
  has_many :categories, dependent: :destroy
end
