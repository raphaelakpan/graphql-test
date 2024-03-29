require "rails_helper"

module Mutations
  module Authors
    RSpec.describe UpdateAuthor, type: :request do
      describe ".resolve" do
        let(:author) { create(:author, first_name: "Jon", last_name: "Snow") }

        it "updates an author and returns the updated author" do
          graphql_request(query(author.id))

          expect(author.reload).to have_attributes(
            id: author.id,
            first_name: "John",
            last_name: "Doe"
          )

          expect(json_response["data"]["updateAuthor"]).to include(
            "id" => author.id.to_s,
            "firstName" => "John",
            "lastName" => "Doe",
            "fullName" => "John Doe",
            "dateOfBirth" => author.date_of_birth.to_s
          )
        end
      end

      def query(id)
        <<~GQL
          mutation {
            updateAuthor(
              id: #{id}
              firstName: "John"
              lastName: "Doe"
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
