module Mutations
  class CreateBook < BaseMutation
    argument :description, String, required: true
    argument :title, String, required: true

    type Types::BookType

    def resolve(description: nil, title: nil)
      Book.create!(
        description: description,
        title: title,
        user: context[:current_user]
      )
    end

  end
end
