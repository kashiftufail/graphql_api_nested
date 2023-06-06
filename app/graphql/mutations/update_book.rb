module Mutations
  class UpdateBook < BaseMutation
    description "Updates Book"

    argument :name, String, required: true
    argument :id, ID, required: true

    field :user, Types::UserType, null: false
    field :errors, [String], null: false

    def resolve(title:, description:, id:)
      book = Book.find(id)
      book.update_attributes(title: title, description: description)

      if(book.errors.blank?)
        {book: book, errors: nil}
      else
        {author: nil, errors: book.errors.full_messages}
      end
    end

  end
end
