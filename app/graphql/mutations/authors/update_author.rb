module Mutations
  module Authors
    class UpdateAuthor < ::Mutations::BaseMutation
      description "Updates an author"

      argument :id, Integer, required: true
      argument :first_name, String, required: false
      argument :last_name, String, required: false
      argument :date_of_birth, String, required: false

      type Types::Custom::Author

      def resolve(id:, **attributes)
        Author.find(id).tap { |author| author.update!(attributes) }
      end
    end
  end
end
