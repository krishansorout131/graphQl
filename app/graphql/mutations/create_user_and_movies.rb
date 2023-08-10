module Mutations
  class CreateUserAndMovies < Mutations::BaseMutation

    # argument :first_name, String, required: true
    # argument :last_name, String, required: true
    # argument :email, String, required: true
  
    # argument :title, String, required: true
    # argument :year, Integer, required: true
    # argument :genre, String, required: true
  
    # field :user, Types::UserType, null: false
    # field :message, String, null: false
  
    # def resolve(args)
    #   debugger
    #   user = User.new(first_name: args[:first_name], last_name: args[:last_name], email: args[:email])
    #   if user.save
    #     user.movies.create(title: args[:title], year: args[:year], genre: args[:genre])
    #     { user: user, message: "User created with movies in account successfully!" }
    #   else
    #     { user: nil, message: "There is some issue in user creation"}
    #   end
    # end
  
    argument :user, Types::UserInputType, required: true
    argument :movie, Types::MovieInputType, required: true
    
    field :user, Types::UserType, null: false
    
  
    def resolve(user:, movie:)
      user = User.create!(
        email: user[:email],
        first_name: user[:firstName],
        last_name: user[:lastName]
      )
  
      movie = user.movies.create!(
        title: movie[:title],
        year: movie[:year],
        genre: movie[:genre]
      )
  
      { user: user }
    end

  end
end


