module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end

    field :create_user, mutation: Mutations::CreateUser

    field :delete_user, mutation: Mutations::DeleteUser

    field :edit_user, mutation: Mutations::EditUser

    field :create_user_movies, mutation: Mutations::CreateUserMovies

    field :create_user_and_movies, mutation: Mutations::CreateUserAndMovies

    field :create_user_movies_comments, mutation: Mutations::CreateUserMoviesComments

    field :create_comments_on_movies, mutation: Mutations::CreateCommentsOnMovies

    field :delete_movie, mutation: Mutations::DeleteMovie
    
  end
end
