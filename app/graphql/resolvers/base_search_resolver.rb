require 'search_object'
require 'search_object/plugin/graphql'

module Resolvers
  class BaseSearchResolver
    include SearchObject.module(:graphql)
  end
end
