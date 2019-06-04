module Queries
  module Books
    class Book < Queries::BaseQuery
      description "Finds a book by ID"

      argument :id, ID, required: true

      type Types::Custom::Book, null: false

      def resolve(id:)
        ::Book.find(id)
      end
    end
  end
end
