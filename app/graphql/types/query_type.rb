module Types
  class QueryType < Types::BaseObject
    field :author, resolver: Queries::Authors::Author
    field :authors, resolver: Queries::Authors::Authors

    field :book, resolver: Queries::Books::Book
    field :books, resolver: Queries::Books::Books

    field :users, resolver: Queries::Users::Users
  end
end
