module Mutations
  class UpdateBook < BaseMutation
    description "Updates Book"

    argument :title, String, required: true
    argument :description, String, required: true
    argument :id, ID, required: true

    field :book, Types::BookType, null: true
    field :errors, [String], null: true

    def resolve(title:, description:, id:)
      book = Book.find(id)       
      return if book.user != context[:current_user]               
      
      book.update(title: title, description: description)        
      if (book.errors.blank?)
        { book: book, errors: nil }
      else        
        { book: nil, errors: book.errors.full_messages }
      end
    end

  end
end
