require "rails_helper"

module Mutations
  module Authors
    RSpec.describe CreateAuthor, type: :request do
      describe ".resolve" do
        it "creates an author" do
          expect { graphql_request(query) }.to change { Author.count }.by(1)
        end

        it "returns the created author" do
          graphql_request(query)

          expect(json_response["data"]["createAuthor"]).to include(
            "id" => an_instance_of(String),
            "firstName" => "John",
            "lastName" => "Doe",
            "fullName" => "John Doe",
            "dateOfBirth" => "1980-01-02"
          )
        end
      end

      def query
        <<~GQL
          mutation {
            createAuthor(
              firstName: "John"
              lastName: "Doe"
              dateOfBirth: "1980-01-02"
            ) {
              id
              firstName
              lastName
              fullName
              dateOfBirth
            }
          }
        GQL
      end
    end
  end
end
