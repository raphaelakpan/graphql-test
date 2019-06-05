module Mutations
  module Users
    class CreateUser < Mutations::BaseMutation
      description "Creates a user"

      argument :name, String, required: true
      argument :email, String, required: true
      argument :password, String, required: true
      argument :password_confirmation, String, required: true

      type Types::Custom::User

      def resolve(**arguments)
        User.create!(arguments)
      end
    end
  end
end
