module Types
  class QueryType < Types::BaseObject
    field :author, resolver: Resolvers::Authors::Author
    field :authors, resolver: Resolvers::Authors::Authors

    field :book, resolver: Resolvers::Books::Book
    field :books, function: Resolvers::Books::BooksSearch

    field :users, resolver: Resolvers::Users::Users
  end
end
