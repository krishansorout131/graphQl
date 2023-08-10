module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :users, [Types::UserType], null: false
    def users
      User.all.includes(movies: {comments: :user})
    end
    field :fetch_users, resolver: Queries::FetchUsers
    # Here we are only defined the field/methods and the implementaion of the methods is present in separtae files

    # Get a specific user
    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end
    # field :message, String, null: true
    def user(id:)
      User.find_by(id: id)
    end
    
    field :all_movies, [Types::MovieType], null: true
    def all_movies
      Movie.all.includes(:comments)
    end
  end
end
