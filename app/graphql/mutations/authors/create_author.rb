module Mutations
  module Authors
    class CreateAuthor < ::Mutations::BaseMutation
      argument :first_name, String, required: true
      argument :last_name, String, required: true
      argument :date_of_birth, String, required: true

      type Types::Custom::Author

      def resolve(**attributes)
        Author.create!(attributes)
      end
    end
  end
end
