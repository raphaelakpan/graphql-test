require "rails_helper"

module Mutations
  module Books
    RSpec.describe UpdateBook, type: :request do
      describe ".resolve" do
        let(:book) { create(:book, title: "ABC", genre: "Mystery") }

        it "updates a book and returns the updated book" do
          graphql_request(query(book.id))

          expect(book.reload).to have_attributes(
            title: "XYZ",
            genre: "Horror"
          )
          expect(json_response["data"]["updateBook"]).to include(
            "id" => book.id.to_s,
            "title" => "XYZ",
            "publicationDate" => book.publication_date,
            "genre" => "Horror",
            "author" => {
              "id" => an_instance_of(String)
            }
          )
        end
      end

      def query(id)
        <<~GQL
          mutation {
            updateBook(
              id: #{id}
              title: "XYZ"
              genre: Horror
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
