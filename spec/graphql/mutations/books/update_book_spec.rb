require "rails_helper"

module Mutations
  module Books
    RSpec.describe UpdateBook, type: :request do
      describe ".resolve" do
        it "updates a book and returns the updated book" do
          book = create(:book, title: "ABC", genre: "Mystery")

          post "/graphql", params: { query: query(id: book.id) }

          data = JSON.parse(response.body)["data"]["updateBook"]

          expect(book.reload).to have_attributes(
            title: "XYZ",
            genre: "Horror"
          )
          expect(data).to include(
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

      def query(id:)
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
