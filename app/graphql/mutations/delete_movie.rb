module Mutations
  class DeleteMovie < Mutations::BaseMutation
    argument :id, ID, required: true

    field :message, String, null: false
    
    def resolve(id:)
      movie = Movie.find_by(id: id)
      if movie && movie.delete
        message = "Movie deleted successfully!"
      else
        message = "Movie not found!"
      end
      { message: message}
    end

  end
end