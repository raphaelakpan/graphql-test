module GraphqlHelper
  def json_response
    JSON.parse(response.body)
  end

  def graphql_request(query)
    post "/graphql", params: { query: query }
  end
end
