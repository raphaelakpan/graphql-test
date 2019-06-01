module Types
  module Custom
    class Book < Types::BaseObject
      field :author, Types::Custom::Author, null: false
      field :genre, Types::Enums::Genre, null: false

      field :id, ID, null: false

      field :publication_date, Integer, null: false
      field :title, String, null: false
    end
  end
end
