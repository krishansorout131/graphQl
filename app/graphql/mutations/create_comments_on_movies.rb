module Mutations
  class CreateCommentsOnMovies < Mutations::BaseMutation
    argument :movie_id, ID, required: true
    argument :comment, String, required: true
    argument :user_id, ID, required: true

    field :movie, Types::MovieType, null: false

    def resolve(movie_id:, comment:, user_id:)
      movie = Movie.find_by(id: movie_id)
      comment = movie.comments.create(comment: comment, user_id: user_id)
      { movie: movie }
    end
  end
end