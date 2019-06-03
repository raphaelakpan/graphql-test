require "rails_helper"

module Mutations
  module Authors
    RSpec.describe DestroyAuthor, type: :request do
      describe ".resolve" do
        let(:author) { create(:author) }

        it "deletes an author and returns the deleted author" do
          graphql_request(query(author.id))

          expect { Author.find(author.id) }.to raise_error(ActiveRecord::RecordNotFound)
          expect(json_response["data"]["destroyAuthor"]).to include(
            "id" => author.id.to_s,
            "firstName" => author.first_name,
            "lastName" => author.last_name,
            "fullName" => author.full_name,
            "dateOfBirth" => author.date_of_birth.to_s
          )
        end
      end

      def query(id)
        <<~GQL
          mutation {
            destroyAuthor(
              id: #{id}
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
