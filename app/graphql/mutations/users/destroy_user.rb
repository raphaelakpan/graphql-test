module Mutations
  module Users
    class DestroyUser < Mutations::BaseMutation
      description "Deletes a user"

      argument :id, ID, required: true

      type Types::Custom::User

      def resolve(id:)
        User.find(id).destroy
      end
    end
  end
end
