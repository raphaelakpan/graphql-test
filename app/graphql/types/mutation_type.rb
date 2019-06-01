module Types
  class MutationType < Types::BaseObject
    field :create_book, mutation: Mutations::Books::CreateBook, description: 'Creates a book for an author'
    field :update_book, mutation: Mutations::Books::UpdateBook, description: 'Updates a book'
    field :destroy_book, mutation: Mutations::Books::DestroyBook, description: 'Deletes a book'
  end
end
