require "rails_helper"

module Mutations
  module Books
    RSpec.describe CreateBook, type: :request do
      let(:author) { create(:author) }

      describe ".resolve" do
        it "creates a book" do
          expect {
            graphql_request(query(author.id))
          }.to change { Book.count }.by(1)
        end

        it "returns a book" do
          graphql_request(query(author.id))

          expect(json_response["data"]["createBook"]).to include(
            "id" => an_instance_of(String),
            "title" => "Tripwire",
            "publicationDate" => 1999,
            "genre" => "Thriller",
            "author" => {
              "id" => author.id.to_s
            }
          )
        end
      end

      def query(author_id)
        <<~GQL
          mutation {
            createBook(
              authorId: #{author_id}
              title: "Tripwire"
              publicationDate: 1999
              genre: Thriller
            ) {
              id
              title
              publicationDate
              genre
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
