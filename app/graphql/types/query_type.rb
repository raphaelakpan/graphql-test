module Types
  class QueryType < Types::BaseObject
    field :author, resolver: Queries::Authors::Author
    field :authors, resolver: Queries::Authors::Authors

    field :books, [Types::Custom::Book], null: false do
      description 'Find all authors'
    end

    field :book, Types::Custom::Book, null: false do
      description 'Find a author by ID'
      argument :id, ID, required: true
    end


    def books
      Book.all
    end

    def book(id:)
      Book.find(id)
    end
  end
end
