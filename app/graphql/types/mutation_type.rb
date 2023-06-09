module Types
  class MutationType < Types::BaseObject
    field :destroy_user, mutation: Mutations::DestroyUser
    field :update_essay, mutation: Mutations::UpdateEssay
    field :create_essay, mutation: Mutations::CreateEssay
    field :create_user, mutation: Mutations::CreateUser
    field :signin_user, mutation: Mutations::SignInUser
    field :update_book, mutation: Mutations::UpdateBook
    field :create_book, mutation: Mutations::CreateBook    
  end
end
