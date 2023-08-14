# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    # argument :id, ID, required: false

    field :id, ID, null: false
    field :email, String
    field :first_name, String
    field :last_name, String
    field :full_name, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :movies_count, Integer, null: true
    field :movies, [Types::MovieType], null: true
    field :testing, String, null: true do
      argument :id, String, required: true
      argument :name, String, required: true
    end

    field :comments, [Types::CommentType], null: true
    
    def movies_count
      object.movies.size
    end

    def testing(id:, name:)
      "#{id} is the #{name}"
    end

    def full_name
      [object.first_name&.strip, object.last_name&.strip].compact.join(" ")
    end
  end
end
