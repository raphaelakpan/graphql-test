module Mutations
  module Authors
    class DestroyAuthor < ::Mutations::BaseMutation
      argument :id, Integer, required: true

      type Types::Custom::Author

      def resolve(id:)
        Author.find(id).destroy
      end
    end
  end
end
