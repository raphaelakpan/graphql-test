require "rails_helper"

module Resolvers
  module Authors
    RSpec.describe Author, type: :request do
      describe ".resolve" do
        let(:author) { create(:author) }
        let!(:book) { create(:book, author: author) }

        it "returns an author for the provided id" do
          graphql_request(query(author.id))

          expect(json_response["data"]["author"]).to include(
            "id" => author.id.to_s,
            "firstName" => author.first_name,
            "lastName" => author.last_name,
            "fullName" => author.full_name,
            "dateOfBirth" => author.date_of_birth.to_s,
            "books" => [
              {
                "id" => book.id.to_s
              }
            ]
          )
        end
      end

      def query(id)
        <<~GQL
          query {
            author(
              id: #{id}
            ) {
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
