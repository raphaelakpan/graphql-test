module Resolvers
  module Books
    class BooksSearch < BaseSearchResolver
      description "Finds all books"

      scope { ::Book.all }

      # type types[Types::Custom::Book]
      type types[Types::Custom::Book]

      option :title, type: types.String, with: :filter_by_title

      def filter_by_title(scope, value)
        scope.where(title: value)
      end
    end
  end
end
