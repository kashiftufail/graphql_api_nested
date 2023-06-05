# frozen_string_literal: true

module Types
  class EssayType < Types::BaseObject
    field :id, ID, null: false
    field :heading, String
    field :detail, String
    field :book_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
