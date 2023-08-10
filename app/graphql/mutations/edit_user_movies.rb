module Mutations
  class EditUserMovies < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :movie_id, ID, required: true
    argument :title, String, required: true
    argument :year, Integer, required: true
    argument :genre, String, required: true

    field :user, Types::UserType, null: false
  
    def resolve(args)
      user = User.find_by(id: args[:id])
      movie = user.movies.find_by(id: args[:movie_id])
      movie.update(title: args[:title], year: args[:year], genre: args[:genre])
      {user: user}
    end
  end

end