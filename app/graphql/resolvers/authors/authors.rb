module Resolvers
  module Authors
    class Authors < Resolvers::BaseResolver
      description "Finds all authors"

      type [Types::Custom::Author], null: false

      def resolve
        ::Author.all
      end
    end
  end
end
