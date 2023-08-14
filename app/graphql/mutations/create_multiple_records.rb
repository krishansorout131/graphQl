module Mutations
  class CreateMultipleRecords < Mutations::BaseMutation
    argument :params, GraphQL::Types::JSON, required: true
        
    field :user, Types::UserType, null: false
    
  
    def resolve(params:)
      user = User.create!(
        email: params["user"][:email],
        first_name: user_params[:user][:firstName],
        last_name: user_params[:user][:lastName]
      )
  
      movie = user.movies.create!(
        title: user_params[:movie][:title],
        year: user_params[:movie][:year],
        genre: user_params[:movie][:genre]
      )
  
      { user: user }
    end
  end
end