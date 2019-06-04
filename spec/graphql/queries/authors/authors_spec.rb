require "rails_helper"

module Queries
  module Authors
    RSpec.describe Authors, type: :request do
      describe ".resolve" do
        let!(:author1) { create(:author) }
        let!(:author2) { create(:author) }
        let!(:book1) { create(:book, author: author1) }

        it "returns all authors" do
          graphql_request(query)

          expect(json_response["data"]["authors"]).to match_array [
            hash_including(
              "id" => author1.id.to_s,
              "firstName" => author1.first_name,
              "lastName" => author1.last_name,
              "fullName" => author1.full_name,
              "dateOfBirth" => author1.date_of_birth.to_s,
              "books" => [
                {
                  "id" => book1.id.to_s
                }
              ]
            ),
            hash_including(
              "id" => author2.id.to_s,
              "firstName" => author2.first_name,
              "lastName" => author2.last_name,
              "fullName" => author2.full_name,
              "dateOfBirth" => author2.date_of_birth.to_s,
              "books" => []
            )
          ]
        end
      end

      def query
        <<~GQL
          query {
            authors {
              id
              firstName
              lastName
              fullName
              dateOfBirth
              books {
                id
              }
            }
          }
        GQL
      end
    end
  end
end
