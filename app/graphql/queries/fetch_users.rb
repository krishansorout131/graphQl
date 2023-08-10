module Queries
  class FetchUsers < Queries::BaseQuery
    
    type Types::UserResponseType, null: false
    

    def resolve
      users = User.includes(:movies)
      message = "All users fetched"      
      { message: message, users: users, error: "Testing the error" }
      
    end
  end
end