module Mutations
  module Authors
    class DestroyAuthor < ::Mutations::BaseMutation
      description "Deletes an author"

      argument :id, Integer, required: true

      type Types::Custom::Author

      def resolve(id:)
        Author.find(id).destroy
      end
    end
  end
end
