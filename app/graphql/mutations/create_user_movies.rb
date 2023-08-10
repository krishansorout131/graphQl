class Mutations::CreateUserMovies < Mutations::BaseMutation
  argument :user_id, ID, required: true
  argument :title, String, required: true
  argument :year, Integer, required: true
  argument :genre, String, required: true
  
  field :user, Types::UserType, null: false
  field :message, String, null: false

  def resolve(user_id:, title:, year:, genre:)
    user = User.find_by(id: user_id)
    if user
      user.movies.create(title: title, year: year, genre: genre)
      message = "Movie added successfully!"
    else
      message = "User not found!"
    end
    {user: user, message: message}
  end
end