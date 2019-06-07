module Resolvers
  module Users
    class Users < Resolvers::BaseResolver
      description "Gets all users"

      type [Types::Custom::User], null: false

      def resolve
        ::User.all
      end
    end
  end
end
