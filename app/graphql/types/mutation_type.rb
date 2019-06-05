module Types
  class MutationType < Types::BaseObject
    # book mutations
    field :create_book, mutation: Mutations::Books::CreateBook
    field :update_book, mutation: Mutations::Books::UpdateBook
    field :destroy_book, mutation: Mutations::Books::DestroyBook

    # author mutations
    field :create_author, mutation: Mutations::Authors::CreateAuthor
    field :update_author, mutation: Mutations::Authors::UpdateAuthor
    field :destroy_author, mutation: Mutations::Authors::DestroyAuthor

    # user mutations
    field :create_user, mutation: Mutations::Users::CreateUser
    field :signin_user, mutation: Mutations::Users::SigninUser
    field :update_user, mutation: Mutations::Users::UpdateUser
    field :destroy_user, mutation: Mutations::Users::DestroyUser
  end
end
