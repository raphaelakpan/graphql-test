module Queries
  module Books
    class Books < Queries::BaseQuery
      description "Finds all books"

      type [Types::Custom::Book], null: false

      def resolve
        ::Book.all
      end
    end
  end
end
