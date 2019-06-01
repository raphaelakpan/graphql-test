module Mutations
  module Books
    class UpdateBook < ::Mutations::BaseMutation
      argument :id, Integer, required: true
      argument :title, String, required: false
      argument :publication_date, Integer, required: false
      argument :genre, Types::Enums::Genre, required: false

      type Types::Custom::Book

      def resolve(id:, **attributes)
        Book.find(id).tap { |book| book.update!(attributes) }
      end
    end
  end
end
