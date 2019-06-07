module Resolvers
  module Authors
    class Author < Resolvers::BaseResolver
      description "Finds an author by ID"

      argument :id, ID, required: true

      type Types::Custom::Author, null: false

      def resolve(id:)
        ::Author.find(id)
      end
    end
  end
end
