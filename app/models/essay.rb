class Essay < ApplicationRecord
  belongs_to :book, counter_cache: true
end
