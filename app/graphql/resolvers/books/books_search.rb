module Resolvers
  module Books
    class BooksSearch < BaseSearchResolver
      class BookFilter < Types::BaseInputObject
        argument :OR, [self], required: false
        argument :title_contains, String, required: false
        argument :title_equals, String, required: false
        argument :genre_equals, Types::Enums::Genre, required: false
      end

      description "Finds all books"

      scope { get_scope }

      type types[Types::Custom::Book]

      option :filter, type: BookFilter, with: :apply_filter
      option :first, type: types.Int, with: :apply_first
      option :skip, type: types.Int, with: :apply_skip

      def apply_filter(scope, value)
        branches = normalize_filters(value).reduce { |a, b| a.or(b) }
        scope.merge(branches)
      end

      def apply_first(scope, value)
        scope.limit(value)
      end

      def apply_skip(scope, value)
        scope.offset(value)
      end

      def normalize_filters(value, branches = [])
        scope = get_scope
        scope = scope.title_contains(value[:title_contains]) if value[:title_contains].present?
        scope = scope.title_equals(value[:title_equals]) if value[:title_equals].present?
        scope = scope.genre_equals(value[:genre_equals]) if value[:genre_equals].present?

        branches.push(scope)

        value[:OR].reduce(branches) { |b, v| normalize_filters(v, b) } if value[:OR].present?

        branches
      end

      def get_scope
        ::Book.all.order(:id).limit(50)
      end
    end
  end
end
