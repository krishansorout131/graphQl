module Mutations
  class CreateUserMoviesComments < Mutations::BaseMutation
    argument :user, Types::UserInputType, required: true
    argument :movie, Types::MovieInputType, required: true
    argument :comment, String, required: true

    field :user, Types::UserType, null: false
    
    def resolve(user:, movie:, comment:)
      # debugger
      new_user = User.create!(
        email: user[:email],
        first_name: user[:firstName],
        last_name: user[:lastName]
      )
  
      movie = new_user.movies.create!(
        title: movie[:title],
        year: movie[:year],
        genre: movie[:genre]
      )
      comment = movie.comments.create(comment: comment, user_id: new_user.id)
      
      { user: new_user }

    end
    

  end

end