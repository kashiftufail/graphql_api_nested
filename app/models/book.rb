class Book < ApplicationRecord
  belongs_to :user, counter_cache: true
  has_many :essays, dependent: :destroy
end
