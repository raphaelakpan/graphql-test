module Resolvers
  class BaseResolver < GraphQL::Schema::Resolver

    def current_user
      context[:current_user]
    end

    def require_current_user
      raise StandardError.new("Not Authorized") unless current_user
    end
  end
end
