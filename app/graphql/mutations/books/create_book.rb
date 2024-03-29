module Mutations
  module Books
    class CreateBook < ::Mutations::BaseMutation
      description "Creates a book for an author"

      argument :title, String, required: true
      argument :author_id, Integer, required: true
      argument :publication_date, Integer, required: true
      argument :genre, Types::Enums::Genre, required: true

      type Types::Custom::Book

      def resolve(author_id:, **attributes)
        Author.find(author_id).books.create!(attributes)
      end
    end
  end
end
