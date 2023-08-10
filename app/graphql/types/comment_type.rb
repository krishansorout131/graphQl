# frozen_string_literal: true

module Types
  class CommentType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :movie_id, Integer, null: false
    field :comment, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :movie_name, String, null: false
    field :user_name, String, null: false

    def movie_name
      object.movie.title
    end

    def user_name
      object.user.first_name + object.user.last_name
    end
  end
end
