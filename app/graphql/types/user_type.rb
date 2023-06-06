# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :name, String, null: false
    field :books, [Types::BookType], null: true
    field :books_count, Integer
    field :email_and_name, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false    

    def email_and_name
      object.email + " " + object.name
    end
  end
end


    
  