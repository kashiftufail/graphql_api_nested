class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  has_many :books, dependent: :destroy

  enum :role, { user: 0, admin: 1 }, suffix: true

end
