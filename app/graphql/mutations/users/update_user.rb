module Mutations
  module Users
    class UpdateUser < Mutations::BaseMutation
      description "Updates a user"

      argument :id, ID, required: true
      argument :name, String, required: false
      argument :email, String, required: false
      argument :password, String, required: false
      argument :password_confirmation, String, required: false

      type Types::Custom::User

      def resolve(id:, **arguments)
        User.find(id).tap { |user| user.update!(arguments) }
      end
    end
  end
end
