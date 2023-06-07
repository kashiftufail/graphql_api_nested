module Mutations
  class CreateEssay < BaseMutation
    argument :detail, String, required: true
    argument :heading, String, required: true
    argument :book_id, Integer, required: true

    type Types::EssayType

    def resolve(detail: nil, heading: nil, book_id:)      
      Essay.create!(
        detail: detail,
        heading: heading,
        book_id: book_id        
      )
    end
  end
end
