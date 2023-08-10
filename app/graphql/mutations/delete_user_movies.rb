module Mutations
  class DeleteUserMovies < Mutations::BaseMutation
    argument :user_id, ID, required: true
    argument :movie_id, ID, required: true

    field :message, String, null: false

    def resolve(args)
      user = User.find_by(id: args[:user_id])
      if user
        movie = user.movies.find_by(id: args[:movie_id])
        if movie && movie.destroy
          { message: "Movie deleted successfully!" }
        else
          { message: "Movie not found!" }
        end
      else
        { message: "User not found!" }
      end
    end
  end
end