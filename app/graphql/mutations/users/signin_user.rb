module Mutations
  module Users
    class SigninUser < Mutations::BaseMutation
      description "Authenticates a user"

      argument :email, String, required: true
      argument :password, String, required: true

      field :user, Types::Custom::User, null: true
      field :token, String, null: true

      def resolve(**attributes)
        encoded = ::Users::EncodeUser.new(attributes).perform
        {
          user: encoded[:user],
          token: encoded[:token]
        }
      end
    end
  end
end
