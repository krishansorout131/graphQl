module QueryMethods
  
  field :users, [Types::UserType], null: false
  def users
    User.all.includes(:movies)
  end

    # Get a specific user
  field :user, Types::UserType, null: false do
    argument :id, ID, required: true
  end
  def user(id:)
    User.find(id)
  end
end