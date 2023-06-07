module Mutations
  class DestroyUser < BaseMutation
    argument :id, Integer, required: true
    field :id, ID, null: true
    
    type Types::UserType

    def resolve(id:)
      user = User.find(id)                   
      return unless context[:current_user].admin_role?      
      if user.destroy
        { id: id }      
      end          
      
    end  
  end
end


