module Types
  class QueryType < Types::BaseObject
    field :authors, [Types::Custom::Author], null: false do
      description 'Find all authors'
    end

    field :author, Types::Custom::Author, null: false do
      description 'Find a author by ID'
      argument :id, ID, required: true
    end

    field :books, [Types::Custom::Book], null: false do
      description 'Find all authors'
    end

    field :book, Types::Custom::Book, null: false do
      description 'Find a author by ID'
      argument :id, ID, required: true
    end

    def authors
      Author.all
    end

    def author(id:)
      Author.find(id)
    end

    def books
      Book.all
    end

    def book(id:)
      Book.find(id)
    end
  end
end
