module Mutations
  class UpdateEssay < BaseMutation
    description "Updates Essay"

    argument :heading, String, required: true
    argument :detail, String, required: true
    argument :id, ID, required: true

    field :essay, Types::EssayType, null: true
    field :errors, [String], null: true

    def resolve(heading:, detail:, id:)
      essay = Essay.find(id)       
      return if essay.book.user != context[:current_user]               
      
      essay.update(heading: heading, detail: detail)        
      if (essay.errors.blank?)
        { essay: essay, errors: nil }
      else        
        { essay: nil, errors: essay.errors.full_messages }
      end
    end
  end
end
