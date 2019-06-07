module Resolvers
  module Books
    class Book < Resolvers::BaseResolver
      description "Finds a book by ID"

      argument :id, ID, required: true

      type Types::Custom::Book, null: false

      def resolve(id:)
        ::Book.find(id)
      end
    end
  end
end
