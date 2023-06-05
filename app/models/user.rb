class User < ApplicationRecord
  has_many :books, dependent: :destroy
  validates :name, :email, presence: true
end
