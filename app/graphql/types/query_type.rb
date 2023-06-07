module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :books, [Types::BookType], null: true
    field :users, [Types::UserType], null: true
    
    def users
      User.includes(:books)
    end

    def books      
      Book.includes(:essays, :user)
    end

    # /user/:id
    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    field :book, Types::BookType, null: false do
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end    

    def book(id:)
      Book.find(id)
    end

  end
end
