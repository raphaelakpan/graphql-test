require "rails_helper"

module Queries
  module Books
    RSpec.describe Book, type: :request do
      describe ".resolve" do
        let(:book) { create(:book) }

        it "returns a book for the provided id" do
          graphql_request(query(book.id))

          expect(json_response["data"]["book"]).to include(
            "id" => book.id.to_s,
            "title" => book.title,
            "genre" => book.genre,
            "publicationDate" => book.publication_date,
            "author" => {
              "id" => book.author_id.to_s
            }
          )
        end
      end

      def query(id)
        <<~GQL
          query {
            book(
              id: #{id}
            ) {
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
