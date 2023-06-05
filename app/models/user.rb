class User < ApplicationRecord
  has_many :books, dependent: :destroy
end
