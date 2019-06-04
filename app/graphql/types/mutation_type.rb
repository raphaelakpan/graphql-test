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
  end
end
