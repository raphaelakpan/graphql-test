module Types
  class MutationType < Types::BaseObject
    # book mutations
    field :create_book, mutation: Mutations::Books::CreateBook, description: 'Creates a book for an author'
    field :update_book, mutation: Mutations::Books::UpdateBook, description: 'Updates a book'
    field :destroy_book, mutation: Mutations::Books::DestroyBook, description: 'Deletes a book'

    # author mutations
    field :create_author, mutation: Mutations::Authors::CreateAuthor, description: 'Creates an author'
    field :update_author, mutation: Mutations::Authors::UpdateAuthor, description: 'Updates an author'
    field :destroy_author, mutation: Mutations::Authors::DestroyAuthor, description: 'Deletes an author'
  end
end
