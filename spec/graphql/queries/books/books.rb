require "rails_helper"

module Resolvers
  module Books
    RSpec.describe Books, type: :request do
      describe ".resolve" do
        let!(:book1) { create(:book) }
        let!(:book2) { create(:book) }

        it "returns all books" do
          graphql_request(query)

          expect(json_response["data"]["books"]).to match_array [
            hash_including(
              "id" => book1.id.to_s,
              "title" => book1.title,
              "genre" => book1.genre,
              "publicationDate" => book1.publication_date,
              "author" => {
                "id" => book1.author_id.to_s
              }
            ),
            hash_including(
              "id" => book2.id.to_s,
              "title" => book2.title,
              "genre" => book2.genre,
              "publicationDate" => book2.publication_date,
              "author" => {
                "id" => book2.author_id.to_s
              }
            )
          ]
        end
      end

      def query
        <<~GQL
          query {
            books {
              id
              title
              genre
              publicationDate
              author {
                id
              }
            }
          }
        GQL
      end
    end
  end
end
