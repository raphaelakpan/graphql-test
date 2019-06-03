require "rails_helper"

module Mutations
  module Books
    RSpec.describe DestroyBook, type: :request do
      describe ".resolve" do
        let(:book) { create(:book) }

        it "deletes a book and returns the deleted book" do
          graphql_request(query(book.id))

          expect { Book.find(book.id) }.to raise_error(ActiveRecord::RecordNotFound)
          expect(json_response["data"]["destroyBook"]).to include(
            "id" => book.id.to_s,
            "title" => book.title,
            "publicationDate" => book.publication_date,
            "genre" => book.genre,
            "author" => {
              "id" => book.author_id.to_s
            }
          )
        end
      end

      def query(id)
        <<~GQL
          mutation {
            destroyBook(
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
