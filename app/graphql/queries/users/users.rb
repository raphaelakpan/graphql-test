module Queries
  module Users
    class Users < Queries::BaseQuery
      description "Gets all users"

      type [Types::Custom::User], null: false

      def resolve
        ::User.all
      end
    end
  end
end
