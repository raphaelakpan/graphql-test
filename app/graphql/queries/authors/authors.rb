module Queries
  module Authors
    class Authors < Queries::BaseQuery
      description "Finds all authors"

      type [Types::Custom::Author], null: false

      def resolve
        ::Author.all
      end
    end
  end
end
